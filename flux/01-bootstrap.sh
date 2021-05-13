#/bin/sh

flux bootstrap github \
    --components-extra=image-reflector-controller,image-automation-controller \
    --owner=${GITHUB_USER} \
    --repository=secure-gitops \
    --branch=master \
    --path=./clusters/digital_ocean \
    --personal \
    --private \
    --token-auth
