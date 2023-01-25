# jenkins-aci
Deploys Jenkins on Azure Container Instances

- populate `.tfvars` with values to use in the Container Groups FQDN, and a name for the Storage Account that will be created to hold the Container Group's volume
- populate `terraform.tf` with backend Storage Account name

Run `terraform apply` and wait for resources to be created.

In the portal...
- navigate to the Storage Account holding the Container Group volume
- open the file share, go into the `secrets` folder and download the `initialAdminPassword` file
- note the password contained in the above file
- navigate to the newly created Container Group and navigate to its FQDN, with the appropriate port
- at the initial Jenkins screen, enter the initial admin password
- install the recommended plugins


