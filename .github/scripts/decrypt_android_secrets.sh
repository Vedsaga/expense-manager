#!/bin/sh

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="kumzq27kR3tdymDQ3JbjlSngLaI7oR9V0OkOr5wyZv9dTdsQqR" \
--output android/android_keys.zip android/android_keys.zip.gpg

cd android
unzip -q android_keys.zip
cd -

# Copy release-keystore.jks and key.properties to the root directory of android
cp android/keys/release-keystore.jks android/keys/key.properties android

# Check if the files are copied successfully
if [ -f android/release-keystore.jks ] && [ -f android/key.properties ]; then
  echo "Files copied successfully."
else
  echo "Failed to copy files."
fi
