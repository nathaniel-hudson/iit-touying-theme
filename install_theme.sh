#!/bin/bash

TOP_DIR="$HOME/Library/Application Support/typst/packages/local"
THEME_NAME='iit-theme'
VERSION='0.1.0'

THEME_DIR="$TOP_DIR/$THEME_NAME/$VERSION"
THEME_FILE='iit-theme.typ'
PROJECT_FILE='typst.toml'
STATIC_DIR="static/"

# Copy the template and project files to the local theme directory.
mkdir -p "${THEME_DIR}"
cp "${THEME_FILE}" "${THEME_DIR}"
cp "${PROJECT_FILE}" "${THEME_DIR}"

# Copy the static files (e.g., images) to the local theme directory.
mkdir -p "${THEME_DIR}/$STATIC_DIR"
cp -R "${STATIC_DIR}" "${THEME_DIR}/$STATIC_DIR"

echo "Theme has been COPIED to directory '${THEME_DIR}'."