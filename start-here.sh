#!/bin/bash

set -e

NODES=(
  "k8s-10-mgmt-1.mgmt.hss.int"
  "k8s-10-mgmt-2.mgmt.hss.int"
  "k8s-10-mgmt-3.mgmt.hss.int"
)

for NODE in "${NODES[@]}"; do
  echo "Entferne Taint von $NODE ..."
  kubectl taint nodes "$NODE" node.cloudprovider.kubernetes.io/uninitialized:NoSchedule-
done

echo "Alle gewünschten Taints wurden entfernt."
echo "Denk dran, Sizing der Nodes überprüfen!"