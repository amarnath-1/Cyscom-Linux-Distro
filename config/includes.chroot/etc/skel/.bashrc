# CysCom Custom Prompt (Dark Blue Theme)
export PS1='\[\033[01;36m\]\u@cyscom\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Colorful ls
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

# CysCom ASCII Banner
cat << "EOF"
  ____           ____                  
 / ___|   _ ___ / ___|___  _ __ ___  
| |  | | | / __| |   / _ \| '_ ` _ \ 
| |__| |_| \__ \ |__| (_) | | | | | |
 \____\__, |___/\____\___/|_| |_| |_|
      |___/  Security OS v1.0                        
EOF

echo ""
echo "Welcome to CysCom Security OS - Cybersecurity Training Platform"
echo "Type 'cyshelp' for available tools"
echo ""
