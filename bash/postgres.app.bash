PG_BIN=/Applications/Postgres.app/Contents/Versions/latest/bin

if [ -d ${PG_BIN} ]; then
  export PATH=${PATH}:${PG_BIN}
fi
