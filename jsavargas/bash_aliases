export media=/mnt/user/media/media
export anime=/mnt/user/media/media/anime/anime
export series=/mnt/user/media/media/series
export movies=/mnt/user/media/media/movies/movies
export torrent=/mnt/user/download/torrent


alias forcereboot='echo b > /proc/sysrq-trigger'

# Alter the ls command
alias cls=clear
#alias ls='ls -lh --color'
alias ll='ls -lah'
alias l='ls -lah'
alias lls='ls -lac --color'


alias diff='diff --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias history='history 0'
alias ip='ip --color=auto'
alias la='ls -A'
#alias ll='ls -lah'
#alias ls='ls --color=auto'


alias cd..='cd ..'
alias ..='cd ..'
alias dfh='df -h'

#alias reload='source  ~/.bash_profile'


alias jonathan='cd /mnt/user/jonathan'
alias appdata='cd /mnt/user/appdata'
alias media='cd /mnt/user/media/media/'
alias movies='cd /mnt/user/media/media/movies'
alias series='cd /mnt/user/media/media/series'
alias anime='cd /mnt/user/media/media/anime/anime'
alias torrent='cd /mnt/user/download/torrent'


alias lsd="ls -al | grep '^d'"
alias mkcd='f(){ mkdir -p "$1" && cd "$1" };f'
alias hardlink='_(){ mkdir -p "${!#}" && ln "$@" ;}; _'
alias search='_(){ find $1 -iname "*$2*" ;}; _'

alias dstart='docker start '
alias dstop='docker stop '
alias drestart='docker restart '
alias dsall='docker stop $(docker ps -aq) '
alias drmidangling='docker rmi -f $(docker images -f "dangling=true" -q) '

alias dcstart='docker-compose start '
alias dcstop='docker stop '
alias dcrestart='docker restart '

alias pythonserver='python3 -m http.server 5050'
alias simpleHTTPServer='python3 -m http.server 5050'

alias plex_dupefinder='docker run --rm -it -e PGID=1000 -e PUID=1000 -config:rw mikenye/plex_dupefinder'
alias splitflac='docker run --rm -v "`pwd`:/storage" jsavargas/process-flac'
alias splitflacfind='docker run --rm -v "`pwd`:/storage" jsavargas/process-flac bash -c "find . -iname *cue -exec flac.process -c {} \;"'

alias zspotify='docker-compose -f /mnt/user/appdata/zspotify/docker-compose.yml run --rm zspotify'

alias figlet='docker run -i --rm mwendler/figlet'
alias tor='docker run --rm --name tor -it -p 8118:8118 -p 9050:9050 dperson/torproxy'
alias unbanKindle='docker-compose -f /mnt/user/jonathan/git/IDN-Subs-Count-UserBot/docker-compose.yml run --rm  bot python bot.unban.py '
alias qbt-delete='docker-compose -f /mnt/user/jonathan/git/qbittorrent/docker-compose.yml  run --rm qbt-bot python delete.py '
alias qbt-move='docker-compose -f /mnt/user/jonathan/git/qbittorrent/docker-compose.yml  run --rm qbt-bot python move.py '

alias vault-start='docker-compose -f /mnt/user/appdata/PVault/docker-compose.yml up -d '
alias vault-stop='docker-compose -f /mnt/user/appdata/PVault/docker-compose.yml stop '
alias vault-restart='docker-compose -f /mnt/user/appdata/PVault/docker-compose.yml restart '

alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage"

alias resync-50='rclone sync -P -vv --drive-server-side-across-configs --max-transfer 50G '