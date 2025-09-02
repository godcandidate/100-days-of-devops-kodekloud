#!/bin/bash

# Move shared inventory contents to ansible directory
mkdir -p ansible
cp shared-inventory/inventory.ini ansible/ 2>/dev/null || true
cp -r shared-inventory/host_vars ansible/ 2>/dev/null || true

# Clean up
cd ..
rm -rf s

echo "Inventory environment ready!"
echo "📁 All necessary files moved to ./ansible/"

rm -rf 100-days-of-devops-kodekloud
cd


