#!/bin/bash

APKNAME=app-release.apk
APKPATH=build/app/outputs/apk/release/$APKNAME

pushd android
./gradlew assemble
popd
cp $APKPATH ~/tmp
ls -la ~/tmp/$APKNAME
echo "copied in ~/tmp/$APKNAME"

exit 0
