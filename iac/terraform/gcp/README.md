## Set up GCP Service & Configure Google Cloud SDK

Update packages
```bash
sudo apt-get update
```

Install curl and apt-transport-https packages
```bash
sudo apt-get install apt-transport-https ca-certificates gnupg curl
```

Import Google Cloud public key
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg--dearmor -o /usr/share/keyrings/cloud.google.gpg
```

Add the gcloud CLI distribution URI as a package source
```bash
echo "deb[signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/aptcloud-sdkmain" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
```

Update and install gcloud CLI
```bash
sudo apt-get update && sudo apt-get install google-cloud-cli
```

Initialize gcloud CLI by running following prompts
```bash
gcloud init
```

Import Google Cloud public key
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg--dearmor -o /usr/share/keyrings/cloud.google.gpg
```


Create a service account in [https://www.console.cloud.google.com/](https://console.cloud.google.com/)  
Under IAM & Admin, generate a service account and create a new key and download it as JSON 


Set up environment variable and point to the JSON file
```bash
export GOOGLE_APPLICATION_CREDENTIALS="/home/emir/serviceaccount.json"
```

Verify authentication
```bash
gcloud auth list
```

## Additional Notes

Make sure that you have enabled Cloud Compute Engine API

Check operating system images
```bash
gcloud compute images list --filter="name~'ubuntu-2204'"
gcloud compute images list --filter="name~'debian'"
gcloud compute images list --filter="name~'centos'"
```


## Create Google Compute Engine Instance using Terraform

Initialize terraform
```bash
terraform init
```

See the execution plan
```bash
terraform plan
```

Apply the configuration
```bash
terraform apply
```

Cleanup
```bash
terraform destroy
```


