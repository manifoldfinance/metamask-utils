#!/usr/bin/env bash
echo "Checking native macOS tools.."

xcrun --show-sdk-platform-version || exit 127;
/usr/libexec/PlistBuddy || exit 127;

echo "Compiling for Safari Extension support..."
buildNumber='1'
versionNumber=$(cat package.json | jq '.version')


# convert extension
#
# xcrun safari-web-extension-converter \
#   --no-open \
#   --bundle-identifier io.metamask.MetaMask \
#   --force --copy-resources \
#   --project-location ./safari/ ./dist/chrome
#
echo yes | xcrun -l safari-web-extension-converter --force --swift --no-open  --copy-resources --bundle-identifier io.metamask.MetaMask --project-location ./safari/ ./dist/chrome
sleep 1

infoPlist='safari/MetaMaskSafari/MetaMaskSafari/Info.plist'
infoPlistExtension='safari/MetaMaskSafari/MetaMaskSafari\ Extension/Info.plist'

# copy app icons
rm -rf xcode-myext/myext/myext/Assets.xcassets/AppIcon.appiconset
cp -r design/AppIcon.appiconset xcode-myext/myext/myext/Assets.xcassets

echo "Updating plist information..."
# update version and build numbers
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$infoPlist"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "$infoPlistExtension"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $versionNumber" "$infoPlist"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $versionNumber" "$infoPlistExtension"
echo "Setting up App Category..."
# set app category
/usr/libexec/PlistBuddy -c "Add :LSApplicationCategoryType string public.app-category.productivity" "$infoPlist"
sleep 1
echo "Build script finished"

exit 0
