#!/usr/bin/env bash

if git rev-parse --verify HEAD >/dev/null 2>&1
then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=$(${git}/bin/git hash-object -t tree /dev/null)
fi

diff="git diff-index --name-only --cached $against --diff-filter d"

nix_files=($($diff -- '*.nix'))
json_files=($($diff -- '*.json'))
all_files=($($diff))

# Format staged nix files.
if [[ -n "${nix_files[@]}" ]]; then
  nixpkgs-fmt "${nix_files[@]}" \
  && git add "${nix_files[@]}"
fi

if [[ -n "${json_files[@]}" ]]; then
  for json_file in ${json_files[@]}; do
    jq . "${json_file}" > "${json_file}.tmp"
    rm "${json_file}"
    mv "${json_file}.tmp" "${json_file}"
    git add "${json_file}"
  done
fi

# check editorconfig
editorconfig-checker -- "${all_files[@]}"
if [[ $? != '0' ]]; then
  printf "%b\n" \
    "\nCode is not aligned with .editorconfig" \
    "Review the output and commit your fixes" >&2
  exit 1
fi
