.PHONY: docs test test-parallel

all: develop

# In order of dependencies
python-subdirs=  contracts  compmake geometry procgraph reprep  conf_tools vehicles   bootstrapping_olympics boot_agents bvapps

test-subdirs=  contracts  compmake geometry procgraph reprep vehicles  conf_tools bootstrapping_olympics boot_agents bvapps

docs-subdirs= bootstrapping_olympics  compmake geometry procgraph reprep  vehicles contracts
#boot_agents
# conf_tools

test: $(foreach subdir, $(test-subdirs), test-$(subdir))
test-parallel: $(foreach subdir, $(test-subdirs), testp-$(subdir))
docs: $(foreach subdir, $(docs-subdirs), docs-$(subdir))


test-%:
	$(MAKE) -C $* test


testp-%:
	$(MAKE) -C $* test-parallel

docs-%:
	$(MAKE) -C $* docs

develop: $(foreach subdir, $(python-subdirs), develop-$(subdir))

develop-%:
	$(MAKE) -C $*
