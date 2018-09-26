#SetupFiles
各種環境の設定を行うファイルをまとめています。

## List
- SetAtCoder.sh
	- AtCoderのpython3(3.4.3)の環境設定
- vim
	- 公開リポジトリ"dotfiles"に移動しました

## AtCoderの設定(SetAtCoder.sh)
### 実行方法
AtCoder環境にしたいディレクトリにSetAtCoder.shを配置して
```sh:title
$ bash SetAtCoder.sh
```
と実行してください。

### 以下のプラグインが必要
- pyenv
- pyenv-virtualenv
### 設定される環境
- python 3.4.3
### 使用可能なライブラリ
- numpy, scipy, scikit-learn (AtCoderで認められているライブラリ)
- ipython, jupyter-notebook
### 経緯
最大公約数を求めるmath.gcdがpython3.4.3では使えず、これが原因でWAになったため


