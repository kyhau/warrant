@ECHO OFF
:: All commands halt the build and throw an error value.

:: Require following environment variables to be set
::   COGNITO_APP_ID
::   COGNITO_USER_POOL_ID
::   COGNITO_TEST_USERNAME
::   COGNITO_TEST_PASSWORD

IF "%PYTHON_VERSION%" == "" (
  SET PYTHON_VERSION="3.6"
)
IF "%PYTHON_VERSION%"=="2.7" (
  SET "PYTHONPATH=c:\Python27\python.exe"
)
IF "%PYTHON_VERSION%"=="3.4" (
  SET "PYTHONPATH=c:\Python34\python.exe"
)
IF "%PYTHON_VERSION%"=="3.6" (
  SET "PYTHONPATH=c:\Python36\python.exe"
)
IF "%PYTHON_VERSION%"=="3.7" (
  SET "PYTHONPATH=c:\Python37\python.exe"
)

virtualenv --python=%PYTHONPATH% env_test || exit /b 1
CALL env_test\Scripts\activate.bat || exit /b 2

python -m pip install -r requirements_test.txt --upgrade || exit /b 3
python -m pip install -e . || exit /b 4

python -m unittest warrant.tests.tests || exit /b 5

python setup.py bdist_wheel || exit /b 6

deactivate || exit /b 7

EXIT /B 0
