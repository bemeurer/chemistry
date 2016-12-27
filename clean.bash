#!/usr/bin/env bash

source="${BASH_source[0]}"
while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
  dir="$( cd -P "$( dirname "$source" )" && pwd )"
  source="$(readlink "$source")"
  [[ $source != /* ]] && source="$dir/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
dir="$( cd -P "$( dirname "$source" )" && pwd )"

find $dir -name "*.aux" -type f -delete
find $dir -name "*.fdb_latexmk" -type f -delete
find $dir -name "*.fls" -type f -delete
find $dir -name "*.log" -type f -delete
find $dir -name "*.synctex.gz" -type f -delete
find $dir -name "*.synctex.gz(busy)" -type f -delete
