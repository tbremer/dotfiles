#!/usr/bin/env bash
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

function appify() {
	FILENAME=$(basename "$2")
	APPNAME="${FILENAME%.*}"
	APP_PATH="$APPNAME.app"

	DIR="$APP_PATH/Contents/MacOS";

	ICON="$3"
	ICON_PATH="$APP_PATH/Contents/Resources"

	PLIST_PATH="$APP_PATH/Contents"

	if [ -e "$APP_PATH" ]; then
		echo "$PWD/$APPNAME.app already exists :("
		return 1
	fi

	mkdir -p "${DIR}";
	mkdir -p "$ICON_PATH"
	mkdir -p "$PLIST_PATH"

	cp "${1}" "${DIR}/${APPNAME}";
	cp "$ICON" "$ICON_PATH/$APPNAME"

	cat <<EOF > "$PLIST_PATH/Info.plist"
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
		<dict>
			<key>CFBundleExecutable</key>
			<string>$APPNAME</string>
			<key>CFBundleGetInfoString</key>
			<string>$APPNAME</string>
			<key>CFBundleIconFile</key>
			<string>$APPNAME</string>
			<key>CFBundleName</key>
			<string>$APPNAME</string>
			<key>CFBundlePackageType</key>
			<string>APPL</string>
			<key>CFBundleSignature</key>
			<string>4242</string>
		</dict>
	</plist>
EOF

	chmod +x "${DIR}/${APPNAME}";

	echo "${PWD}/$APPNAME.app";
}
