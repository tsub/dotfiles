# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command awslocal --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
