#!/bin/bash
wget http://eai_dev001.mci.gov.sa:9000/api/Captcha?uuid=bda4a22c-ce78-4648-a704-5732e9f0999f
# wget https://ecr.mci.gov.sa/Shared/_CaptchaImage/
convert *aptcha* -resize 1000x1000 captcha.png
rm *Captcha*
ocropus-nlbin -e -10.0 -g -z 5.0 -n captcha.png -o book
convert book/*bin* -resize 2600x2600 book/0001.bin.png
ocropus-gpageseg -n --maxcolseps 0 book/0001.bin.png
ocropus-rpred -m en-default.pyrnn.gz book/0001/*.png
cat book/0001/*.txt
echo "-----------------------------------------------------"
mkdir book/nrm
convert book/*nrm* -resize 2600x2600 book/nrm/0001.nrm.png
ocropus-gpageseg -n --maxcolseps 0 book/nrm/0001.nrm.png
ocropus-rpred -m en-default.pyrnn.gz book/nrm/0001/*.png
cat book/nrm/0001/*.txt
