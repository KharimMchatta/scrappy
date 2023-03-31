#!/bin/bash

echo '**********************************************************************************************************************************'
echo "*                                                                                                                                *"
echo "* Author: Kharim Mchatta                                                                                                         *"
echo "*                                                                                                                                *"
echo "* Tool-Name: Scrappy                                                                                                            *"
echo "*                                                                                                                                *"
echo "* Version: 1.0                                                                                                                   *"
echo "*                                                                                                                                *"
echo "* Scrappy is a script scrapes a website for words to use for directory bruteforce                                                 *"
echo "*                                                                                                                                *"
echo "* Disclaimer: the tool is not intended for malicious use, any malicious use of the tool shall not hold the author responsible.   *"
echo "*                                                                                                                                *"
echo "**********************************************************************************************************************************"

echo ""
echo ""
echo ""
echo ""
# Prompt the user to enter a URL and a depth
read -p "Enter the URL you want to scrape: " url
echo ''

# Download the web page using curl and save it to a file
curl -isL $url -o page.html


# Scrape all the words from the downloaded page using grep, excluding HTML tags, attributes, and other special characters, as well as programming language keywords and symbols
words=$(grep -o -w -E '\b[a-zA-Z]+\b' page.html | grep -v -w -E 'html|head|title|meta|script|style|link|body|div|span|p|a|img|ul|ol|li|h1|h2|h3|h4|h5|h6|table|tr|th|td|caption|form|input|textarea|button|select|option|label|fieldset|legend|pre|code|kbd|samp|var|dfn|em|i|b|strong|small|mark|ruby|rt|rp|bdi|bdo|wbr|abbr|acronym|address|blockquote|q|cite|ins|del|s|strike|u|sup|sub|big|tt|legend|center|font|base|br|hr|frame|frameset|noframes|iframe|object|param|applet|embed|map|area|label|isindex|nav|aside|header|footer|section|article|main|summary|details|menu|dialog|output|progress|meter|time|audio|video|source|track|canvas|datalist|keygen|command|datagrid|datalist|dialog|details|summary|menuitem|spacer|marquee|blink|acronym|basefont|blink|listing|plaintext|nextid|comment|xml|doctype|http|https|www|com|org|net|php|asp|js|css|jpg|jpeg|png|gif|svg|pdf|exe|zip|tar|gz|mp3|mp4|wav|ogg|webm|flv|wmv|mov|avi|mpeg|ico|xml|\bfor\b|\bwhile\b|\bif\b|\belse\b|\bdo\b|\btry\b|\bcatch\b|\bthrow\b|\bthrows\b|\bfinally\b|\bcase\b|\bswitch\b|\bdefault\b|\bbreak\b|\bcontinue\b|\breturn\b|\bnew\b|\bthis\b|\binstanceof\b|\bclass\b|\binterface\b|\bextends\b|\bimplements\b|\bprivate\b|\bprotected\b|\bpublic\b|\bstatic\b|\bfinal\b|\babstract\b|\bsynchronized\b|\bvolatile\b|\btransient\b|\bthrows\b|\bassert\b|\bnative\b|\bstrictfp\b|\bgoto\b|\blong\b|\bdouble\b|\bfloat\b|\bint\b|\bshort\b|\bbyte\b|\bchar\b|\bboolean\b|\bvoid\b|\btrue\b|\bfalse\b|\bnull\b|\bimport\b|\bpackage\b|\bsuper\b|\bnull\b|\bNaN\b|\bInfinity\b' | tr '[:upper:]' '[:lower:]' | sort | uniq)

# Display the scraped words on the terminal
echo "$words"

# Save the scraped words to a file called custom-wordlists.txt
echo "$words" > custom-wordlists.txt

# Print the total number of unique words found
num_words=$(echo "$words" | wc -w)
echo ''
echo ''
echo "Found $num_words unique words. Saved to custom-wordlists.txt"

# Delete the downloaded file
rm page.html
