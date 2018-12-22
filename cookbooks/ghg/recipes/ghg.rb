ghg 'CircleCI-Public/circleci-cli' do
  cli_name 'circleci'
end
ghg 'golang/dep'
ghg 'hyperhq/pi'
ghg 'kubernetes-sigs/aws-iam-authenticator' do
  cli_name 'i-authenticator'
  alias_name 'aws-iam-authenticator'
end
ghg 'mattn/memo'
ghg 'wantedly/dockertags'
