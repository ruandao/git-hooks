#!/bin/sh

# Find all staged Go files
GO_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.go$')

if [ -n "$GO_FILES" ]; then
		echo "Running gofmt on staged Go files..."
		# Format the files in place
		gofmt -w $GO_FILES

		# Add any changes back to the staging area
		git add $GO_FILES
fi