#!/bin/bash
# gnucash-encrypt.sh | Curtis Free (http://curtisfree.com)
# "Wraps" a GNUCash session with encryption.
# Idea for such a script found -- I think -- somewhere on the Ubuntu Forums.
# Password used for encryption is actually the SHA-1 hash of the user-supplied pass.
# Password-protected files should be set up prior to running this script.
# You won't be informed if you give an incorrect password. (Bad things might happen!)
# Also, thanks to http://lists.gnupg.org/pipermail/gnupg-users/2002-August/014520.html.

GC_DIR=$HOME/.gnucash      # GNUCash accounts file directory.
GC_FILE=Finances           # GNUCash accounts file.
SHRED_CMD="shred -fuzn 10" # File removal command.

# Get password.
echo -n "Password: "
stty -echo
read password
stty echo
echo
password=`echo $password | openssl sha1` # SHA-1.

# Decrypt the "books" file and remove encrypted version.
echo "Decrypting \"books\" file..."
echo "$password" | gpg --passphrase-fd 0 $HOME/.gnucash/books/${GC_FILE}.gpg &>/dev/null
echo "Shredding old \"books\" file..."
${SHRED_CMD} $HOME/.gnucash/books/${GC_FILE}.gpg &>/dev/null

# Decrypt file and remove encrypted version.
echo "Decrypting accounts file..."
echo "$password" | gpg --passphrase-fd 0 ${GC_DIR}/${GC_FILE}.gpg &>/dev/null
echo "Shredding old accounts file..."
${SHRED_CMD} ${GC_DIR}/${GC_FILE}.gpg &>/dev/null

# Clean up.
unset password

# Run GNUCash.
echo "Starting GNUCash..."
gnucash &>/dev/null # Ready to use specified file.

# Shred logs.
echo "Shredding logs..."
${SHRED_CMD} $HOME/.gnucash/${GC_FILE}*.{log,xac} &>/dev/null

# Remove trace file.
echo "Shredding trace file..."
${SHRED_CMD} /tmp/gnucash.trace &>/dev/null

# Get new password.
echo -n "New password: "
stty -echo
read password
stty echo
echo
password=`echo $password | openssl sha1` # SHA-1.

# Encrypt file and remove the unencrypted version.
echo "Encrypting accounts file..."
echo "$password" | gpg --symmetric --passphrase-fd 0 ${GC_DIR}/${GC_FILE} &>/dev/null
echo "Shredding unencrypted accounts file..."
${SHRED_CMD} ${GC_DIR}/${GC_FILE} &>/dev/null

# Encrypt the "books" file and remove the unencrypted version.
echo "Encrypting \"books\" file..."
echo "$password" | gpg --symmetric --passphrase-fd 0 $HOME/.gnucash/books/${GC_FILE} &>/dev/null
echo "Shredding unencrypted \"books\" file..."
${SHRED_CMD} $HOME/.gnucash/books/${GC_FILE} &>/dev/null

# Clean up.
unset password

