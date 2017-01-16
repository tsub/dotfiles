### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
PRIMARY_FG=black

# Characters
function {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  SEGMENT_SEPARATOR="\ue0b0"
  PLUSMINUS="\u00b1"
  BRANCH="\ue725"
  DETACHED="\u27a6"
  CROSS="\u2718"
  LIGHTNING="\u26a1"
  GEAR="\u2699"
  ARROW="\u276f"
  RUBY="\ue791"
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n ${1} ]] && bg="%K{${1}}" || bg="%k"
  [[ -n ${2} ]] && fg="%F{${2}}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && ${1} != $CURRENT_BG ]]; then
    print -n "%{${bg}%F{${CURRENT_BG}}%}${SEGMENT_SEPARATOR}%{${fg}%}"
  else
    print -n "%{${bg}%}%{${fg}%}"
  fi
  CURRENT_BG=${1}
  [[ -n ${3} ]] && print -n ${3}
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{${CURRENT_BG}}%}${SEGMENT_SEPARATOR}"
  else
    print -n "%{%k%}"
  fi
  print -n "\n%{%F{blue}%}${ARROW}%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ ${USER} != ${DEFAULT_USER} || -n ${SSH_CONNECTION} ]]; then
    prompt_segment ${PRIMARY_FG} default " %(!.%{%F{yellow}%}.)${USER}@%m "
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref=${vcs_info_msg_0_}
  if [[ -n ${ref} ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} ${PLUSMINUS} "
    else
      color=green
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == ${ref} ]]; then
      ref="${BRANCH} ${ref}"
    else
      ref="${DETACHED} ${ref/.../}"
    fi
    prompt_segment ${color} ${PRIMARY_FG}
    print -Pn " ${ref}"
  fi
}

prompt_rbenv() {
  prompt_segment red default " ${RUBY} $(rbenv_version) "
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue ${PRIMARY_FG} " $(short-pwd) "
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ ${RETVAL} -ne 0 ]] && symbols+="%{%F{red}%}${CROSS}"
  [[ ${UID} -eq 0 ]] && symbols+="%{%F{yellow}%}${LIGHTNING}"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}${GEAR}"

  [[ -n ${symbols} ]] && prompt_segment ${PRIMARY_FG} default " ${symbols} "
}

## Main prompt
prompt_tsub_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_rbenv
  prompt_end
}

prompt_tsub_precmd() {
  vcs_info
  PROMPT='
%{%f%b%k%}$(prompt_tsub_main) '
}

prompt_tsub_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_tsub_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_tsub_setup "$@"
