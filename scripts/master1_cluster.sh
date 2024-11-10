curl -k {{rancherurl}}/v3/clusters \
  -H "content-type: application/json" \
  -H "Authorization: Bearer {{token}}" \
  --data-binary '{
    "type": "cluster",
    "rancherKubernetesEngineConfig": {
      "addonJobTimeout": 30,
      "ignoreDockerVersion": true,
      "sshAgentAuth": false,
      "type": "rancherKubernetesEngineConfig",
      "authentication": {
        "type": "authnConfig",
        "strategy": "x509"
      },
      "network": {
        "type": "networkConfig",
        "plugin": "canal"
      },
      "ingress": {
        "type": "ingressConfig",
        "provider": "nginx"
      },
      "services": {
        "type": "rkeConfigServices",
        "kubeApi": {
          "podSecurityPolicy": false,
          "type": "kubeAPIService"
        },
        "etcd": {
          "snapshot": false,
          "type": "etcdService",
          "extraArgs": {
            "heartbeat-interval": 500,
            "election-timeout": 5000
          }
        }
      }
    },
    "name": "{{clustername}}"
  }' | jq -r .id
