#!/bin/bash

# MacTex2018の設定
# 参考URL
# 	http://doratex.hatenablog.jp/entry/20180501/1525144736
#


# mactexのインストール
brew cask install mactex
# ターミナルの再起動が必要かも
sudo tlmgr update --self --all
sudo tlmgr repository add http://contrib.texlive.info/current tlcontrib
sudo tlmgr pinning add tlcontrib '*'
sudo tlmgr install japanese-otf-nonfree japanese-otf-uptex-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
sudo cjk-gs-integrate --link-texmf --cleanup --force
sudo cjk-gs-integrate-macos --link-texmf --force
sudo mktexlsr

# skimのインストール
brew cask install skim

