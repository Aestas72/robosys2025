#!/bin/bash

ng(){
     echo ${1}行目が違うよ
     res=1
}

a=島田
[ "$a" = 山田 ] || ng "$LINENO"
[ "$a" = 島田 ] || ng "$LINENO"

exit $res
