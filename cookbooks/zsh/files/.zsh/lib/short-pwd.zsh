function short-pwd () {
  echo $(pwd | sed -e "s,^$HOME,~,")
}
