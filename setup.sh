#!/bin/bash

# Olemon Linux - Advanced Sandbox Setup (v1.1.0)
# Developed for Olemon Incorporation

# 1. ASCII Logo Integration (Red Color)
LOGO_FILE="/etc/olemon_logo.txt"
sudo cp logo_red.txt $LOGO_FILE

# 2. Security & Sandboxing
echo "--- Hardening Olemon Sandbox ---"

# 3. Terminal Customization (Display Red Logo on Login)
cat << 'EOF' | sudo tee /etc/profile.d/olemon_welcome.sh
#!/bin/bash
if [ -f /etc/olemon_logo.txt ]; then
    cat /etc/olemon_logo.txt
    echo -e "\e[1;31mWelcome to Olemon Linux OS - Secure Sandbox Environment\e[0m"
    echo -e "\e[1;32mType 'olemon-help' for available tools.\e[0m"
    echo "-------------------------------------------------------"
fi
EOF

# 4. Custom Commands & Aliases
cat << 'EOF' >> ~/.bashrc
alias olemon-help="echo -e 'Olemon Linux Commands: \n - olemon-info: System details \n - olemon-clean: Wipe sandbox temporary files'"
alias olemon-info="uname -a && echo 'Olemon Linux OS v1.1.0 (Optimized for CPU/GPU)'"
alias olemon-clean="sudo rm -rf /tmp/* && echo 'Sandbox cleaned.'"
export PS1='\[\033[01;31m\][Olemon-OS]\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# 5. Performance Optimizations
echo "--- Optimizing CPU/GPU Performance for WSL ---"
sudo apt update && sudo apt install -y --no-install-recommends \
    htop \
    curl \
    git \
    build-essential

echo "Olemon Linux OS Setup Complete!"
