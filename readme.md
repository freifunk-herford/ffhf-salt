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
