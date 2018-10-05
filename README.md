# SetupFiles
各種環境の設定を行うファイルをまとめています。

## List
- [InitialSetup](#InitialSetup)
	- macの初期設定, pythonの環境構築等
- [AtCoderSetup](#AtCoder)
	- AtCoderのpython3(3.4.3)の環境設定
- vim
	- 公開リポジトリ<a href="https://github.com/IkokObi/dotfiles" target="_blank">dotfiles</a>に移動しました

<a name="InitialSetup"></a>
## InitialSetup
### 設定の中身
#### Set.sh
後述のスクリプトのどれを実行するかをまとめているコード
#### init.sh
macosの初期設定をする
#### python_normal.sh
pythonの基本的な環境を構築する
#### python_nlp.sh
自然言語処理に適した環境を構築する

### 実行方法
私のgithubのリポジトリをクローンしてください。
```
$ git clone https://github.com/IkokObi/SetupFiles.git
```
InitialSetupディレクトリに入り、Set.shを開いて実行しないスクリプトを"#"でコメントアウトしてください。
```
$ cd SetupFiles/InitialSetup
```
Set.shを保存したら以下を実行してください。
```
$ bash Set.sh
```

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
$ bash atcoder_env.sh
```
ここまででpyenvの仮想環境に"atcoder"と名前のついたpython環境があるはずです。
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


