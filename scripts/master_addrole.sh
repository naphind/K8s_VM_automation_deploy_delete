clusterId=`cat /tmp/clusterid.txt`
role="--etcd --controlplane"

agentcmd=`curl -sLk https://rancher.uidai.demo/v3/clusterregistrationtoken -H "Authorization: Bearer {{token}}" | jq -r ".data[]" | grep -A10 $clusterId | grep nodeCommand | cut -d : -f2,3,4,5,6,7 | cut -d , -f1 | sed 's/"//g'`

completecmd="$agentcmd $role"
echo $completecmd > /tmp/pods.sh
