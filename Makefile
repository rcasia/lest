
lib/bashunit:
	curl -s https://bashunit.typeddevs.com/install.sh | bash
	

test: lib/bashunit
	bash ./lib/bashunit ./tests

