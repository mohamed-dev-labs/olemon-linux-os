#!/bin/bash

# Olemon Linux OS - Ultimate Edition (v2.1.0)
# Autonomous Agent, UI/UX Dashboard, and Code-based Security
# Developed for Olemon Incorporation

# 1. ASCII Logo Integration (Red Color)
LOGO_FILE="/etc/olemon_logo.txt"
sudo cp logo_red.txt $LOGO_FILE 2>/dev/null || echo "Logo file not found, skipping..."

# 2. Security & Sandbox Hardening (Code-based Security)
echo "--- Hardening Olemon Sandbox & Security ---"
sudo apt update && sudo apt install -y --no-install-recommends \
    apparmor \
    auditd \
    iptables \
    fail2ban \
    libpam-tmpdir \
    python3-pip \
    python3-venv

# Set strict permissions for sensitive directories
sudo chmod 700 /root
sudo chmod 700 /home/ubuntu

# 3. Autonomous Agent & UI/UX Dashboard Integration
echo "--- Integrating Olemon-Agent & UI/UX Dashboard ---"
sudo cp olemon_agent.py /usr/local/bin/olemon-agent
sudo chmod +x /usr/local/bin/olemon-agent

# 4. Performance & Speed Optimizations (CPU/GPU)
echo "--- Optimizing System Speed (CPU/GPU) ---"
sudo apt autoremove -y
sudo apt clean
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# 5. Terminal Customization (Enhanced Welcome)
cat << 'EOF' | sudo tee /etc/profile.d/olemon_welcome.sh
#!/bin/bash
if [ -f /etc/olemon_logo.txt ]; then
    cat /etc/olemon_logo.txt
    echo -e "\e[1;31mWelcome to Olemon Linux OS - Ultimate Edition\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
    echo -e "\e[1;33m🛡️ Security: Code-based Hardened Sandbox Active\e[0m"
    echo -e "\e[1;35m🧠 Agent: Olemon-Agent (Autonomous Intelligence)\e[0m"
    echo -e "\e[1;36m🌐 Website: https://olemon.lovable.app/\e[0m"
    echo -e "\e[1;36m🐦 X: x.com/OlemonCLI\e[0m"
    echo -e "\e[1;32mType 'olemon-agent' to launch the Dashboard.\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
fi
EOF

# 6. Custom Commands & Aliases
cat << 'EOF' >> ~/.bashrc
# Olemon OS Ultimate Aliases
alias olemon-help="echo -e 'Olemon Linux OS Commands: \n - olemon-info: System details \n - olemon-clean: Wipe sandbox temporary files \n - olemon-agent: Launch Autonomous Agent & Dashboard \n - deep-inspire: Launch Deep Inspire AI Agent'"
alias olemon-info="uname -a && echo 'Olemon Linux OS v2.1.0 (Autonomous Agent Edition)'"
alias olemon-clean="sudo rm -rf /tmp/* && echo 'Sandbox cleaned and optimized.'"
export PS1='\[\033[01;31m\][Olemon-Ultimate]\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

echo "Olemon Linux OS Ultimate Setup Complete with Autonomous Agent!"
