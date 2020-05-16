
# Create new project ID
echo "Please input project ID:"
read project_id
echo "Project ID:" $project_id
gcloud projects create $project_id

# Init GCP environment
gcloud init

# Create credential (Please replace my account and project ID to yours)
gcloud iam service-accounts create thinkdataworks
gcloud projects add-iam-policy-binding thinkdataworks --member "serviceAccount:thinkdataworks@thinkdataworks.iam.gserviceaccount.com" --role "roles/owner"
gcloud iam service-accounts keys create thinkdataworks.json --iam-account thinkdataworks@thinkdataworks.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS="/Users/mayerlbp/thinkdata-gcp/GCP/thinkdataworks.json"

# Run the following commands to set up GKE (Please input region, project ID and cluster name)
terraform init
terraform plan
terraform apply

# Set up kubernetes proxy
kubectl proxy &

#Get endpoints information
curl http://localhost:8001/api/v1/namespaces/default/endpoints

# Get nginx service external IP
kubectl get service | grep nginx-ingress |awk '{print $4}'

