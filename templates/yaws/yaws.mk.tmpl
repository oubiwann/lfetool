include common.mk

ETC_DIR = ./etc
YAWS_DIR = $(DEPS)/yaws
YAWS = $(YAWS_DIR)/bin/yaws
YAWS_CONF = $(ETC_DIR)/yaws.conf
YAWS_SERVER_ID = changeme

dev: compile-no-deps
	@ERL_LIBS=$(ERL_LIBS) $(YAWS) -i --conf $(YAWS_CONF) --id $(YAWS_SERVER_ID)

run: compile
	@ERL_LIBS=$(ERL_LIBS) $(YAWS) -D --heart --conf $(YAWS_CONF) --id $(YAWS_SERVER_ID)

update-conf:
	@ERL_LIBS=$(ERL_LIBS) $(YAWS) -h --conf $(YAWS_CONF) --id $(YAWS_SERVER_ID)

stats:
	@ERL_LIBS=$(ERL_LIBS) $(YAWS) -S --id $(YAWS_SERVER_ID)

stop:
	@ERL_LIBS=$(ERL_LIBS) $(YAWS) --stop --id $(YAWS_SERVER_ID)
