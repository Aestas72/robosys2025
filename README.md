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

```bash
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

```

##  テストについて

このリポジトリでは test.bash によりコマンドの自動テストを行っています。

```bash
$ bash ./test.bash
テスト内容（概要）：
強いパスワード → 5/5 が出る
弱いパスワード → 問題点が表示される
空入力 → エラー終了（標準エラー出力 + 終了コード 1）
弱い単語（password など）を含む場合 → 警告が出る
GitHub Actions の test.yml により Python 3.7〜3.12 で自動実行されます。

```

##  必要なソフトウェア
-Python本ソフトウェアは Python 標準ライブラリ（sys, re）を使用しています。
これらは Python ソフトウェア財団ライセンス（PSF License）の下で提供されています。
  -テスト済みバージョン: 3.7〜3.12
-bash
-Ubuntu（GitHub Actions: ubuntu-latest）

##  テスト環境
-Ubuntu 22.04.1
-GitHub Actions（ubuntu-latest）

##  権利関係・ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2025 Natsuhi Shimada


## 謝辞
このプログラムの作成にあたり、以下の講義スライドの考え方を参考にしました。
- [robosys2025（CC-BY-SA 4.0 by Ryuichi Ueda）](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
スライドを参考にしていますが、コードおよび README の文章は自分で作成したものです。


