### Build and deploy a presentation
### Bits here stolen from Kieran Healy (https://github.com/kjhealy/kieranhealy.hugo/blob/master/Makefile) 
### and Matthew Brett (https://github.com/matthew-brett/thw-intro/blob/master/Makefile)
### If you want to use this file as-is, then you
### need to change the variables below to your
### own SSH user, document root, etc.
### 
### However, you will most likely also want to
### customize the various steps (e.g. the css target)
### so that it matches the details of your own
### setup.
### 
### Apart from hugo, you will also need rsync to deploy
### the site, and the java-based yuicompressor to
### minify the CSS, should you keep that step.

SSH_USER = jeremyki@jeremykidwell.info
DOCUMENT_ROOT = /home/jeremyki/public_html/
STATIC_FILES_DIR = files/presentations/
FILENAME = presentation_20180130_cambridge_energy

default: $(PUBLIC_DIR).pdf

reveal: $(PUBLIC_DIR).html

%.pdf : %.md
	pandoc -t beamer -s $< -o $@

%.html : %.md
	# May need git submodule add https://github.com/hakimel/reveal.js to make
	# this one work.
	pandoc -t revealjs -s -o $@ $< -V revealjs-url=./reveal.js

### for later
### rsync: 
### 	rsync -crzve 'ssh -p 22' $(PUBLIC_DIR) $(SSH_USER):$(DOCUMENT_ROOT)

clean:
rm *.pdf *.html