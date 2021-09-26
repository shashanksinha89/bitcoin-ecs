vpc_id           = ""
kms_key          = ""
iam_role         = ""
cloudwatch_group = "bitcoin"

#ECS SERVICE
service_name  = "bitcoind"
service_count = 1

#ECS CLUSTER
cluster_name = "bitcoin"

