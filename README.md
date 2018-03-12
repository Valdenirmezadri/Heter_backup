# Heter_backup
Heterogeneous backup simplifies the creation of backup scripts, keeping a good standard and thus minimizing the amount of lines you will need to program 

Heter_backup is divided into actions that need 1 configuration file and 1 module, multiple files can use the same module.

What you need configure:
config.cfg (root)
config_backups/configuration_files (for each action, backup, copy, synchronize, send email)
modules/modules (if the module does not already exist you can create it with a few lines)

# Heter_backup
Heterogeneous backup simplifica a criação de scripts de backup, mantendo um bom padrão e minimizando assim a quantidade de linhas que você vai precisar programar

Heter_backup está dividido em ações que precisam de 1 arquivo de configuração e um módulo, vários arquivos podem usar o mesmo módulo.

O necessário para funcionar é configurar:
config.cfg ( raíz)
config_backups/arquivos_configuracao ( para cada ação, backup, copia, sincronizar, enviar e-mail )
modulos/modulos ( se o modulo ainda não existir você pode criar ele com poucas linhas )

# Configurações iniciais

O arquivo config.cfg na raíz é o primeiro arquivo a ser configurado:
NOME="FIREWALL_CLIENTE" # nome do cliente / servidor para identificação

EMAIL="backup_servidor@hardtec.srv.br" #  e-mail padrão

LOC='pt_BR'  # linguagem do script

É possível traduzir o heter_backup com os arquivos da pasta lang

# config_backups
dentro da pasta config_backups ficam as configurações de backup, sincronização e envio de avisos:

Os arquivos precisam ser iniciados com:
bkp para arquivos de backup ex: bkp-diretorio bkp_emails

send para arquivos de copia de backup, sincronização e etc ex: send_nuvem, send_rsync

alert para arquivos de alerta por e-mail e etc, ex: alert_mail


# modulos
Dentro da pasta modulos ficam os arquivos que executam os pedidos:
modulos padrão que devem sempre estar presentes:
mod_sistema
mod_lang

um modulo pode ser usado por vários arquivos de configuração da pasta config_backups

Para executar utilize o script start_backup.sh

Dúvidas:
valdenirmezadri@live.com
https://www.facebook.com/junior.mezadri
