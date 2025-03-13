# Clear Konsole buffer
alias cls='echo -e "\e[3J" && reset'
# Setup proxy server on port 45345
alias ssh-d='kwriteconfig5 --file kioslaverc --group "Proxy Settings" --key ProxyType "1" && ssh -o ExitOnForwardFailure=yes -f -D 0.0.0.0:45345 -N <USER>@<HOST> -p <PORT>'
# Stop proxy connection
alias unssh-d='kwriteconfig5 --file kioslaverc --group "Proxy Settings" --key ProxyType "0"'
# Quiet proxy chain
alias p4q='proxychains4 -q'
# Simple list
alias ll='ls -lh'
# Download audio from YouTube with highest quality and embed the thumbnail 
alias ytdla='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail'
# Download audio from YouTube using local proxy at port 45345 with highest quality and embed the thumbnail 
alias ytdlap='ytdla --proxy socks5://127.0.0.1:45345'
# Download video from YouTube with highest quality
alias ytdl='yt-dlp'
# Download video from YouTube using local proxy at port 45345 with highest quality
alias ytdlp='ytdl --proxy socks5://127.0.0.1:45345'
# Git status
alias s='git status'
# Git fetch
alias f='git fetch'
# Git push
alias push='git push'
# Git pull
alias pull='git pull'
# Git checkout
alias checkout='git checkout'
# Git  branch
alias branch='git branch'
# Git commit
alias commit='git commit'
# Git add
alias add='git add'
# Git clone
alias clone='git clone'
# Git merge
alias merge='git merge'
# Git rebase
alias rebase='git rebase'
# Download a file using CURL and show progress and ability to continue download after network fails
alias dl='watch -n 69 curl -L -O -C -'
# Replace cat command with bat
alias cat='bat'
# Plain print in bat
alias catp='cat -Pp'
# Date simple format
alias datef='date +%F'
# RedwoodJS shorthand
alias rw='yarn rw'
# Expo shorthand
alias expo='npx expo'
# NeoVim shorthand
alias v='nvim'
# NeoVide shorthand
alias nv='neovide'
# Connect to ExpressVPN
alias ec='expressvpn connect'
# Disconnect from ExpressVPN
alias ed='expressvpn disconnect'
# Restart Docker service
alias dr='doas systemctl restart docker'
# Stop Docker service
alias ds='doas systemctl stop docker'
# Make shorthand
alias m='make'

# Custom greetings
function fish_greeting
    echo Welcome (set_color yellow; echo Amoo Hesam; set_color normal)
end

# Function for downloading a list of URLs using ytdlp
function ytdlf -d "Download all URLs in a file passed as the argument"
  for line in (cat $argv); ytdl $line; end
end

# Function for converting all files from a certain extension to another extension using ffmpeg
function ffmpegd -d "Convert all files in current directory using ffmpeg. Usage: ffmpegd 3gp mp4"
  set -f from $argv[1]
  set -f to $argv[2]
  echo Converting all .$from files to .$to
  for file in *.$from
    set -f output_name (path change-extension $to $file)
    echo Converting $file to $output_name ...
    ffmpeg -i $file $output_name
  end
end

# Set nvim as default editor
set -x EDITOR /usr/bin/nvim

# Add Rust binaries to path
set -a PATH $HOME/.cargo/bin

# Start Starship prompt utilizing Fish shell
starship init fish | source
