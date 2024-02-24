# YBakalenko_infra

The full reddit VM image was built using Packer framework utiliing the below features:
1. Packer JSON-template (see packer/ubuntu16.json) with priovisioners based on Bash scripts
   installing a Ruby environment and Mongo database
2. Yandex cloud service account has been used for VM deployment and image build process
   Packer interaction with YC provider
3. Packer JSON template enhancement was done to introduce user-defined parameters from
   external file (see packer/variables.json) or CLI parameters

   - variables.json file gist:
   {
        "variables": {
                "my_folder_id": "myfolder_id",
                "my_service_account_key_file": "myserviceaccount_json_file_path",
                "my_source_image_family": "os_image_family"
        }
   }

   - shell Packer build command:
   packer build -var-file=../packer/variables.json ../packer/ubuntu16.json

4. A full reddit application baked VM image was prepared using a additional provisioning script
   (packer/files/install_reddit.sh)
