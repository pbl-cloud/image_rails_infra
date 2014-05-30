secret = Chef::EncryptedDataBagItem.load_secret("#{node['image_rails']['secret_path']}")

db_creds  = Chef::EncryptedDataBagItem.load("database_users", "root", secret)

default['mysql']['server_root_password'] = db_creds["password"]
default['mysql']['port'] = '3306'
default['mysql']['data_dir'] = '/data'
