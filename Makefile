.PHONY: docs test test-parallel

all: develop

# In order of dependencies
python-subdirs=  contracts  compmake geometry procgraph reprep  conf_tools vehicles   boot_olympics surf12adam boot_agents bvapps

test-subdirs=  contracts  compmake geometry procgraph reprep vehicles  conf_tools boot_olympics surf12adam boot_agents bvapps

docs-subdirs= bootstrapping_olympics  compmake geometry procgraph reprep  vehicles contracts
#boot_agents
# conf_tools

test: $(foreach subdir, $(test-subdirs), test-$(subdir))
test-parallel: $(foreach subdir, $(test-subdirs), testp-$(subdir))
docs: $(foreach subdir, $(docs-subdirs), docs-$(subdir))
develop: $(foreach subdir, $(python-subdirs), develop-$(subdir))

srcdir=src/

test-%:
	$(MAKE) -C $(srcdir)/$* test

testp-%:
	$(MAKE) -C $(srcdir)/$* test-parallel

docs-%:
	$(MAKE) -C $(srcdir)/$* docs

develop-%:
	$(MAKE) -C $(srcdir)/$* develop

check-same:
	md5sum */pypackage.mk pypackage.mk
