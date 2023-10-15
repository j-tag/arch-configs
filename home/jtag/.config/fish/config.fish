# Clear Konsole buffer
alias cls='echo -e "\e[3J" && reset'
# Go to Qt projects
alias code='cd /home/jtag/QtProjects/ && pwd'
# Go to Pure project
alias pure='cd "/home/jtag/Hesam BOSS/PureSoft/Website/pure/" && pwd'
# Go to Xirac project
alias x='cd /home/jtag/QtProjects/xirac-platform/ && pwd'
# Setup proxy server on port 45345
alias ssh-d='kwriteconfig5 --file kioslaverc --group "Proxy Settings" --key ProxyType "1" && ssh -o ExitOnForwardFailure=yes -f -D 0.0.0.0:45345 -N <USER>@<HOST> -p <PORT>'
# Stop proxy connection
alias unssh-d='kwriteconfig5 --file kioslaverc --group "Proxy Settings" --key ProxyType "0"'
# Quiet proxy chain
alias p4q='proxychains4 -q'
# Simple list
alias ll='ls -lh'
# Download audio from YouTube using local proxy at port 45345 with highest quality and embed the thumbnail 
alias ytdlap=' yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --proxy socks5://127.0.0.1:45345'
# Download audio from YouTube with highest quality and embed the thumbnail 
alias ytdla='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail'
# Download video from YouTube using local proxy at port 45345 with highest quality
alias ytdlp='yt-dlp -f "best" --proxy socks5://127.0.0.1:45345'
# Download video from YouTube with highest quality
alias ytdl='yt-dlp -f "best"'
# Git status
alias s='git status'
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
# Run Docker with privileges
alias docker='doas docker'
# Download a file using CURL and show progress and ability to continue download after network fails
alias dl='curl -L -O -C -'
# Replace cat command with bat
alias cat='bat'
# Plain print in bat
alias catp='cat -Pp'
# Use KDE clipboard in xclip
alias xclip='xclip -selection clipboard'
# Date simple format
alias datef='date +%F'

# Custom greetings
function fish_greeting
    echo Welcome (set_color yellow; echo Amoo Hesam; set_color normal)
end

# Set nvim as default editor
set -x EDITOR /usr/bin/nvim

# Add Rust binaries to path
set -a PATH $HOME/.cargo/bin

# Function for downloading a list of URLs using ytdlp
function ytdlpf -d "Download all URLs in a file passed as the argument"
  for line in (cat $argv); ytdlp $line; end
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

# Start Starship prompt utilizing Fish shell
starship init fish | source
