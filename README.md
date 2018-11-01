# SetupFiles
各種環境の設定を行うファイルをまとめています。

## List
- [Initial_Setup](#Initial_Setup)
	- macの初期設定
- [Python_Setup](#Python)
	- Pythonの環境構築
- [NLP_Setup](#NLP)
	- 自然言語処理の環境構築
- [AtCoder_Setup](#AtCoder)
	- AtCoderのpython3(3.4.3)の環境設定
- vim
	- 公開リポジトリ<a href="https://github.com/IkokObi/dotfiles" target="_blank">dotfiles</a>に移動しました

### 実行方法
私のgithubのリポジトリをクローンしてください。
```
$ git clone https://github.com/IkokObi/SetupFiles.git
```
設定したい環境のディレクトリに入ってください(ここでは"(Target)"と表現しています)
```
$ cd SetupFiles/(Target)_Setup
```
以下のようにしてシェルスクリプトを実行してください。
(ドット[半角スペース]"シェルスクリプト名".sh)
```
$ . (Target).sh
```

## Initial_Setup
#### envset_init.sh
- macosの初期設定をする
#### brew_list.txt
- Homebrewでインストールするアプリ
#### cask_list.txt
- Homebrew-caskでインストールするアプリ
#### mas_list.txt
- masでインストールするApp Storeのアプリ
#### envset_tex.sh
- mactex2018の環境を構築する


<a name="Python"></a>
## Python_Setup
#### envset_python.sh
- pyenvを通じてpython(anaconda等)をインストール
#### conda.txt
- conda経由でインストールするライブラリ
#### pip.txt
- pip経由でインストールするライブラリ


<a name="NLP"></a>
## NLP_Setup
#### envset_nlp.sh
- MeCab, neologd, JUMAN++, JUMAN, KNPをインストール


<a name="AtCoder"></a>
## AtCoderSetup
### 以下のプラグインが必要
- pyenv
- pyenv-virtualenv

### 実行方法
私のgithubのリポジトリをクローンしてください。(既に上でクローンしてある場合は不要)
```
$ git clone https://github.com/IkokObi/SetupFiles.git
```
AtCoderSetupディレクトリに入り、以下のように実行してください。
```
$ cd SetupFiles/AtCoderSetup
$ . atcoder_env.sh
```
ここまででpyenvの仮想環境に"atcoder"と名前のついたpython環境があるはずです。
以下のコマンドで仮想環境の一覧が表示されます。
```
$ pyenv versions
```
AtCoderに取り組むディレクトリ内で以下のように仮想環境を設定してください。
```
$ pyenv local atcoder
```

### 設定される環境
- Python:3.4.3
### 使用可能なライブラリ
atcoder_env_list.txtの2行目以降に記載されています。ただし、AtCoderのコードテストでscikit-learnをimport出来なかったので(Ikokの知識不足の可能性あり)scikit-learnは使わない方がいいかと思います。
- numpy==1.8.2
- scipy==0.13.3
- scikit-learn

ipythonやjupyter-notebookを使えるようにしてあります。

### 経緯
最大公約数を求めるmath.gcdがpython3.4.3では使えず、これが原因でWAになったため


