#!/bin/bash

# ================
# MacTex2018の設定
# 参考URL
# 	http://doratex.hatenablog.jp/entry/20180501/1525144736
#
# ================


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

# フォントの埋め込み
sudo kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron

# skimのインストール
brew cask install skim

# jlistingのインストール(自動化出来なかったので以下を参考に手動)
# http://www.takunoko.com/blog/mac%E3%81%ABjlisting-sty%E3%82%92%E5%B0%8E%E5%85%A5-tex/

