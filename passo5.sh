# Script
# Fonte: https://github.com/OCA/l10n-brazil/wiki/Instala%C3%A7%C3%A3o-Odoo-v8-em-Ubuntu-Server-14.04-LTS
# Instalação de módulos adicionais para a localidade brasileira

# Muda para usuário odoo
sudo su - odoo -s /bin/bash <<'EOF'

# Instalação do módulo PMIS (Gerenciamento de projetos)
cd /opt/odoo/
git clone --recursive -b 8.0 https://github.com/projectexpert/pmis.git

mkdir /opt/odoo/OCA
cd /opt/odoo/modules/OCA

# Módulo referente a localização brasileira
git clone https://github.com/oca/l10n-brazil.git --branch 8.0 --depth 1

# Módulo referente a regras fiscais
git clone https://github.com/oca/account-fiscal-rule.git --branch 8.0 --depth 1

# Módulo de nota fiscal eletrônica
mkdir /opt/odoo/locales
cd /opt/odoo/locales
git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git --branch 8.0 --depth 1

# Sai do usuário odoo
EOF

# Módulo para relatórios em pdf
cd /tmp
git clone https://github.com/odoo-brazil/geraldo --branch master
mv geraldo pdf_reports
cd pdf_reports
sudo python setup.py install

# Instalação do PySPED (nota fiscal eletrônica)
cd /tmp
wget http://labs.libre-entreprise.org/download.php/430/pyxmlsec-0.3.0.tar.gz
tar xvzf pyxmlsec-0.3.0.tar.gz
cd pyxmlsec-0.3.0
python setup.py install
cd /tmp
git clone https://github.com/odoo-brazil/PySPED.git --branch 8.0
cd PySPED
sudo python setup.py install

# Instalaçãp do pyxmlsec (nota fiscal eletrônica)
cd /tmp
git clone https://github.com/odoo-brazil/pyxmlsec --branch master
cd pyxmlsec
sudo python setup.py install

# Atualiza sistema
sudo apt-get update
sudo apt-get upgrade -y
exit
