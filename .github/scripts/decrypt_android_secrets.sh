#!/bin/sh

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="kumzq27kR3tdymDQ3JbjlSngLaI7oR9V0OkOr5wyZv9dTdsQqR" \
--output android/android_keys.zip android/android_keys.zip.gpg && cd android && jar xvf android_keys.zip && cd -
echo $PWD


ls -d $PWD/android/*
mv ./android/release-keystore.jks ./android/app
echo ./
echo "********1"
search_dir=./android//keys
for entry in "$search_dir"/*
do
  echo "$entry"
done
echo "********2"
FILE=./android//keys/release-keystore.jks
if test -f "$FILE"; then
    echo "$FILE exists."
fi