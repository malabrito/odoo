# Script
# Instalação dos módulos: auto_backup

# Clonar repositório de autobackup do github
cd /opt/odoo/addons
git clone -b 8.0 https://github.com/Yenthe666/auto_backup.git

# Depois de editar o arquivo de configuração do servidor, incluir dependências python necessárias
# para que o módulo funcione
sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
sudo pip install paramiko
sudo pip install cryptography
sudo pip install pysftp
exit