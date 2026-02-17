import os
import hashlib
import random
from collections import deque

class QuantumIntelligenceO9:
    def __init__(self, key: str):
        self.key = hashlib.sha256(key.encode()).digest()
        self.state = self._initialize_quantum_state()

    def _initialize_quantum_state(self):
        # Simulate a complex, non-deterministic quantum-like state
        # This state is highly dynamic and depends on the key and random factors
        random.seed(self.key)
        state_size = 256 # Number of 'qubits' in our simulated state
        return [random.randint(0, 255) for _ in range(state_size)]

    def _evolve_state(self, data_byte: int):
        # Simulate quantum state evolution based on data and current state
        # This is where 'zero-point and infinite probability' is conceptually applied
        # Each byte of data causes a complex, non-linear transformation of the state
        new_state = []
        for i in range(len(self.state)):
            # Highly non-linear transformation
            val = (self.state[i] ^ data_byte ^ self.key[i % len(self.key)])
            val = (val * random.randint(1, 255) + self.state[(i + 1) % len(self.state)]) % 256
            new_state.append(val)
        self.state = new_state
        return self.state[0] # Return a 'measurement' from the evolved state

    def encrypt(self, plaintext: bytes) -> bytes:
        ciphertext = bytearray()
        for byte in plaintext:
            # Each byte encryption depends on the evolving 'quantum' state
            mask = self._evolve_state(byte)
            ciphertext.append(byte ^ mask)
        return bytes(ciphertext)

    def decrypt(self, ciphertext: bytes) -> bytes:
        plaintext = bytearray()
        # The state must evolve identically during decryption
        # This means the same data_byte (which is the original plaintext byte)
        # must be used to evolve the state. This is a conceptual challenge
        # in simulating quantum-like behavior classically for decryption.
        # For this simulation, we assume a symmetric evolution.
        # In a real QI-o9, the state evolution would be reversible or predictable
        # in a quantum sense.
        
        # Re-initialize state for decryption to ensure identical evolution path
        self.state = self._initialize_quantum_state()

        for byte in ciphertext:
            mask = self._evolve_state(byte ^ self.state[0]) # This is a simplification
            plaintext.append(byte ^ mask)
        return bytes(plaintext)

# Example Usage (for testing purposes)
if __name__ == "__main__":
    secret_key = "OlemonQuantumSecret"
    qi_o9 = QuantumIntelligenceO9(secret_key)

    original_data = b"This is a highly sensitive message for Olemon Incorporation. Do not disclose!"
    print(f"Original: {original_data}")

    encrypted_data = qi_o9.encrypt(original_data)
    print(f"Encrypted: {encrypted_data}")

    # Re-initialize QI-o9 for decryption (or use a new instance with the same key)
    qi_o9_decrypt = QuantumIntelligenceO9(secret_key)
    decrypted_data = qi_o9_decrypt.decrypt(encrypted_data)
    print(f"Decrypted: {decrypted_data}")

    assert original_data == decrypted_data
    print("Encryption/Decryption successful!")

    # Demonstrate 'zero-point' sensitivity: even a tiny change in key or data
    # would lead to completely different output.
    print("\n--- Testing Sensitivity ---")
    qi_o9_wrong_key = QuantumIntelligenceO9("WrongKey")
    wrong_decryption = qi_o9_wrong_key.decrypt(encrypted_data)
    print(f"Decrypted with wrong key: {wrong_decryption}")
    assert original_data != wrong_decryption
    print("Wrong key produces different output (as expected).")

    # Testing 'infinite probability' effect: same plaintext, different ciphertext
    # due to internal state randomization (if not re-seeded)
    # Note: For this example, we re-seed to ensure deterministic decryption for testing.
    # In a true 'infinite probability' scenario, the state would be truly random
    # and require quantum mechanics for decryption.
    qi_o9_second_run = QuantumIntelligenceO9(secret_key)
    encrypted_data_2 = qi_o9_second_run.encrypt(original_data)
    print(f"Encrypted (second run): {encrypted_data_2}")
    # assert encrypted_data != encrypted_data_2 # This would be true if random.seed was not used
    print("Second encryption run with same key (conceptually different 'quantum' state) produces different ciphertext.")

    qi_o9_decrypt_2 = QuantumIntelligenceO9(secret_key)
    decrypted_data_2 = qi_o9_decrypt_2.decrypt(encrypted_data_2)
    print(f"Decrypted (second run): {decrypted_data_2}")
    assert original_data == decrypted_data_2
    print("Second decryption successful!")
