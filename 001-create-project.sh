
# Create new project ID
echo "Please input project ID:"
read project_id
echo "Project ID:" $project_id
gcloud projects create $project_id

# Init GCP environment
gcloud init

# Create credential (Please replace my account and project ID to yours)
gcloud iam service-accounts create lisa-gcp-cloud2
gcloud projects add-iam-policy-binding lisa-gcp-cloud2 --member "serviceAccount:lisa-gcp-cloud2@lisa-gcp-cloud2.iam.gserviceaccount.com" --role "roles/owner"
gcloud iam service-accounts keys create lisa-gcp-cloud2.json --iam-account lisa-gcp-cloud2@lisa-gcp-cloud2.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIAL="/Users/mayerlbp/GCP-2/3/terraform-google-gke/lisa-gcp-cloud2.json"

