terraform {
    required_providers {
        yandex = {
            source = "yandex-cloud/yandex"
        }
    }
    required_version = ">= 0.13"
}

provider "yandex" {
    token = "y0_AgAAAAAGb1v3AATuwQAAAAD8CIgfAAC7Pw2Wlo9OxJgr53sDqioteWJ8HQ"
    cloud_id = "b1g5oisudfns3c0u64o7"
    folder_id = "b1g8fm7t7bsh1biji6v8"
    zone = "ru-central1-a"
}
