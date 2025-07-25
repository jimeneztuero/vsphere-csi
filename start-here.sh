#!/bin/bash

set -e

NODES=(
  "node1"
  "node2"
  "node3"
)

for NODE in "${NODES[@]}"; do
  echo "Entferne Taint von $NODE ..."
  kubectl taint nodes "$NODE" node.cloudprovider.kubernetes.io/uninitialized:NoSchedule-
done

echo "Alle gewünschten Taints wurden entfernt."
echo "Denk dran, Sizing der Nodes überprüfen!"
