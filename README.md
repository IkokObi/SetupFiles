#SetupFiles
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


## Vimの設定
### 使い方
- vimの最新版をインストール
- neocompleteを使うためにvimを"--with lua"オプションでインストールする必要


### 配置の仕方 
ホームディレクトリの直下に隠しファイル(ディレクトリ)として配置してください。
```
~/.vimrc
~/.vim-dotfiles/
```

### それぞれのファイルの内容
#### vimrc
vimの設定を読み込む元ファイル。詳細な設定は"source"で各々読み込む。
#### basic.vim
vimの基本設定。これだけあれば割と使える。
#### neobundle.vim
pluginの管理をするneobundleの基本設定。
deinに移行したのでコメントアウトされています。
#### dein.vim
pluginの管理をするdeinの基本設定。読み込むpluginは"toml-files"に設定する。
プラグインが不要の場合にはコメントアウトしてください。
#### plugin.vim
pluginの個別の設定。
プラグインをインストールしない場合にはコメントアウトしてください。
#### toml-files
toml形式で記述するファイル。
dein.tomlは毎回読み込まれ、dein_lazy.tomlは特定の条件で読み込まれる


