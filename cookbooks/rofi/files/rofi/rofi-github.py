#!/usr/bin/env python

import json
import os
import re
import subprocess
import sys

from urllib import request

baseUrl = "https://api.github.com"
cacheDir = os.environ["HOME"] + "/.cache/rofi-github"
accessTokenPath = cacheDir + "/access_token"
cachePath = cacheDir + "/cache.json"


def parseLinkHeader(link_header):
    links = [l.strip() for l in link_header.split(',')]
    rels = {}
    pattern = r'<(?P<url>.*)>;\s*rel="(?P<rel>.*)"'
    for link in links:
        group_dict = re.match(pattern, link).groupdict()
        rels[group_dict['rel']] = group_dict['url']
    return rels


def loadAccessToken():
    if not os.path.isfile(accessTokenPath):
        return

    with open(accessTokenPath) as f:
        return f.read().strip()


def loadCache():
    if not os.path.isfile(cachePath):
        return

    with open(cachePath) as f:
        return f.read()


def saveCache(repos):
    with open(cachePath, mode="w") as f:
        f.write(repos)


def fetchRepositories(endpoint, accessToken):
    responses = []

    headers = {
        "Authorization": "token {0}".format(accessToken)
    }
    req = request.Request(endpoint + "?page=0&per_page=100", headers=headers)
    with request.urlopen(req) as res:
        links = parseLinkHeader(res.getheader("Link"))
        responses.append(json.loads(res.read().decode()))

    while "next" in links:
        req = request.Request(links["next"], headers=headers)
        with request.urlopen(req) as res:
            links = parseLinkHeader(res.getheader("Link"))
            responses.append(json.loads(res.read().decode()))

    return responses


def fetchMyRepositories(accessToken):
    return fetchRepositories(baseUrl + "/user/repos", accessToken)


def fetchStarredRepositories(accessToken):
    return fetchRepositories(baseUrl + "/user/starred", accessToken)


def loadRepositories(accessToken):
    cachedData = loadCache()
    if cachedData:
        return json.loads(cachedData)

    multiResponses = []

    multiResponses.append(fetchMyRepositories(accessToken))
    multiResponses.append(fetchStarredRepositories(accessToken))

    repos = [
        repo for responses in multiResponses for repos in responses for repo in repos]
    saveCache(json.dumps(repos))

    return repos


def handleNoAction():
    accessToken = loadAccessToken()
    if not accessToken:
        print("Please save your GitHub access token")
        return

    repos = loadRepositories(accessToken)
    for repo in repos:
        print("{0}: {1}".format(repo["full_name"], repo["description"]))


def handleAction(selected):
    full_name = selected.split(": ")[0]

    subprocess.Popen(["xdg-open", "https://github.com/" +
                      full_name], stdout=subprocess.DEVNULL)


def handleQuery(argv):
    if len(argv) == 1:
        handleNoAction()
    elif len(argv) == 2:
        handleAction(argv[1])


if __name__ == '__main__':
    handleQuery(sys.argv)
