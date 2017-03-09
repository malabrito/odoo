# Script
# Instalação de pacotes básicos para manipulação dos arquivos
# Pré-requisito: acessar o servidor através da chave gerada no passo1

echo 'ATENÇÃO! Pré-requisito: acessar o servidor através da chave gerada no passo1'

# Copia pasta do repositório para acesso aos scripts
cd ~
#git clone https://beatrizlana@bitbucket.org/beatrizlana/installOdoo.git
chmod -R 750 installOdoo

sudo apt-get update -y
sudo apt-get dist-upgrade -y

mv -f odoo/bashrc ~/.bashrc

sudo apt-get install -y bash-completion nano mc zip unzip arj git mercurial bzr locate
update-alternatives --config editor

exit