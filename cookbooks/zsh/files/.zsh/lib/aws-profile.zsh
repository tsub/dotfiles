function aws-profile() {
  if [ -n "$AWS_PROFILE" ]; then
    echo $AWS_PROFILE
  else
    echo default
  fi
}
