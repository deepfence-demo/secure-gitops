#/bin/sh

registry=registry.deepfence.net
repo=(
  adservice
  cartservice
  checkoutservice
  currencyservice
  emailservice
  frontend
  paymentservice
  productcatalogservice
  recommendationservice
  shippingservice
)

for name in "${repo[@]}"; do
  flux create image repository ${name} \
      --image=${registry}/${name} \
      --interval=0m30s \
      --export > ../clusters/digital_ocean/${name}-registry.yaml
  sed -i '' -e '$ d' ../clusters/digital_ocean/${name}-registry.yaml
  echo "  secretRef:" >> ../clusters/digital_ocean/${name}-registry.yaml
  echo "    name: ${registry}" >> ../clusters/digital_ocean/${name}-registry.yaml
done
