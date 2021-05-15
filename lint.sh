#!/usr/bin/env bash
set -e

. ./scripts/style.sh

while IFS="" read -r file_path
do
  echo -e "${li:?}${file_path:?}"
  shellcheck --check-sourced --enable=all --severity style -x "${file_path:?}"
done < <(find . -name "*.sh" -not -path "./.venv/*")

echo -e "${ok:?}OK!"
