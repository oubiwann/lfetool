TEST_PROJ=my-new-service

build:
	./bin/create-tool

push-all:
	git push --all
	git push upstream --all
	git push --tags
	git push upstream --tags

test-proj:
	rm -rf $(TEST_PROJ)
	./lfetool new service $(TEST_PROJ)
	cd $(TEST_PROJ) && make shell