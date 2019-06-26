#!/bin/sh
export TOKEN=`curl -s -u curl_client:password -X POST localhost:8081/oauth/token\?grant_type=client_credentials | egrep -o '[a-f0-9-]{20,}'`
echo "Got token for curl client as : $TOKEN"
#curl -v localhost:8083/product/products -H "Authorization: Bearer $TOKEN"

 for idx in $(seq 1 50) 
 do 
    echo "---- $idx ---"; curl localhost:8083/product -H "Authorization: Bearer $TOKEN"  &
    echo "" 
done