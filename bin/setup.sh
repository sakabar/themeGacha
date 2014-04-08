cabal clean
cabal configure
cabal build

grep -o "<span class=\"title\">.*</span>" source.html \
  | sed -e 's/<span class="title">//' | sed -e 's/<\/span>//' \
  | sed -e 's/<.*>//g' | grep -v "^$" > titles.txt


cabocha -f1 < titles.txt | grep -v "助詞," | cut -f1 | grep -v "^EOS$" \
  | ./dist/build/RemoveAst/RemoveAst | grep -v "[a-z]"> nouns.txt

# grep -o "<span class=\"title\">.*</span>" source.html \
#   | sed -e 's/<span class="title">//' | sed -e 's/<\/span>//' \
#   | sed -e 's/<.*>//g' \
#   | cabocha -f1 | cut -f1 | grep -v "^EOS$" \
#   | ./dist/build/ThemeGacha/RemoveAst > chunks.txt

# grep -o "<span class=\"title\">.*</span>" source.html \
#   | sed -e 's/<span class="title">//' | sed -e 's/<\/span>//' \
#   | sed -e 's/<.*>//g' \
#   | cabocha -f1 | egrep "助詞,|EOS" | cut -f1 \
#   > function_words.txt
