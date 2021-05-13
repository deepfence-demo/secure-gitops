#/bin/sh

flux create image update flux-system \
    --git-repo-ref=flux-system \
    --git-repo-path="./clusters/digital_ocean" \
    --checkout-branch=master \
    --push-branch=master \
    --author-name=fluxcdbot \
    --author-email=fluxcdbot@users.noreply.github.com \
    --commit-template="{{range .Updated.Images}}{{println .}}{{end}}" \
    --export > ../clusters/digital_ocean/flux-system-automation.yaml

sed -i '' -e '$ d' ../clusters/digital_ocean/flux-system-automation.yaml
