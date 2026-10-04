#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <version>"
	exit 1
fi

VERSION=$1

# cp LICENSE ./addons/scope_copy/
# cp README.md ./addons/scpe_copy/
sed -i '' "s/version=\".*\"/version=\"$VERSION\"/" ./addons/scratch_pad/plugin.cfg
zip -r scratch_pad-v$VERSION.zip ./addons/scratch_pad -x "*.uid" "*.DS_Store"
