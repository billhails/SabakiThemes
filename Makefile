
.PHONY: FORCE copy

THEMEDIRS=agate antique antique-hard basic bathroom jade jade-hard sakura shell-slate shell-slate-hard yuki yunzi yunzi-hard

all: $(THEMEDIRS)

$(THEMEDIRS): %: FORCE
	$(MAKE) -C $@

# easier when publishing a release to have everything in one place
copy: all
	for dir in $(THEMEDIRS) ; do cp $$dir/*.sabakitheme.asar . ; done

# vim: noet sw=8
