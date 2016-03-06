run-osx:
	ansible-playbook --connection=local --inventory=./local_inventory ./dev-osx.yml
