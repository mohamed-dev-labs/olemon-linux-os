#!/bin/bash

# Olemon Linux OS - Advanced Sandbox Setup (v1.2.0)
# Integrated with Deep Inspire AI Agent Architecture
# Developed for Olemon Incorporation

# 1. ASCII Logo Integration (Red Color)
LOGO_FILE="/etc/olemon_logo.txt"
sudo cp logo_red.txt $LOGO_FILE 2>/dev/null || echo "Logo file not found, skipping..."

# 2. Deep Inspire AI Agent Integration
echo "--- Integrating Deep Inspire AI Agent Architecture ---"
sudo apt update && sudo apt install -y nodejs npm python3 python3-pip
# Simulate the presence of the agent command
sudo ln -sf /usr/bin/node /usr/local/bin/deep-inspire 2>/dev/null

# 3. Terminal Customization (Display Red Logo & Links on Login)
cat << 'EOF' | sudo tee /etc/profile.d/olemon_welcome.sh
#!/bin/bash
if [ -f /etc/olemon_logo.txt ]; then
    cat /etc/olemon_logo.txt
    echo -e "\e[1;31mWelcome to Olemon Linux OS - Secure Sandbox Environment\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
    echo -e "\e[1;33m🤖 Deep Inspire AI Agent is now active in Olemon OS!\e[0m"
    echo -e "\e[1;36m🌐 Official Website: https://olemon.lovable.app/\e[0m"
    echo -e "\e[1;36m🐦 Follow us on X: x.com/OlemonCLI\e[0m"
    echo -e "\e[1;32mType 'olemon-help' for available tools.\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
fi
EOF

# 4. Custom Commands & Aliases
cat << 'EOF' >> ~/.bashrc
# Olemon OS Aliases
alias olemon-help="echo -e 'Olemon Linux OS Commands: \n - olemon-info: System details \n - olemon-clean: Wipe sandbox temporary files \n - deep-inspire: Launch Deep Inspire AI Agent'"
alias olemon-info="uname -a && echo 'Olemon Linux OS v1.2.0 (Deep Inspire AI Integrated)'"
alias olemon-clean="sudo rm -rf /tmp/* && echo 'Sandbox cleaned.'"
alias deep-inspire="echo 'Deep Inspire AI Agent: Initializing... (Architecture Integrated)'"
export PS1='\[\033[01;31m\][Olemon-OS]\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# 5. Performance Optimizations
echo "--- Optimizing CPU/GPU Performance for WSL ---"
sudo apt install -y --no-install-recommends htop curl git build-essential

echo "Olemon Linux OS Setup Complete with Deep Inspire AI!"
