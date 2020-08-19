#!/bin/sh

curl --location --request POST 'http://localhost:8085/trace/statCrashLog' \
	--header 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnRfaWQiOjEsIm1hY2hpbmVJZCI6IjUiLCJ1c2VyX2lkIjoxMTAwNDk4LCJ1c2VyX25hbWUiOiJsYW9zaGkzIiwic2NvcGUiOlsib3BlbmlkIl0sImFjdGl2ZSI6dHJ1ZSwiZXhwIjoxNTk2OTk1Nzk1LCJkZXB0X2lkIjpudWxsLCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiLCJST0xFX1RFQUNIRVIiXSwianRpIjoiZmUzYTI5ODItMGU3Yi00MWQ3LTlmZjUtOTVhOTlmNDRmZjZlIiwiY2xpZW50X2lkIjoiZWxlYXJpbmd3ZWIiLCJ1c2VybmFtZSI6Imxhb3NoaTMifQ.b5E2oyf013vdRil7SoeKdg1wNaDAOHR7pDgCLTZ9Ysl48q457C3A1ZsyFYPD_-TvH0XSGaVMDEV7KyCQ1conqPigHiDvH-CqG_RY3hxSxqvfZfX82jnW-j3InslXxaFLkvmI9tSkcNUgZNvd_5LY48k8Q9SqfQotaj1lj-Dhep_ab_hbMYJUndzoa36dn-gbluPnCPK3-4OS_wSeb8tspmV-qmD91qBFrt4u-l4p5FP1v1QYacJF-mTwZiIcZjU5koPbYKBjCJs10GpyVYYco7vllXqq7fwZEFKeO1bwPQRH6Ripo0ErEJ7LweCSAp3AWqY4-plHMA7nxL05yLn6kQ' \
	--header 'Content-Type: application/x-www-form-urlencoded' \
	--data-urlencode 'uid=' \
	--data-urlencode 'crashLog=dsfsd#sdfds' \
	--data-urlencode 'actionDate=2020-08-19 14:12:56' \
	--data-urlencode 'operator=1' \
	--data-urlencode 'network=4' \
	--data-urlencode 'platform=3' \
	--data-urlencode 'version=10000'

