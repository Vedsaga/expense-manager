#!/bin/sh

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="kumzq27kR3tdymDQ3JbjlSngLaI7oR9V0OkOr5wyZv9dTdsQqR" \
--output android/android_keys.zip android/android_keys.zip.gpg && cd android && jar xvf android_keys.zip && cd -
echo $PWD

echo "********1"
ls -d $PWD/android/*
mv ./android/release-keystore.jks ./android/app
echo ./
echo "********2"
search_dir=./android/
for entry in "$search_dir"/*
do
  echo "$entry"
done
FILE=./android/release-keystore.jks
if test -f "$FILE"; then
    echo "$FILE exists."
fi