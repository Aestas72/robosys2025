# pwcheck — パスワード強度チェッカー
![test](https://github.com/Aestas72/robosys2025/actions/workflows/test.yml/badge.svg)

`pwcheck` は、標準入力から受け取った文字列をパスワードとして評価し、  
安全性を 5 段階で判定するコマンドです。

長さ・文字種・記号の有無・弱い単語の含有などの観点からスコアを算出し、  
問題点があれば標準出力に一覧として表示します。

---

##  インストール方法

```bash
$ git clone https://github.com/USERNAME/robosys2025.git
$ cd robosys2025
$ chmod +x pwcheck

```

##  使い方

パスワードは 標準入力から受け取ります。

・強度の高い例
$ echo "Aa1!abcd" | ./pwcheck
5/5

・問題点がある例
$ echo "abc" | ./pwcheck
1/5
問題点:
 - 8文字未満
 - 小文字が含まれていません
 - 大文字が含まれていません
 - 数字が含まれていません
 - 記号が含まれていません

・空入力はエラー（標準エラー出力）
$ echo "" | ./pwcheck
エラー: 空の入力は無効です

- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 Natsuhi Shimada
