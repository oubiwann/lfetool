TEST_PROJ=my-new-service

get-version:
	@echo "Version info:\n"
	@echo "\tScript:\t\t" `./lfetool -v`
	@echo "\tUnit tests:\t" `grep expectedversion test/tests.sh|head -1| \
		awk -F= '{print $$2}'|sed -e 's/"//g'`
	@echo "\tLatest tag:\t" `git tag|tail -1`
	@echo

build-no-version:
	@echo "Building lfetool ..."
	@./bin/create-tool

build: get-version build-no-version
	@echo "Finished."

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

check: build
	@bash test/tests.sh
	./lfetool -x
	@bash test/tests.sh
	git checkout lfetool

travis-check:
	@TRAVIS=true bash test/tests.sh
