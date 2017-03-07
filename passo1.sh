# Script
# Fonte: https://portal.matmoz.si/it_IT/blog/our-news-1/post/odoo-8-on-debian-7-1#blog_content
# Gera par de chaves SSH para acesso ao servidor
# ATENÇÃO: Executar na máquina host

echo 'ATENÇÃO! Executar script na máquina host'

# Cria par de chaves SSH
ssh-keygen -t rsa -C "admin"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo ''
echo ''
echo ''
echo 'Gerando par de chaves SSH...'
echo 'Antes de prosseguir siga esses passos:'
echo '1. Copie o arquivo ~/.ssh/id_rsa.pub (chave pública) para o servidor'
echo 'No caso do jelastic, siga o caminho:'
echo 'Configurações da máquina (ícone de ferramenta) > Acesso SSH > Adicionar chave pública'
echo '2. Entre no servidor via SSH utilizando a chave privada criada'
echo '3. Ao entrar no servidor, selecione a máquina correta e execute os comandos:'
echo '"sudo apt-get install -y git"'
echo '"cd ~ && git clone https://beatrizlana@bitbucket.org/beatrizlana/installOdoo.git"'
echo '4. Dê permissão para o script passo2.sh e execute-o'
exit