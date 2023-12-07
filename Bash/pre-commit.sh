#!/bin/bash
set +e

# Prompt the user to enter the first string
read -p "Select the type a-all, c-clean, d-deploy, " VAR

# Function: Run cleanup
run_cleanup() {
  echo "------------> clean the code for erros"
  isort .
  find -type f -name '*.py' ! -path '*/debug/*' -exec autopep8 --in-place --aggressive '{}' \;
  echo "------------> All Good"
}

# Function: Run deployment
run_deploy() {
  echo "------------> Deploying docker"
  DOCKER_BUILDKIT=1 docker build -t dsarchive/runcustomaimodel2 .
  echo "------------> All Good"
}

# Function: Run everything
run_everything() {
  run_cleanup
  run_deploy
}

if [ "$VAR" == "c" ]; then
  run_cleanup
fi

if [ "$VAR" == "d" ]; then
  run_deploy
fi

if [ "$VAR" == "a" ]; then
  run_everything
fi
