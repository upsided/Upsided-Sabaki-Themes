#!/usr/bin/env fish

# skip unneeded files when packing ASAR
# run from project directory

set -l themes baduktv baduktv-animated baduktv-grunge happy-stones hikaru kifu

for theme in $themes
    mkdir -p "packs/$theme" ; and \
    ln (find $theme/* | egrep -v "^$theme/+src|/\.|screenshot") packs/$theme/ ; and \
    asar pack packs/$theme packs/$theme.asar; and \
    rm packs/$theme/* ; and \
    rmdir packs/$theme 
end
