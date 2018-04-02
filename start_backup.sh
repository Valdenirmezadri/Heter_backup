#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $DIR;
LOCAL_DIR="."
. "$LOCAL_DIR/config.cfg"
export LANG="$LOC.UTF-8"
. "$LOCAL_DIR/sistema/config.cfg"
. "$LOCAL_DIR/lang/$LOC.loc"

INICIO=$( cat $LOCAL_DIR/sistema/template/default )
MODULOS="$LOCAL_DIR/modulos"
CFG="$LOCAL_DIR/config_backups"

echo "$INICIO" > $LOG

#R=1
ALERTERR=0

# Carrega modulos
for modulo in $MODULOS/mod_*; do
  [ -e "$modulo" ] || continue
  . $modulo
done

# Carrega arquivos cfg que rodam antes dos backups, limpeza por ex
for cfgs in $CFG/before*.cfg; do
  [ -e "$cfgs" ] || continue
    . $cfgs
    if [ -n "$TIPO" ]; then
      function_exists $TIPO && R=0 || R=1
      if [ $R -eq 0  ]; then
        $TIPO
      else
        echo "Está faltando o módulo da função $TIPO"
      fi
    else
      echo "Falta especificar o tipo de backup do $cfgs"
    fi
done

# Carrega arquivos cfg de backup
for cfgs in $CFG/bkp*.cfg; do
  [ -e "$cfgs" ] || continue
    . $cfgs
    if [ -n "$TIPO" ]; then
      function_exists $TIPO && R=0 || R=1
      if [ $R -eq 0  ]; then
        $TIPO
      else
        echo "Está faltando o módulo da função $TIPO"
      fi
    else
      echo "Falta especificar o tipo de backup do $cfgs"
    fi
done

#
#Carrega arquivos cfg para replicar o backup
for cfgs in $CFG/send*.cfg; do
  [ -e "$cfgs" ] || continue
    . $cfgs
    if [ -n "$TIPO" ]; then
      function_exists $TIPO && R=0 || R=1
      if [ $R -eq 0  ]; then
        $TIPO
      else
        echo "Está faltando o módulo da função $TIPO"
      fi
    else
      echo "Falta especificar o tipo de backup do $cfgs"
    fi
done

#Carrega arquivos cfg para enviar avisos e e-mail
for cfgs in $CFG/alert*.cfg; do
  [ -e "$cfgs" ] || continue
    . $cfgs
    if [ -n "$TIPO" ]; then
      echo ""
      function_exists $TIPO && R=0 || R=1
      if [ $R -eq 0  ]; then
        $TIPO
      else
        echo "Está faltando o módulo da função $TIPO"
      fi
    else
      echo "Falta especificar o tipo de backup do $cfgs"
    fi
done
