.PHONY: docs test test-parallel

all: develop

# In order of dependencies



python-subdirs=  contracts  compmake geometry procgraph reprep  conf_tools vehicles   boot_olympics quickapp surf12adam boot_agents bvapps rosstream2boot

test-subdirs=  contracts  compmake geometry procgraph reprep vehicles  conf_tools boot_olympics quickapp surf12adam boot_agents bvapps rosstream2boot

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

comptests:
	comptests --exclude learner,nspkg,procgraph_ros --contracts --console src

comptests-remake:
	rm -rf out-compmake-tests
	nice -n 10 comptests --exclude learner,nspkg,procgraph_ros --contracts -c parmake src


# this is  part of the output of comptests
# modules=reprep contracts astatsa typsy_configuration typsy_geometry genblocks typsy typsy_boot typsy_probability typsy_dynamics diffeoplan_agent  ggs diffeoplan dptr1 comptests quickapp decent_params procgraph_vehicles raytracer vehicles cairo_utils vehicles_cairo vehicles_boot geometry compmake boot_agents boot_reports ros_node_utils rosbag_utils latex_gen diffeo2dds diffeo procgraph_diffeo diffeo2c diffeo2d_learn diffeo2dds_learn diffeo2dds_sim diffeo2dds_learn_rosbag diffeo2s diffeo_agents diffeo2d conf_tools procgraph_b2r2b rosstream2boot b2r2b_youbot procgraph_boot quickapp_boot bootstrapping_olympics blocks yc1304 procgraph_io_misc procgraph_numpy_ops procgraph_robotics procgraph procgraph_hdf procgraph_cv procgraph_images procgraph_signals procgraph_mplayer procgraph_statistics procgraph_yaml procgraph_pil procgraph_ros procgraph_mpl procgraph_foo
modules=reprep reprep_tables contracts astatsa typsy_configuration typsy_python typsy_geometry genblocks typsy typsy_boot typsy_probability typsy_dynamics diffeoplan_agent ggs diffeoplan dptr1 quickapp comptests decent_params decent_logs procgraph_vehicles raytracer vehicles cairo_utils vehicles_cairo vehicles_boot geometry compmake boot_agents boot_reports ros_node_utils rosbag_utils latex_gen  diffeo2dds diffeo procgraph_diffeo diffeo2c diffeo2d_learn diffeo2dds_learn diffeo2dds_sim diffeo2dds_learn_rosbag diffeo2s diffeo_agents diffeo2d conf_tools procgraph_b2r2b rosstream2boot b2r2b_youbot procgraph_boot quickapp_boot bootstrapping_olympics blocks yc1304 boot_navigation procgraph_io_misc procgraph_numpy_ops procgraph_robotics procgraph procgraph_hdf procgraph_cv procgraph_images procgraph_signals procgraph_mplayer procgraph_statistics procgraph_yaml procgraph_pil procgraph_ros procgraph_mpl procgraph_foo
# minus: bo_hidden	diffeo_learener
modulegraph:
	#modulegraph -h -m  $(modules) > modulegraph.html
	#modulegraph -g -m  $(modules)  > deps.yaml
	rm -f deps.yaml
	modulegraph --deps deps.yaml -m  $(modules)
	./src/deps_display/dep_plot.py
	#> modulegraph.dot

