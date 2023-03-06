#!/bin/sh

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$ANDROID_KEYS_SECRET_PASSPHRASE" \
--output android/android_keys.zip android/android_keys.zip.gpg

cd android
unzip -q android_keys.zip
cd -

# Copy release-keystore.jks and key.properties to the root directory of android
cp android/keys/release-keystore.jks android/keys/key.properties android
