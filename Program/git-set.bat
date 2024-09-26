cd ../
curl -L http://gitignore.io/api/windows,visualstudio > .gitignore
git config --local core.quotepath false
git config --local core.autocrlf false
git config --local core.whitespace cr-at-eol
curl -L https://gist.githubusercontent.com/momo-lab/976c2bd68467a39ec2cbdb4ec25240a2/raw/gitattributes > .gitattributes
git config --local diff.sjis.textconv "iconv -f sjis"