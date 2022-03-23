# with your terraform file writen, run
terraform init

# creates a "user" on azure so terraform can execute everything it needs
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"

# set these variables on the env variables vault of your prefered cloud provider
# ARM_CLIENT_ID -> appId
# ARM_CLIENT_SECRET= -> displayName
# ARM_SUBSCRIPTION_ID= -> password
# ARM_TENANT_ID= -> tenant

# Specifically on the azure cloud you might need to setup a new resource group with a blob storage container, to store the `terraform.tfstate` file

terraform plan # describes what terraform will do on your cloud provider
