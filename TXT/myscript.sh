#!/bin/bash
# Mon 07 Feb 2022 23:02:21 WIB

FILES="my*.txt my*.sh my*.tar.bz2.asc"
SHA="SHA256SUM"
FILENAME="myW01.tar.bz2"

echo "rm -f $FILENAME"
rm -f $FILENAME

echo "rm -f $FILENAME.asc"
rm -f $FILENAME.asc

echo "tar cfj $FILENAME $HOME/SP_RESULT/W01"
tar cfj $FILENAME $HOME/SP_RESULT/W01

echo "gpg -o $FILENAME.asc -a -v -r MAH -r rms46@ui.ac.id -e $FILENAME"
gpg -o $FILENAME.asc -a -v -r MAH -r rms46@ui.ac.id -e $FILENAME

echo "rm -f $FILENAME"
rm -f $FILENAME

echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

echo "sha256sum -c $SHA"
sha256sum -c $SHA

echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA
