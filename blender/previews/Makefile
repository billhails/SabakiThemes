all: README.md

README.md: *.jpg
	echo '# Previews' > $@
	echo '| Theme | Preview |' >> $@
	echo '| ----- | ------- |' >> $@
	for j in *.jpg ; do n=`basename $$j -0001.jpg` ; echo "| $$n | ![preview]($$j) |" ; done >> $@

# vim: noet sw=8
