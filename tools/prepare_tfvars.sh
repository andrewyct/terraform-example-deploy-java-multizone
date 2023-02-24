#! /bin/bash
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


REGION=$1
ZONE1=$2
ZONE2=$3
XWIKI_IMAGE_PROJECT=$4
XWIKI_IMAGE_NAME=$5

if [ -z $XWIKI_IMAGE_PROJECT ]; then
  echo "xwiki project image info empty, set default value"
  XWIKI_IMAGE_PROJECT="migrate-legacy-java-app-gce"
  XWIKI_IMAGE_NAME="hsa-xwiki-vm-img-latest"
fi

cat << EOF > ../infra/terraform.tfvars
availability_type = "REGIONAL"
firewall_source_ranges = [
  //Health check service ip
  "130.211.0.0/22",
  "35.191.0.0/16",
]
location = {
  region     = "$REGION"
  zones      = ["$ZONE1", "$ZONE2"]
}
xwiki_img_info = {
    image_project = "$XWIKI_IMAGE_PROJECT"
    image_name    = "$XWIKI_IMAGE_NAME"
}
EOF
