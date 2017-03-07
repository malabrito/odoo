# Script
# Fonte: https://portal.matmoz.si/it_IT/blog/our-news-1/post/odoo-8-on-debian-7-1#blog_content
# https://github.com/OCA/l10n-brazil/wiki/Instala%C3%A7%C3%A3o-Odoo-v8-em-Ubuntu-Server-14.04-LTS
# Instala Odoo, postgresl e NGINX

# Adiciona a linguagem pt-BR ao servidor
export LANGUAGE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
sudo locale-gen pt_BR pt_BR.UTF-8
sudo dpkg-reconfigure locales

# Cria usuário odoo
sudo adduser --system --quiet --shell=/bin/bash --home=/opt/odoo --gecos 'odoo' --group odoo

mv -f ~/installOdoo/sources.list /etc/apt/sources.list

# Instala o banco de dados (postgresql)
sudo apt-get install postgresql -y
#createuser --createdb --username postgres --no-createrole --no-superuser --pwprompt odoo
su - postgres -c "createuser -s odoo" 2> /dev/null || true
exit

# Dependências python do odoo
sudo apt-get install -y python-imaging python-passlib python-dateutil python-feedparser python-gdata python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil wget python-unittest2 python-mock python-jinja2 python-dev libpq-dev poppler-utils python-pdftools antiword ca-certificates python-six binutils cpp cpp-4.7 gcc-4.7 libgmp10 libgomp1 libitm1 libmpfr4 libquadmath0 python-crypto python-egenix-mxtools python-httplib2 python-keyring python-launchpadlib python-lazr.restfulclient python-lazr.uri python-oauth python-wadllib python-xdg python-zope.interface python-beautifulsoup python-decorator python-requests python-pypdf python-bs4 python-unidecode
sudo apt-get install -y libmpc2
sudo apt-get install -y python-pip
sudo pip install -y pyserial==2.7 psycogreen==1.0 pyusb==1.0.0b1 qrcode==5.0.1 Pillow==2.5.1 boto==2.38.0 oerplib==0.8.4 jcconv==0.2.3 pytz==2014.4 num2words

# Instala o Odoo através da clonagem do repositório GitHub
su - odoo
git clone -b 8.0 git@github.com:OCA/OCB.git
exit

# Configurações de log e do serivdor
#mkdir /opt/odoo/config_odoo
#mkdir /opt/odoo/custom
#touch /opt/odoo/config_odoo/odoo-server.log
#mv ~/installOdoo/odoo-server.conf /opt/odoo/config_odoo/odoo-server.conf

# Configurações do arquivo init
mv ~/installOdoo/odoo /etc/init.d/odoo-server
chmod +x /etc/init.d/odoo-server
sudo chown root: /etc/init.d/odoo-server
sudo /etc/init.d/odoo-server start
sudo update-rc.d odoo-server defaults

# Ajuste de propriedade do home do odoo
chown -R odoo:odoo /opt/odoo

# Instalação do NGINX
sudo apt-get install -y nginx
mkdir /etc/nginx/odoossl
cd /etc/nginx/odoossl

# Geração de certificado de segurança
openssl genrsa -des3 -out odoo.key 1024
openssl rsa -in odoo.key -out odoo.key
openssl req -new -key odoo.key -out odoo.csr
openssl x509 -req -days 365 -in odoo.csr -signkey odoo.key -out odoo.crt
chown root:www-data odoo.crt odoo.key
chmod 640 odoo.crt odoo.key
mkdir /etc/ssl/odoossl
chown www-data:root /etc/ssl/odoossl
chmod 710 /etc/ssl/odoossl
mv odoo.crt odoo.key /etc/ssl/odoossl/

# Configuração do NGINX
mv ~/installOdoo/odoo-net /etc/nginx/sites-available/odoo-net
ln -s /etc/nginx/sites-available/odoo-net /etc/nginx/sites-enabled/odoo-net

service nginx restart
exit
