#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Natsuhi Shimada
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

####################
# NORMAL INPUT
####################
out=$(echo "Aa1!abcd" | ./pwcheck)
echo "$out" | grep -q "^5$" || ng "$LINENO"

####################
# WEAK INPUT
####################
out=$(echo "abc" | ./pwcheck)
err=$(echo "abc" | ./pwcheck 2>&1 >/dev/null)

echo "$out" | grep -q "^1$" || ng "$LINENO"
echo "$err" | grep -q "問題点" || ng "$LINENO"

####################
# EMPTY INPUT
####################
out=$(echo "" | ./pwcheck)
status=$?

[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

####################
# WEAK WORD INPUT
####################
out=$(echo "Password123!" | ./pwcheck)
err=$(echo "Password123!" | ./pwcheck 2>&1 >/dev/null)

echo "$out" | grep -q "^5$" || ng "$LINENO"
echo "$err" | grep -q "弱い単語" || ng "$LINENO"

####################
# SYMBOL ONLY
####################
out=$(echo "!!!!!!!!" | ./pwcheck)
err=$(echo "!!!!!!!!" | ./pwcheck 2>&1 >/dev/null)

echo "$out" | grep -q "^2$" || ng "$LINENO"
echo "$err" | grep -q "小文字が含まれていません" || ng "$LINENO"

####################
# JAPANESE INPUT (unexpected multibyte)
####################
out=$(echo "あいうえお" | ./pwcheck)
echo "$out" | grep -q "^1$" || ng "$LINENO"

####################
# SPACE INCLUDED
####################
out=$(echo "Aa1 abcd!" | ./pwcheck)
echo "$out" | grep -q "^5$" || ng "$LINENO"

####################
# BOUNDARY LENGTH (exactly 8 chars)
####################
out=$(echo "Aa1!abcd" | ./pwcheck)
echo "$out" | grep -q "^5$" || ng "$LINENO"

####################
# DIGIT ONLY
####################
out=$(echo "12345678" | ./pwcheck)
echo "$out" | grep -q "^2$" || ng "$LINENO"

####################
# ALPHABET ONLY
####################
out=$(echo "ABCDEFGH" | ./pwcheck)
echo "$out" | grep -q "^2$" || ng "$LINENO"

####################
# VERY LONG INPUT
####################
out=$(printf 'Aa1!%.0s' {1..1000} | ./pwcheck)
echo "$out" | grep -q "^5$" || ng "$LINENO"

####################
# RESULT
####################
[ "$res" = 0 ] && echo OK
exit $res

