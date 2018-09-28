# SetupFiles
各種環境の設定を行うファイルをまとめています。

## List
- InitialSetup
	- macの初期設定, pythonの環境構築等
- SetAtCoder.sh
	- AtCoderのpython3(3.4.3)の環境設定
- vim
	- 公開リポジトリ"dotfiles"に移動しました

## InitialSetup
### 設定の中身
#### Set.sh
後述のスクリプトのどれを実行するかをまとめているコード
#### init.sh
macosの初期設定をする
#### python_basic.sh
pythonの基本的な環境を構築する
#### python_research.sh
研究に適した環境を構築する
#### python_nlp.sh
自然言語処理に適した環境を構築する

### 実行方法
私のgithubのリポジトリをクローンしてください。
```
git clone https://github.com/IkokObi/SetupFiles.git
cd SetupFiles/InitialSetup
```
Set.shを開き、実行しないスクリプトは"#"でコメントアウトしてください。保存したら以下を実行してください。
```
bash Set.sh
```

###


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


