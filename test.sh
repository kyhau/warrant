#!/bin/bash
set -e

# Require following environment variables to be set
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   AWS_DEFAULT_REGION
#   COGNITO_APP_ID
#   COGNITO_USER_POOL_ID
#   COGNITO_TEST_USERNAME
#   COGNITO_TEST_PASSWORD

[[ -z ${PYTHON_VERSION} ]] && PYTHON_VERSION="3.6"

ENV_NAME=env_test

virtualenv -p python${PYTHON_VERSION} ${ENV_NAME}
. ${ENV_NAME}/bin/activate

python -m pip install -r requirements_test.txt --upgrade
python -m pip install -e .

python -m unittest warrant.tests.tests

python setup.py bdist_wheel

# Leave virtual environment
deactivate
