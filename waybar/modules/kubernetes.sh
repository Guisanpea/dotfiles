#!/bin/bash
context=$(kubectx -c 2>/dev/null)
namespace=$(kubens -c 2>/dev/null)

if [[ $namespace == "default" ]]
then
  echo "$context"
else
  echo "$context - $namespace"
fi
