
TARBIN ?= tar
TARFLAGS ?= --exclude-vcs --exclude='.git' -cvf
AGNAME ?= $(shell awk '/author:/{a=$$2}; /role_name/{n=$$2};END{print a"."n}' meta/main*)
TARFILE ?= /tmp/${AGNAME}
AGBIN ?= ansible-galaxy

.PHONY: all

all: lint package install list

lint:
	ansible-lint --parseable-severity -x experimental
package:
	${TARBIN} ${TARFLAGS} ${TARFILE} .
install:
	${AGBIN} role install -f file://${TARFILE},9.99.999.dev9999
list:
	${AGBIN} role list
