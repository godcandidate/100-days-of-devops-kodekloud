#!/bin/bash

REPO_DIR="100-days-of-devops-kodekloud"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚙️  Choose what you want to set up:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1️⃣  Ansible Day Challenges"
echo "2️⃣  SSH Bootstrap"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

read -rp "Enter your choice [1 or 2]: " choice

# Ensure base ansible directory exists
mkdir -p ansible

case "$choice" in
  1)
    cp "$REPO_DIR/shared-inventory/inventory.ini" ansible/ 2>/dev/null || true
    cp -r "$REPO_DIR/shared-inventory/host_vars" ansible/ 2>/dev/null || true

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ Ansible Day Challenges inventory is ready!!"

    ;;
  
  2)
    cp -r "$REPO_DIR/ansible-ssh-bootstrap/"* ansible/ 2>/dev/null || true

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ SSH Bootstrap project is ready!"
    ;;
  
  *)
    echo "❌ Invalid choice. Please run the script again and choose 1 or 2."
    exit 1
    ;;
esac


# Final message
echo ""
echo "📁 Files moved to:  ansible/"
echo ""
echo "👉 To get started, run:"
echo "   cd ansible"
echo ""
echo "💡 Test your inventory with:"
echo "   ansible all -i inventory.ini -m ping"
echo ""
echo "🚀 Happy automating with Ansible!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Clean up
rm -rf "$REPO_DIR"





