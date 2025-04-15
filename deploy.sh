#! /bin/bash

set -e

rm -r dist || true

uv build

uv publish
rm -rf ./build ./dist ./quantplay-mcp.egg-info
