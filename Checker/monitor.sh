export ENDPOINT="$(cat /app/endpoint.txt)"

template="<b>$(date)</b>\n<table>"


for i in $(cat /app/names.txt)
do
    template="${template}\n<tr>\n<td>${i}</td>\n<td>"
    if [ ! -z "$(curl -s $ENDPOINT/$i | grep "DevOps Workshop")" ]
    then
        template="${template}Success</td>"
    else
        template="${template}Not yet</td>"
    fi
    template="${template}\n</tr>"
done

template="${template}\n</table>"

sed "s+{template}+${template}+g" /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html