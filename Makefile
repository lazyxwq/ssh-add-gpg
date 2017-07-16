H_FILES=$(wildcard *.h)
OUTDIR=bin/

all: $(OUTDIR) client server

$(OUTDIR):
	mkdir $@

client: ssh-add-gpg.c crypto.c $(H_FILES)
	gcc -o bin/ssh-add-gpg ssh-add-gpg.c crypto.c -lgpgme

server: ssh-add-gpgd.c crypto.c $(H_FILES)
	gcc -o bin/ssh-add-gpgd ssh-add-gpgd.c crypto.c -lgpgme

clean:
	rm -rf $(OUTDIR)
