0.6.1.post1 - 2020-05-07
========================

1. Updated to support Python 3 only.
2. Implemented local function `parse_requirements` in setup.py instead of using `pip._internal.req`
   which is no longer supported in the latest `pip`.

0.6.1.post0 - 2019-02-07
========================

1. Changed to use `python-jose[pycryptodome]>=3.0.1` instead of `python-jose-cryptodome`.
