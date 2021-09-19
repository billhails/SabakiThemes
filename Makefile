
.PHONY: FORCE copy

THEMEDIRS=agate antique antique-hard basic bathroom jade jade-hard sakura shell-slate shell-slate-hard yuki yunzi yunzi-hard

default: copy

all: $(THEMEDIRS) blender

$(THEMEDIRS): %: FORCE
	$(MAKE) -C $@

blender: FORCE
	$(MAKE) -C $@

# easier when publishing a release to have everything in one place
copy: all | themes
	for dir in $(THEMEDIRS) ; do cp $$dir/*.sabakitheme.asar ./themes ; done

themes:
	mkdir themes
# vim: noet sw=8
