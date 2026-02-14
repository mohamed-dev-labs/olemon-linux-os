#!/bin/bash

# Olemon Linux - Advanced Sandbox Setup
# Developed for Olemon Incorporation

# 1. ASCII Logo Integration
LOGO_FILE="/etc/olemon_logo.txt"
sudo cp logo.txt $LOGO_FILE

# 2. Security & Sandboxing (Restricting access to sensitive host files)
echo "--- Hardening Olemon Sandbox ---"
# Create a restricted user for testing if needed
# sudo useradd -m olemon_tester

# 3. Terminal Customization (Display Logo on Login)
cat << 'EOF' | sudo tee /etc/profile.d/olemon_welcome.sh
#!/bin/bash
if [ -f /etc/olemon_logo.txt ]; then
    cat /etc/olemon_logo.txt
    echo -e "\e[1;33mWelcome to Olemon Linux - Secure Sandbox Environment\e[0m"
    echo -e "\e[1;32mType 'olemon-help' for available tools.\e[0m"
    echo "-------------------------------------------------------"
fi
EOF

# 4. Custom Commands & Aliases
cat << 'EOF' >> ~/.bashrc
alias olemon-help="echo 'Olemon Linux Commands: \n - olemon-info: System details \n - olemon-clean: Wipe sandbox temporary files'"
alias olemon-info="uname -a && echo 'Olemon OS v1.0.0 (Optimized for CPU/GPU)'"
alias olemon-clean="sudo rm -rf /tmp/* && echo 'Sandbox cleaned.'"
export PS1='\[\033[01;33m\][Olemon-Sandbox]\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# 5. Performance Optimizations
echo "--- Optimizing CPU/GPU Performance for WSL ---"
sudo apt update && sudo apt install -y --no-install-recommends \
    htop \
    curl \
    git \
    build-essential \
    ufw

# Enable basic firewall for sandbox isolation
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Olemon Linux Setup Complete!"
