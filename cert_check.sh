#!/bin/sh
echo "Today is `date -u`"
echo ""
file=/home/kingshuk/hosts
while IFS= read -r line
do
	cert_exp=$(echo | openssl s_client -connect $line 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f 2)
	cert_date=$(date --date="${cert_exp}" +%s)
	today=$(date +%s)
	date_diff=$((($cert_date - $today)/86400))
	echo "Certificate for \033[1m$line\033[0m will expire in \033[1m$date_diff\033[0m days, on `echo -n | openssl s_client -connect $line 2>/dev/null | openssl x509 -noout -enddate | sed "s/.*=\(.*\)/\1/"`"
	echo ""
done < "$file"
