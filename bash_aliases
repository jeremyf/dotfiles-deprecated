alias kill-jetty='ps ax | grep jetty | grep -v grep | sed "s/^ *//g" | cut -f1 -d " " | xargs kill -9'
alias ls='ls -Gal'
alias file-count="find . -type f -print |wc -l"
alias e="subl -n ."
alias bx="bundle exec"
alias g='guard'
alias gl='git lg'
alias gst='git st'
alias gsp='git sp'
alias gc='git co'
alias gu='git reset HEAD --'
alias gm='git commit'
alias gb='git ba'
alias ga='git add'
alias gd='git diff'
alias newrvm='rvm rvmrc to .ruby-version'
alias grh='git reset --hard HEAD'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias ssh-pprd='ssh rbpprd@rpprd.library.nd.edu'
alias ssh-prod='ssh rbprod@rprod.library.nd.edu'
alias hb="hub browse"
alias sprint="open https://github.com/ndlib/planning/issues"
alias p="project"
alias cspec="BUNDLE_GEMFILE=./spec/internal/Gemfile bundle exec rspec"
alias zute="zeus test"

# SSH Tunnel:
# ssh libvirt6.library.nd.edu -L 8080:localhost:8080
# alias daemon_apache="sudo launchctl load -w /Library/LaunchDaemons/org.macports.apache2.plist"
# alias dash_off='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
# alias dash_on='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'

alias dns-flush="dscacheutil -flushcache"
# alias net_traffic="lsof -r -i"
# alias mail-vacuum="/usr/bin/sqlite3 ~/Library/Mail/Envelope\\ Index vacuum"
# alias mail-check="/usr/bin/sqlite3 ~/Library/Mail/Envelope\\ Index 'PRAGMA integrity_check'"

# cat ~/.ssh/id_dsa.pub | ssh deploy@173.203.178.77 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && cat - >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && chmod 700 ~/.ssh"
# alias rsync-conductor="rsync -alz -e ssh deploy@cprod.nd.edu:/var/www/apps/conductor/shared/themes/conductor.nd.edu ./themes/"
# alias rsync-agency="rsync -alz -e ssh deploy@cprod.nd.edu:/var/www/apps/conductor/shared/themes/agency.nd.edu ./themes/"

# Move buttons in iTunes
#defaults write com.apple.iTunes full-window -boolean YES