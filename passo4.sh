# Script
# Fonte: https://github.com/OCA/l10n-brazil/wiki/Instala%C3%A7%C3%A3o-Odoo-v8-em-Ubuntu-Server-14.04-LTS
# Configurações restantes dos arquivos de log e servidor

# Instalação do WKHTMLtoPDF, necessário para gerar arquivos PDF
cd /tmp
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo cp /usr/local/bin/wkhtmltopdf /usr/bin
sudo cp /usr/local/bin/wkhtmltoimage /usr/bin

# Clonando o repositório git do Odoo
#sudo su - odoo -s /bin/bash
#git clone https://www.github.com/odoo/odoo --depth 1 --branch 8.0 --single-branch .
#exit

# Configuração do servidor
sudo mv ~/installOdoo/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

# Cria pasta para arquivo de log e define proprietário
sudo mkdir /var/log/odoo
touch /var/log/odoo/odoo-server.log
sudo chown -R odoo:root /var/log/odoo

# Para verificar o processo do odoo
# ps aux | grep odoo
# tail -f /var/log/odoo/odoo-server.log
exit