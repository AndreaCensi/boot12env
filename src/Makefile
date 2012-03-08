.PHONY: docs test test-parallel

# In order of dependencies
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
		