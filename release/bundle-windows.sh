#!/usr/bin/env bash
#
# Copyright 2015-2018 OpenIndex.de
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

STAFF_TOOL="StaffSupportTool"
CUSTOMER_TOOL="CustomerSupportTool"
VERSION="1.0.0"

SEVENZIP="7z"
SEVENZIP_OPTIONS="-mx=9"
DIR=$( cd $( dirname ${BASH_SOURCE[0]} ) && pwd )
TARGET_DIR="$DIR/target"
FOUND="0"
set -e

if [ -d "$TARGET_DIR/Staff/windows32" ]; then
    FOUND="1"
    echo ""
    echo "----------------------------------------------------------------"
    echo "Creating $STAFF_TOOL-$VERSION-win32.exe..."
    echo "----------------------------------------------------------------"
    echo ""
    rm -f "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.exe"
    cd "$TARGET_DIR/Staff/windows32"
    "$SEVENZIP" a "$SEVENZIP_OPTIONS" \
        "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.7z" .
    cat "$DIR/src/windows/Staff.sfx" > "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.exe"
    cat "$DIR/src/windows/Staff.txt" >> "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.exe"
    cat "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.7z" >> "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.exe"
    rm "$TARGET_DIR/$STAFF_TOOL-$VERSION-win32.7z"
fi

if [ -d "$TARGET_DIR/Staff/windows64" ]; then
    FOUND="1"
    echo ""
    echo "----------------------------------------------------------------"
    echo "Creating $STAFF_TOOL-$VERSION-win64.exe..."
    echo "----------------------------------------------------------------"
    echo ""
    rm -f "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.exe"
    cd "$TARGET_DIR/Staff/windows64"
    "$SEVENZIP" a "$SEVENZIP_OPTIONS" \
        "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.7z" .
    cat "$DIR/src/windows/Staff.sfx" > "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.exe"
    cat "$DIR/src/windows/Staff.txt" >> "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.exe"
    cat "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.7z" >> "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.exe"
    rm "$TARGET_DIR/$STAFF_TOOL-$VERSION-win64.7z"
fi

if [ -d "$TARGET_DIR/Customer/windows32" ]; then
    FOUND="1"
    echo ""
    echo "----------------------------------------------------------------"
    echo "Creating $CUSTOMER_TOOL-$VERSION-win32.exe..."
    echo "----------------------------------------------------------------"
    echo ""
    rm -f "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.exe"
    cd "$TARGET_DIR/Customer/windows32"
    "$SEVENZIP" a "$SEVENZIP_OPTIONS" \
        "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.7z" .
    cat "$DIR/src/windows/Customer.sfx" > "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.exe"
    cat "$DIR/src/windows/Customer.txt" >> "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.exe"
    cat "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.7z" >> "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.exe"
    rm "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win32.7z"
fi

if [ -d "$TARGET_DIR/Customer/windows64" ]; then
    FOUND="1"
    echo ""
    echo "----------------------------------------------------------------"
    echo "Creating $CUSTOMER_TOOL-$VERSION-win64.exe..."
    echo "----------------------------------------------------------------"
    echo ""
    rm -f "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.exe"
    cd "$TARGET_DIR/Customer/windows64"
    "$SEVENZIP" a "$SEVENZIP_OPTIONS" \
        "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.7z" .
    cat "$DIR/src/windows/Customer.sfx" > "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.exe"
    cat "$DIR/src/windows/Customer.txt" >> "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.exe"
    cat "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.7z" >> "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.exe"
    rm "$TARGET_DIR/$CUSTOMER_TOOL-$VERSION-win64.7z"
fi

if [ "$FOUND" == "0" ]; then
    echo "ERROR: No Windows packages were found at $TARGET_DIR"
fi
