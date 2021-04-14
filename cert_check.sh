#!/bin/sh
file=./hosts.txt
while IFS= read -r line
do
	echo "Today is `date -u`"
	cert_exp=$(echo | openssl s_client -connect $line 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f 2)
	cert_date=$(date --date="${cert_exp}" +%s)
	today=$(date +%s)
	date_diff=$((($cert_date - $today)/86400))
	echo "Certificate for $line will expire in $date_diff days, on `echo -n | openssl s_client -connect $line 2>/dev/null | openssl x509 -noout -enddate | sed "s/.*=\(.*\)/\1/"`"
	echo ""
done < "$file"
