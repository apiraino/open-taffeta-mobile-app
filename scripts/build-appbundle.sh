#!/bin/bash

# Docs: https://flutter.dev/docs/deployment/android

APPBUNDLE=app.aab
APK=app.apks
BUNDLEPATH=build/app/outputs/bundle/release/$APPBUNDLE
APKPATH=build/app/outputs/bundle/release/$APK
BUNDLETOOLPATH=~/Downloads/bundletool-all-0.10.2.jar

rm -f $APKPATH $BUNDLEPATH

echo "Build bundle"
flutter build appbundle --target-platform android-arm,android-arm64

echo "Build APK"
flutter build apk
# flutter build apk --split-per-abi

# TODO

#echo "Build apks"
#echo java -jar $BUNDLETOOLPATH build-apks --bundle=$BUNDLEPATH --output=$APKPATH

# echo "deploy to device"
# echo java -jar $BUNDLETOOLPATH install-apks --apks=$APKPATH

# signed bundle
#java -jar $BUNDLETOOLPATH build-apks --bundle=$BUNDLEPATH --output=$APKPATH
#--ks=/MyApp/keystore.jks
#--ks-pass=file:/MyApp/keystore.pwd
#--ks-key-alias=MyKeyAlias
#--key-pass=file:/MyApp/key.pwd

# echo "Checking APK size"
# java -jar $BUNDLETOOLPATH get-size total --apks=$APKPATH

exit 0
