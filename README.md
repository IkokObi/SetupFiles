# SetupFiles
各種環境の設定を行うファイルをまとめています。

## List
- SetAtCoder.sh
  - AtCoderのpython3(3.4.3)の環境設定

## AtCoderの設定(SetAtCoder.sh)
### 実行方法
```sh:title
$ bash SetAtCoder.sh
```
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

