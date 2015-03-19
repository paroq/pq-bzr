include $(PQ_FACTORY)/factory.mk

pq_part_name := bzr-2.6.0
pq_part_file := $(pq_part_name).tar.gz

pq_bzr_configuration_flags += --prefix=$(part_dir)

build-stamp: stage-stamp
	cd $(pq_part_name) && python setup.py install --prefix $(part_dir) --root $(stage_dir)
	touch $@

stage-stamp: configure-stamp

configure-stamp: patch-stamp
	touch $@

patch-stamp: unpack-stamp
	touch $@

unpack-stamp: $(pq_part_file)
	tar xf $(source_dir)/$(pq_part_file)
	touch $@
