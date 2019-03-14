# Freifunk Herford SaltStack Configuration

Anleitung unter <https://freifunk-herford.github.io/ffhf-salt/> lesen.

## Generate Documentation

    cd contrib
    virtualenv venv
    source venv/bin/activate
    pip install --upgrade pip -r requirements
    cd docs
    make html

## GPG Encryption

Render [Documentation](http://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html)

Generate Key:

    gpg --gen-key --homedir /etc/salt/gpgkeys

Export Key:

    gpg --armor --homedir /etc/salt/gpgkeys --armor --export saltstack > saltstack.gpg

Import Key:

    gpg --import saltstack.gpg

Trust Key:

    gpg --edit-key saltstack
    $ trust
    $ 5
    $ quit

Test Encryption:

    echo -n "supersecret" | gpg --homedir ~/.gnupg --armor --encrypt -r saltstack
