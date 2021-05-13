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
  flux create image policy ${name} \
      --image-ref=${name} \
	  --select-semver='>=0.2.0 <0.3.0' \
      --export > ../clusters/digital_ocean/${name}-policy.yaml
  sed -i '' -e '$ d' ../clusters/digital_ocean/${name}-policy.yaml
done
