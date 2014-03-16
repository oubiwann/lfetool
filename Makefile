TEST_PROJ=my-new-service

get-version:
	@echo "Version info:\n"
	@echo "\tLatest tag:\t" `git tag|tail -1`
	@echo "\tScript:\t\t" `./lfetool -v`
	@echo

build-no-version:
	@echo "Building lfetool ..."
	@./bin/create-tool
	@echo "Finished."

build: get-version build-no-version

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

check:
	@bash test/tests.sh

travis-check:
	@TRAVIS=true bash test/tests.sh
