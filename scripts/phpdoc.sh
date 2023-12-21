#!/usr/bin/env bash

base_uri="https://www.php.net/manual/en" 
HASH_MAP=()

populate_hash_map() {
    IFS=$'\n' read -rd '' -a HASH_MAP <<<"$1"
}

print_options() {
    for item in "${HASH_MAP[@]}"
    do
        echo $item | awk '{ print $3 }'
    done
}

get_path() {
    for i in "${!HASH_MAP[@]}"; do
        if printf "%s" "${HASH_MAP[$i]}" | grep -qs $1; then
            doc_path=`echo "${HASH_MAP[$i]}" | sed 's/\(.*\) =>.*/\1/g'`;
        fi
    done
}

get_function_refs() {
    string_funcs_html=`curl -s $base_uri/ref.strings.php`
    array_funcs_html=`curl -s $base_uri/ref.array.php`

    string_func_tags=`echo "$string_funcs_html" | xmllint --html --xpath "//ul[@class='chunklist chunklist_reference']/li/a" - 2>/dev/null`
    array_func_tags=`echo "$array_funcs_html" | xmllint --html --xpath "//ul[@class='chunklist chunklist_reference']/li/a" - 2>/dev/null`
    func_tags=`printf "%s" "$string_func_tags\n$array_func_tags" | sed 's/></>\n</g' | sed 's/\(.*\)href="\([^"]*\).*>\(.*\)<\/a>/\2 => \3/g'`
    populate_hash_map "$func_tags"
}

sections=`echo "function class" | tr ' ' '\n'`
selected_section=`echo "$sections" | fzf`

if [[ "$selected_section" == "function" ]]; then
    tag_class="refentry"
    get_function_refs
    query=`print_options | fzf`
else
    tag_class="reference"
    echo "Not yet implemented"
    exit 0
fi

get_path "$query"

curl -s $base_uri/$doc_path | \
    xmllint --html --xpath "//div[@class='$tag_class']" - 2>/dev/null | \
    # TODO: need to do a better job of parsing this markup into a readable format
    sed 's/<[^>]*>//g; /^[[:space:]]*$/d; s/^[[:space:]]*//g' | \
    php -r 'while(($line=fgets(STDIN)) !== false) echo html_entity_decode($line, ENT_QUOTES|ENT_HTML401);' | \
    less -R
