#!/bin/sh

curl --location --request POST 'http://localhost:8085/trace/statCrashLog' \
	--header 'Content-Type: application/x-www-form-urlencoded' \
	--data-urlencode 'uid=' \
	--data-urlencode 'crashLog=dsfsd#sdfds' \
	--data-urlencode 'actionDate=2020-08-19 14:12:56' \
	--data-urlencode 'operator=1' \
	--data-urlencode 'network=4' \
	--data-urlencode 'platform=3' \
	--data-urlencode 'version=10000'

