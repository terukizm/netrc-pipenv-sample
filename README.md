netrc-pipenv-sample
======

```
$ NAME=netrc-pipenv-sample
$ GITHUB_TOKEN=xxxxxxxxxxxxxxxxxxxxx

$ docker build --build-arg GITHUB_TOKEN=${GITHUB_TOKEN} -t ${NAME}:latest .
...

$ docker run -i -t {$NAME}:latest
message: This is My Private Lib.
```
