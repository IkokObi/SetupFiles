#!/bin/sh

# ==================================
# 実行しないファイルはコメントアウト
# 例: python_basic.shは実行しない
#
# 	Files=(\
# 	init.sh \
# 	# python_basic.sh \
# 	python_nlp.sh \
# 	)
#
# ==================================


Files=(\
init.sh \
python_basic.sh \
python_nlp.sh \
)

for s in ${Files[@]}; do
	bash ${s}
done



