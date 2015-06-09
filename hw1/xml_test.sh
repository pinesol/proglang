bison -d xml.y && flex xml.l && g++ lex.yy.c xml.tab.c -o xml_parser

while read line; do
    echo $line | ./xml_parser
    if [[ $? -ne 0 ]]; then
      exit 1
    fi
done <xml_test.txt

echo "Tests pass!"
