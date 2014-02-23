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
	make build
	./lfetool new service $(TEST_PROJ)

test-proj-shell: test-proj
	cd $(TEST_PROJ) && make shell-no-deps

test-proj-run: test-proj
	cd $(TEST_PROJ) && make run
