clusterId=`cat /tmp/clusterid.txt`
curl -k {{rancherurl}}/v3/clusterregistrationtoken \
  -H "content-type: application/json" \
  -H "Authorization: Bearer {{token}}" \
  --data-binary '{
    "type": "clusterRegistrationToken",
    "clusterId": "'$clusterId'"
  }'
