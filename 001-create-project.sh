
echo "Please input project ID:"
read project_id
echo "Project ID:" $project_id
gcloud projects create $project_id
gcloud init
