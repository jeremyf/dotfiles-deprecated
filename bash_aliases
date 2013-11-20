alias kill-jetty='ps ax | grep jetty | grep -v grep | sed "s/^ *//g" | cut -f1 -d " " | xargs kill -9'
