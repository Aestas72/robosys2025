#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Natsuhi Shimada
# SPDX-License-Identifier: BSD-3-Clause

ng () {
       echo "${1}行目が違うよ"
       res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "Aa1!abcd" | ./pwcheck)
echo "$out" | grep -q "^5/5" || ng "$LINENO"

### WEAK INPUT ###
out=$(echo "abc" | ./pwcheck)
echo "$out" | grep -q "問題点" || ng "$LINENO"

### EMPTY INPUT ###
out=$(echo "" | ./pwcheck)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### WEAK WORD INPUT ###
out=$(echo "Password123!" | ./pwcheck)
echo "$out" | grep -q "弱い単語" || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res


