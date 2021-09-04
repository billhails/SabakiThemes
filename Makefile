
.PHONY: doit

all:	yunzi yunzi-hard agate antique antique-hard basic bathroom jade jade-hard sakura shell-slate shell-slate-hard yunzi yunzi-hard

agate: doit
	$(MAKE) -C $@ NAME=$@

antique: doit
	$(MAKE) -C $@ NAME=$@-soft

antique-hard: doit
	$(MAKE) -C $@ NAME=$@

basic: doit
	$(MAKE) -C $@ NAME=$@

bathroom: doit
	$(MAKE) -C $@ NAME=$@

jade: doit
	$(MAKE) -C $@ NAME=$@-soft

jade-hard: doit
	$(MAKE) -C $@ NAME=$@

sakura: doit
	$(MAKE) -C $@ NAME=$@

shell-slate: doit
	$(MAKE) -C $@ NAME=$@-soft

shell-slate-hard: doit
	$(MAKE) -C $@ NAME=$@

yunzi: doit
	$(MAKE) -C $@ NAME=$@-soft

yunzi-hard: doit
	$(MAKE) -C $@ NAME=$@

# vim: noet sw=4
