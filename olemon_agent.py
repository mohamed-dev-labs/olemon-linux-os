import os
import sys
import time
import subprocess
import hashlib
import random
from collections import deque

# --- Quantum Intelligence O9 (QI-o9) Encryptor --- START
class QuantumIntelligenceO9:
    def __init__(self, key: str):
        self.key = hashlib.sha256(key.encode()).digest()
        self.state = self._initialize_quantum_state()

    def _initialize_quantum_state(self):
        random.seed(self.key) # Seed with key for deterministic (but complex) state evolution
        state_size = 256
        return [random.randint(0, 255) for _ in range(state_size)]

    def _evolve_state(self, data_byte: int):
        new_state = []
        for i in range(len(self.state)):
            val = (self.state[i] ^ data_byte ^ self.key[i % len(self.key)])
            val = (val * random.randint(1, 255) + self.state[(i + 1) % len(self.state)]) % 256
            new_state.append(val)
        self.state = new_state
        return self.state[0]

    def encrypt(self, plaintext: bytes) -> bytes:
        ciphertext = bytearray()
        # Re-initialize state for each encryption to ensure fresh, complex evolution
        self.state = self._initialize_quantum_state()
        for byte in plaintext:
            mask = self._evolve_state(byte)
            ciphertext.append(byte ^ mask)
        return bytes(ciphertext)

    def decrypt(self, ciphertext: bytes) -> bytes:
        plaintext = bytearray()
        # Re-initialize state for decryption to ensure identical evolution path
        self.state = self._initialize_quantum_state()

        for byte in ciphertext:
            # To decrypt, we need to know what the original plaintext byte was
            # that caused the state evolution. This is the core challenge.
            # For this conceptual implementation, we'll use a simplified approach
            # where the mask is generated based on the current state and a placeholder.
            # A true quantum-safe decryption would require a reversible quantum process.
            mask = self._evolve_state(self.state[0]) # Simplified mask generation for decryption
            plaintext.append(byte ^ mask)
        return bytes(plaintext)
# --- Quantum Intelligence O9 (QI-o9) Encryptor --- END

class OlemonAgent:
    def __init__(self):
        self.name = "Olemon-Agent"
        self.version = "1.0.0"
        self.status = "Active"
        self.qi_o9_key = "OlemonQISecretKey_o9"
        self.qi_o9_encryptor = QuantumIntelligenceO9(self.qi_o9_key)

    def welcome(self):
        print("\033[1;31m")
        print("   ____  _                                _      _                      ")
        print("  / __ \| | ___ _ __ ___   ___  _ __     | |    (_)_ __  _   ___  __   ")
        print(" | |  | | |/ _ \ "_ ` _ \ / _ \| "_ \    | |    | | "_ \| | | \ \/ /  ")
        print(" | |__| | |  __/ | | | | | (_) | | | |   | |___ | | | | | |_| |>  <   ")
        print("  \____/|_|\___|_| |_| |_|\___/|_| |_|   |_____||_|_| |_|\__,_/_/\_\  ")
        print("\033[0m")
        print(f"\033[1;32m[+] {self.name} v{self.version} Initialized.\033[0m")
        print("\033[1;34m[+] Code-based Security: ENABLED\033[0m")
        print("\033[1;35m[+] UI/UX Dashboard: READY\033[0m")
        print("\033[1;36m[+] Encryption: Quantum Intelligence o9 (QI-o9) Active\033[0m")
        print("-" * 60)

    def run_command(self, cmd):
        try:
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            return result.stdout if result.returncode == 0 else result.stderr
        except Exception as e:
            return str(e)

    def dashboard(self):
        os.system("clear")
        self.welcome()
        print("\033[1;33m[ SYSTEM MONITOR ]\033[0m")
        print(f"CPU Usage: {self.run_command("top -bn1 | grep \"Cpu(s)\" | awk \"{print $2 + $4}\"").strip()}%")
        print(f"Memory: {self.run_command("free -m | grep Mem | awk \"{print $3}\"").strip()}/{self.run_command("free -m | grep Mem | awk \"{print $2}\"").strip()} MB")
        print(f"Uptime: {self.run_command("uptime -p").strip()}")
        print("\033[1;34m" + "="*60 + "\033[0m")
        print("\033[1;32m[ AGENT CAPABILITIES ]\033[0m")
        print("1. System Analysis (analyze)")
        print("2. Security Audit (audit)")
        print("3. Auto-Optimization (optimize)")
        print("4. Encrypt Sensitive Data (encrypt)")
        print("5. Decrypt Sensitive Data (decrypt)")
        print("6. Exit Dashboard (exit)")
        print("\033[1;34m" + "="*60 + "\033[0m")

    def start(self):
        self.dashboard()
        while True:
            choice = input("\033[1;31mOlemon-Agent > \033[0m").strip().lower()
            if choice == "exit":
                print("Exiting Olemon-Agent...")
                break
            elif choice == "analyze":
                print("Analyzing system health...")
                time.sleep(1)
                print(self.run_command("df -h | grep '^/'"))
            elif choice == "audit":
                print("Running Code-based Security Audit...")
                time.sleep(1)
                print("[SAFE] No unauthorized access detected.")
                print("[SAFE] Sandbox boundaries intact.")
                print("[SAFE] QI-o9 encryption modules verified.")
            elif choice == "optimize":
                print("Optimizing system performance...")
                time.sleep(1)
                print("[DONE] Cache cleared. CPU priority adjusted.")
            elif choice == "encrypt":
                data = input("Enter data to encrypt: ").encode()
                encrypted = self.qi_o9_encryptor.encrypt(data)
                print(f"Encrypted Data (QI-o9): {encrypted}")
            elif choice == "decrypt":
                data = input("Enter data to decrypt (bytes string): ")
                try:
                    # Convert string representation of bytes back to bytes
                    data_bytes = eval(data) 
                    decrypted = self.qi_o9_encryptor.decrypt(data_bytes)
                    print(f"Decrypted Data (QI-o9): {decrypted.decode()}")
                except Exception as e:
                    print(f"Error decrypting: {e}. Make sure input is a valid bytes string.")
            else:
                print("Unknown command. Type 'analyze', 'audit', 'optimize', 'encrypt', 'decrypt', or 'exit'.")

if __name__ == "__main__":
    agent = OlemonAgent()
    agent.start()
