#!/bin/bash

# https://suzukiiichiro.github.io/posts/2022-07-07-01-getopts-suzuki/
while getopts :a:bc: OPT; do
  case $OPT in
      a) echo "[-a] が指定された(引数=$OPTARG)";;
      b) echo "[-b] が指定された";;
      c) echo "[-c] が指定された(引数=$OPTARG)";;
      :) echo "$OPTARGに引数が指定されていません";;
      ?) echo "$OPTARGは定義されていません";;
  esac
done

# % ./sample-of-getopts.sh -a filename -b -c 100
# [-a] が指定された(引数=filename)
# [-b] が指定された
# [-c] が指定された(引数=100)
