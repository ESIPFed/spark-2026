#!/usr/bin/env bash
#
# Create one speakers yaml file to include with the cookiecutter.yaml
#
# This script is meant to be called only within the 'script' directory

# Go to the speakers directory (silently)
pushd ../speakers/ > /dev/null

# Merge all individual files, excluding template and header files
find . -type f -name '*.yaml' \
  ! -name speakers.yaml ! -name speakers_people.yaml \
  ! -name template.yaml ! -name header.yaml | \
  sort | xargs -I '{}' sh -c "cat '{}'; echo" > speakers_people.yaml

# Indent to proper yaml
sed -i 's/^/  /' speakers_people.yaml

# Create the final speakers file
cat header.yaml speakers_people.yaml > speakers.yaml

# Remove temporary files
rm speakers_people.yaml

# Go back where we came from
popd > /dev/null

echo "Speakers.yaml created"
