import json
from yandexcloud import compute

def get_yandex_cloud_instances():
    folder_id = 'b1g8fm7t7bsh1biji6v8'
    with open('key.json', 'r') as infile:
        credentials = json.load(infile)

    compute_client = ComputeClient(service_account_key=credentials)

    app_instance = compute_client.instance.get(folder_id=folder_id, name='App')
    db_instance = compute_client.instance.get(folder_id=folder_id, name='Db')

    return app_instance, db_instance

def generate_ansible_inventory(app_instance, db_instance):
    inventory = {
        'app': {
            'hosts': [{app_instance.network_interfaces[0].primary_v4_address.one_to_one_nat.address}],
        },
        'db': {
            'hosts': [{db_instance.network_interfaces[0].primary_v4_address.one_to_one_nat.address}],
        }
    }

    return inventory

def save_inventory_to_file(inventory, filename='inventory.json'):
    with open(filename, 'w') as file:
        json.dump(inventory, file, indent=2)

if __name__ == "__main__":
    app_instance, db_instance = get_yandex_cloud_instances()
    ansible_inventory = generate_ansible_inventory(app_instance, db_instance)
    save_inventory_to_file(ansible_inventory)
