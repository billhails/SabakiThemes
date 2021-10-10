
.PHONY: FORCE all

THEMEDIRS=agate antique antique-hard basic bathroom jade jade-hard sakura shell-slate shell-slate-hard sumire yuki yunzi yunzi2 yunzi-hard
ALLDIRS=$(THEMEDIRS) blender

all: $(ALLDIRS)

$(ALLDIRS): %: FORCE
	$(MAKE) -C $@

# vim: noet sw=8
