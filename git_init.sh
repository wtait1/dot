#!/bin/bash
# taken from https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

SSH_DIR="$HOME/.ssh"
SSH_KEY_DIR="$SSH_DIR/personal-github"
SSH_KEY_FILE="$SSH_KEY_DIR/key"
SSH_CONFIG="$SSH_DIR/config"

# 1. Generate SSH key pair
read -p 'Github email: ' GITHUB_EMAIL
read -p 'SSH key passphrase: ' SSH_KEY_PASSPHRASE
mkdir -p "$SSH_KEY_DIR"
echo 'Generating new key pair...'
ssh-keygen -t ed25519 -C "$GITHUB_EMAIL" -P "$SSH_KEY_PASSPHRASE" -f "$SSH_KEY_FILE"

# 2. Add key to ssh-agent
echo 'Adding key to keychain...'
ssh-add --apple-use-keychain "$SSH_KEY_FILE"

# 3. Update SSH config
eval "$(ssh-agent -s)"
touch "$SSH_CONFIG"
echo "Adding github-personal.com config to $SSH_CONFIG..."
cat <<EOF >> "$SSH_CONFIG"

# personal Github account
Host github-personal.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $SSH_KEY_FILE
  # needed to not use default work account set globally in ~/.gitconfig
  # https://stackoverflow.com/a/7927828/17696738
  IdentitiesOnly yes

EOF

# 4. Add public key to Github
echo 'Copying public key...'
pbcopy < "$SSH_KEY_FILE.pub"

echo 'Opening Github to add the public key...'
sleep 3
open https://github.com/settings/ssh/new