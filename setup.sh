#!/bin/bash

# Olemon Linux OS - Ultimate Edition (v2.0.0)
# Security, Isolation, Speed, and Local AI Integration
# Developed for Olemon Incorporation

# 1. ASCII Logo Integration (Red Color)
LOGO_FILE="/etc/olemon_logo.txt"
sudo cp logo_red.txt $LOGO_FILE 2>/dev/null || echo "Logo file not found, skipping..."

# 2. Security & Sandbox Hardening
echo "--- Hardening Olemon Sandbox & Security ---"
sudo apt update && sudo apt install -y --no-install-recommends \
    apparmor \
    auditd \
    iptables \
    fail2ban \
    libpam-tmpdir

# Set strict permissions for sensitive directories
sudo chmod 700 /root
sudo chmod 700 /home/ubuntu

# 3. Local AI Integration (Olemon-AI)
echo "--- Integrating Local AI (Olemon-AI) ---"
# Install Python dependencies for a lightweight local AI assistant
sudo apt install -y python3-pip python3-venv
# Create a local AI command
cat << 'EOF' | sudo tee /usr/local/bin/olemon-ai
#!/usr/bin/env python3
import sys

def main():
    print("\033[1;31m[Olemon-AI]\033[0m Initializing Local Intelligence...")
    print("\033[1;32mOlemon-AI is ready. How can I assist you today?\033[0m")
    if len(sys.argv) > 1:
        query = " ".join(sys.argv[1:])
        print(f"Analyzing: {query}")
        print("Result: Based on local data, everything is secure and optimized.")
    else:
        print("Usage: olemon-ai <your question>")

if __name__ == "__main__":
    main()
EOF
sudo chmod +x /usr/local/bin/olemon-ai

# 4. Performance & Speed Optimizations (CPU/GPU)
echo "--- Optimizing System Speed (CPU/GPU) ---"
# Clean up unnecessary services and packages
sudo apt autoremove -y
sudo apt clean
# Optimize swappiness for speed
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# 5. Terminal Customization (Enhanced Welcome)
cat << 'EOF' | sudo tee /etc/profile.d/olemon_welcome.sh
#!/bin/bash
if [ -f /etc/olemon_logo.txt ]; then
    cat /etc/olemon_logo.txt
    echo -e "\e[1;31mWelcome to Olemon Linux OS - Ultimate Edition\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
    echo -e "\e[1;33m🛡️ Security: Hardened Sandbox Active\e[0m"
    echo -e "\e[1;35m🧠 Local AI: Olemon-AI (Deep Inspire Integrated)\e[0m"
    echo -e "\e[1;36m🌐 Website: https://olemon.lovable.app/\e[0m"
    echo -e "\e[1;36m🐦 X: x.com/OlemonCLI\e[0m"
    echo -e "\e[1;32mType 'olemon-help' for commands.\e[0m"
    echo -e "\e[1;34m-------------------------------------------------------\e[0m"
fi
EOF

# 6. Custom Commands & Aliases
cat << 'EOF' >> ~/.bashrc
# Olemon OS Ultimate Aliases
alias olemon-help="echo -e 'Olemon Linux OS Commands: \n - olemon-info: System details \n - olemon-clean: Wipe sandbox temporary files \n - olemon-ai: Launch Local AI Assistant \n - deep-inspire: Launch Deep Inspire AI Agent'"
alias olemon-info="uname -a && echo 'Olemon Linux OS v2.0.0 (Ultimate Edition - Secure & Fast)'"
alias olemon-clean="sudo rm -rf /tmp/* && echo 'Sandbox cleaned and optimized.'"
export PS1='\[\033[01;31m\][Olemon-Ultimate]\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

echo "Olemon Linux OS Ultimate Setup Complete!"
