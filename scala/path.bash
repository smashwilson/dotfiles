if [ -d /opt/scala/current ]; then
  export SCALA_HOME=/opt/scala/current
  export PATH=${PATH}:${SCALA_HOME}/bin
fi
