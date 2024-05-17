# Encryption

## Executive Summary

This report aims to outline the current minimum encryption standards and explain how contemporary security methodologies fortify our company against potential cyber threats.

Organizations prioritizing confidentiality and data integrity refrain from storing sensitive data in plaintext. To ensure robust protection, cybersecurity professionals employ encryption techniques with extended key lengths (e.g., 2048 bits), leverage secure hashing algorithms for data integrity validation (e.g., SHA-256), and implement advanced encryption standards (e.g., RSA, AES-256). Finally, we will conclude with a maturing technology that can solve one of the issues all models currently face, the exchanging of keys.

## Understanding Encryption Methods

From the perspective of data, the journey of one encrypted message to your co-worker's inbox resembles this path:

Your message in plaintext -> Cryptographic algorithm that encrypts data -> Ciphertext -> Cryptographic key decrypts ciphertext -> Plaintext

Encryption relies on cryptographic algorithms and keys to encode and decode data. Two primary methods, symmetric and asymmetric encryption, dictate the exchange and management of these keys.

### Symmetric encryption

Symmetric encryption employs a shared key between the sender and receiver, offering efficiency in the encryption and decryption process. However, it poses risks if the shared key is compromised, as both parties rely on the same key for secure communication.

Examples:
* Advanced Encryption Standard (AES): Widely used for its robustness and speed, AES is the standard for encrypting sensitive data.
* ChaCha20: An alternative to AES, known for its efficiency on mobile devices and software implementations, providing high security and performance.

### Asymmetric Encryption

Asymmetric encryption utilizes unique public and private key pairs, providing enhanced security since the private key is never shared. This method, however, demands more processing power due to its complex mathematical operations.

Examples:
* RSA: A widely used encryption and decryption algorithm that relies on the computational difficulty of factoring large integers.
* Diffie-Hellman Key Exchange (DHKE): A method that allows two parties to securely share a common secret key over an insecure channel, essential for establishing secure communications.

### Hashing

Hashing is a process that converts data into a fixed-size string of characters, which typically appears as a random sequence of letters and numbers. It is used primarily for data integrity verification and ensuring that data has not been altered.

Examples:
* SHA-256: Part of the SHA-2 family, SHA-256 generates a 256-bit hash and is widely used in various security protocols, including SSL/TLS and blockchain technology.
* bcrypt: Designed for securely hashing passwords, bcrypt incorporates a salt to protect against rainbow table attacks and allows for adjusting computational cost to remain resilient against brute force attacks.

## Assessing Encryption Strength

The strength of encryption is measured by the complexity of breaking it through brute force techniques. Key size and algorithm selection significantly influence encryption security.

* Key Size Significance: Larger key sizes translate to exponentially greater computational effort required for decryption.

* Algorithmic Security: Algorithms like Advanced Encryption Standard (AES), with block sizes of at least 128 bits, adhere to stringent security standards, ensuring resilience against attacks.

An algorithm that is 64-bit secure means that an attacker will have to perform up to 2^64 (18,446,744,073,709,551,616) operations to break the encryption.

There are many 64-bit block ciphers, such as 3DES and Blowfish, that are still widely supported in Internet security protocols such as TLS, SSH, and IPsec.[1]

The issue with these shorter length ciphers is that they are vulnerable to a birthday attack as demonstrated in the TLS vulnerability CVE-2016-2183.

In 2016, researchers at Inria, the French national institute for research in digital science and technology, were able to recover valuable secrets such as HTTP cookies and passwords in under 40 hours using Sweet32 birthday attack on 3DES encryption.[1]

As per NIST, the current approved security strengths for federal applications are 112, 128, 192, and 256 bits.[2]

As mentioned earlier, AES operates on 128-bit blocks of data, using 128, 192, or 256-bit keys.

Given the secure design and , AES is considered secure by NIST standards.[2]

---

## Encryption recommendations

While ideally you would run the most secure encryption methods all the time, in reality you need to strike a balance between performance and security.

For example, AES (symmetric encryption) is significantly faster than RSA (asymmetric encryption) because it requires fewer computational resources. This makes AES more suitable for encrypting large volumes of data, while RSA is used primarily for encrypting small pieces of data like encryption keys.

To lower operational costs (processing power), organizations can use asymmetric-key encryption (e.g., RSA, Diffie-Hellman Key Exchange (DHKE)) for limited access data such as account credentials, API keys, and session tokens.

For bulk data such as email and high-traffic databases, organizations should use the aforementioned AES to encrypt messages between the server and client.

For hashing data to validate integrity, the organization can use the NIST-approved SHA-256 hashing algorithm.[2]

## Good news on the horizon

There is an exciting new field of privacy-enhancing cryptography (PEC) that leverages maturing techniques such as secure multiparty computation (SMPC), private set intersection (PSI), private information retrieval (PIR), zero knowledge proofs (ZKP), and fully homomorphic encryption (FHE) to protect privacy while enabling the computation of useful statistics.[3]

In zero knowledge proof (ZPK) encryption you never share your private key, the protocol only gives clues about the key's value.

The receipient must answer a series of validations based on those clues to validate that they are the intended recipient.

An illustration of this concept:

![](https://assets-global.website-files.com/5f75fe1dce99248be5a892db/65675748e05656b142834170_65524e78496e0c94f8a1ffa1_zero-knowledge-proof-2048x1544.png)
Source: https://chain.link/education/zero-knowledge-proof-zkp


In this approach, with enough repetition of randomly choosing paths, Bob does not need to know the door code to infer that Alice knows the code.

In practice, this means that during a key exchange, one party can demonstrate to the other that they possess the correct key or credentials without actually disclosing the key itself.

The ZPK approach greatly reduces the risk of interception or eavesdropping during the key exchange process, as the sensitive information remains hidden.

There is an active development community with getting started resources on ZPK in GitHub: https://github.com/matter-labs/awesome-zero-knowledge-proofs

## References

[1] Bhargavan, K., & Leurent, G. (2016, October). *On the practical (in-)security of 64-bit block ciphers*. Sweet32: Birthday attacks on 64-bit block ciphers in TLS and OpenVPN. https://sweet32.info/SWEET32_CCS16.pdf

[2] Barker, E. (2020, March). *NIST Special Publication 800-175B*. NIST. https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-175Br1.pdf

[3] Brandão, L. T. A. N., & Peralta, R. (2021, November 3). *Privacy-enhancing cryptography to complement differential privacy*. NIST. https://www.nist.gov/blogs/cybersecurity-insights/privacy-enhancing-cryptography-complement-differential-privacy