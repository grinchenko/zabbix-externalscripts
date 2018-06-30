#!/bin/bash

# Ищем таски со стасусом  error  в массиве  gdrp_tasks_info  на странице https://zdt.zoomsupport.com/internal/
url="https://zdt.zoomsupport.com/internal/"
response=$(curl -X GET -Is $url | head -1 | tr -d '\r')
answer="HTTP/1.1 200 OK"

#echo $response
#echo $answer

if [[ "${response}" == "${answer}" ]]; then


#resultvalue=`cat /home/grin/test.txt | jq '.gdrp_tasks_info.tasks.anonymize[]|{status, count}'|sed -n '/error/{n;p;}'|sed s/[^0-9]//g`
resultvalue=`curl $url 2>/dev/null | jq '.gdrp_tasks_info.tasks.anonymize[]|{status, count}'|sed -n '/error/{n;p;}'|sed s/[^0-9]//g`
      if [[ -z "${resultvalue}" ]]; then
      echo "0"
      else
      echo $resultvalue
      fi
#echo $result
else
 echo "Page is does not available"
fi
   
