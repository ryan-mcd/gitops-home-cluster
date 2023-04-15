# Harbor Passthrough-cache

To make harbor work as a passthrough cache, k3s seems to need `/v2`

Thanks @haraldkoch

Below is my registries.yaml with `harbor` substituted for my FQDN

```sh
k3s_registries:
    mirrors:
        docker.io:
            endpoint:
                - https://harbor/v2/dockerhub-proxy
        quay.io:
            endpoint:
                - https://harbor/v2/quay-io-proxy
        ghcr.io:
            endpoint:
                - https://harbor/v2/ghcr-io-proxy
        registry.k8s.io:
            endpoint:
                - https://harbor/v2/registry-k8s-io-proxy
        registry1.dso.mil:
            endpoint:
                - https://harbor/v2/registry1-proxy

system_default_registry: harbor/v2/dockerhub-proxy
```