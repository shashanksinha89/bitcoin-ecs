# Bitcoin on ECS

### Introduction

- This repo contains docker file and terraform scripts to deploy `bitcoin-0.21.1` on ECS using terraform.
- 2 Github Actions worflow are added the repo. One performs end to end build & deploy phase and another onr is for triggering manual terraform deployments. 

###  Repo Structure

```bash
.
├── Dockerfile
├── README.md
├── docker-entrypoint.sh
└── terraform
    ├── cloudwatch.tf
    ├── data.tf
    ├── ecs.tf
    ├── ecs_service.tf
    ├── ecs_task.tf
    ├── terraform.tfvars
    └── variables.tf
```

### Prerequsites

#### Github Action
- Add below secrets with values to cloned repo accordingly. 

```bash
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
ECR_REPO
IAM_ROLE
KMS_KEY
VPC
```



#### Local Execution
- Export AWS Credentials or profile

```bash
export AWS_PROFILE=<NAMED_PROFILE>
```

- Update below data in `terraform/terraform.tfvars` file before executing terraform

```bash
vpc_id           = ""
kms_key          = ""
iam_role         = ""
cloudwatch_group = "bitcoin"

#ECS SERVICE
service_name  = "bitcoind"
service_count = 1

#ECS CLUSTER
cluster_name = "bitcoin"
```

### Steps

#### Github Action

```bash
Actions --> build_deploy (workflow)
```

#### Local Execution

```bash
cd terraform/
terraform plan -out plan
terraform apply plan
```