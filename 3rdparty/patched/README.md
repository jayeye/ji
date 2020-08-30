Artefacts in Pypi may be buggy. This directory contains patched versions.

The `repos:` option in the `[python-repos]` stanza in `pants.ini` ensures that
pants will look here first before going to Pypi.

To create a patched version, for example, for `twitter.common.process==0.3.11`:

Assume `$BUILDROOT` is the top-level directory.

```
cd /tmp
pip3 download twitter.common.process
tar xvf twitter.common.process-0.3.11.tar.gz
cd twitter.common.process-0.3.11
rm -rf src/twitter.common.process.egg-info
# make the necessary changes
python3 setup.py bdist_wheel
cp dist/twitter.common.process-0.3.11-py3-none-any.whl ${BUILDROOT}/3rdparty/patched/
```

For good measure:

```
cd ${BUILDROOT}
rm -rf ~/.cache/pants ~/.cache/pip ~/.pex
rm -rf .cache .pants* dist
```
