#!/bin/bash

mkdir -p ansible

# Move shared inventory contents to ../ansible
cp shared-inventory/inventory.ini ansible/ 2>/dev/null || true
cp -r shared-inventory/host_vars ansible/ 2>/dev/null || true


# Final message
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Inventory environment is ready!"
echo ""
echo "📁 Inventory files moved to:  ansible/"
echo ""
echo "👉 To get started, run:"
echo "   cd ansible"
echo "💡 Test your inventory with:"
echo "   ansible all -i inventory.ini -m ping"
echo ""
echo "🚀 Happy automating with Ansible!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Clean up
rm -rf 100-days-of-devops-kodekloud





