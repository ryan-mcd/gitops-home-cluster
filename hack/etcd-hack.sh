#!/usr/bin/env bash

set -eux

etcd_version=v3.5.3

case "$(uname -m)" in
    aarch64) arch="arm64" ;;
    x86_64) arch="amd64" ;;
esac;

etcd_name="etcd-${etcd_version}-linux-${arch}"

curl -sSfL "https://github.com/etcd-io/etcd/releases/download/${etcd_version}/${etcd_name}.tar.gz" \
    | tar xzvf - -C /usr/local/bin --strip-components=1 "${etcd_name}/etcdctl"

etcdctl version


export ETCDCTL_ENDPOINTS="https://127.0.0.1:2379"
export ETCDCTL_CACERT="/var/lib/rancher/k3s/server/tls/etcd/server-ca.crt"
export ETCDCTL_CERT="/var/lib/rancher/k3s/server/tls/etcd/server-client.crt"
export ETCDCTL_KEY="/var/lib/rancher/k3s/server/tls/etcd/server-client.key"
export ETCDCTL_API=3
etcdctl defrag --cluster

# curl https://raw.githubusercontent.com/Ryan-McD/gitops-home-cluster/main/hack/etcd-hack.sh | sudo bash
# Finished defragmenting etcd member[https://10.24.0.20:2379]
# Finished defragmenting etcd member[https://10.24.0.21:2379]
# Finished defragmenting etcd member[https://10.24.0.22:2379]