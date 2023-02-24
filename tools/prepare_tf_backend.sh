# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PROJECT_ID=$1

gcloud projects list --filter PROJECT_ID=$PROJECT_ID --format="value(projectNumber)"
BUCKET_NAME=tf-backend-xwiki-gce-`gcloud projects list --filter PROJECT_ID=$PROJECT_ID --format="value(projectNumber)"`

# Generate tf_backend.tf by BUCKET_NAME
cat << EOF > ../infra/tf_backend.tf
terraform {
  backend "gcs" {
    bucket = "$BUCKET_NAME"
    prefix = "xwiki/infra"
  }
}
EOF
