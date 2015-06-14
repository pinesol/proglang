# Usage test.sh ${name}
# Assumes ${name}.l, ${name}.y, ${name}_test.txt exists

bison -d -v -t ${1}.y && flex ${1}.l && g++ lex.yy.c ${1}.tab.c -o ${1}_parser

while read line; do
    echo $line | ./${1}_parser
    if [[ $? -ne 0 ]]; then
      exit 1
    fi
done <${1}_test.txt

echo "Tests pass!"
