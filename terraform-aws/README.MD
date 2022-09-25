Usage -

To run this example you need to execute:

$ terraform init
$ terraform plan
$ terraform apply


The code is using terraform local backend and local state file which is not at all recommended for real use cases. In real life scenarios, remote backend and state locking should be used so that the code be reused as many times as possible and can be used to add new functionalites (Like DB support or auto scaling). Any standard backend like AWS S3 - DynamoDB would be good.

The Docker container is running as root. Ideally it should be running as a less privileged user, like ec2-user.
