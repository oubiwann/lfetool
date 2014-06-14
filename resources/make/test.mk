TEST_PROJ=my-new-service

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

