### What is an Indicator of Compromise (IoC)?

An Indicator of Compromise (IoC) is a piece of digital forensics evidence that suggests a system or network may have been compromised. IoCs are critical in cybersecurity as they help identify, detect, and respond to potential security incidents. They include a range of artifacts such as file hashes, IP addresses, domain names, URLs, and behavioral patterns that indicate malicious activity.

### Types of IoCs

The different types of IoCs can be categorized into a hierarchy often referred to as the Pyramid of Pain.

![](https://media.licdn.com/dms/image/D4D12AQGd2YCEuIl21Q/article-inline_image-shrink_1500_2232/0/1674720822041?e=1721260800&v=beta&t=82Tt_M0dL9HjboAYUQMrLWUwRGTTF6cde5dhbBGpDJA)

This pyramid ranks IoCs based on how challenging they are for adversaries to change and how useful they are for defenders to detect and respond to threats. Starting from the easiest, or the bottom of the pyramid, here are the different types of IoCs:

#### 1. Hash Values

**Hash values** are cryptographic representations (such as MD5, SHA-1, SHA-256) of a file or piece of data. They serve as a digital fingerprint. If an adversary modifies even a single byte in a file, the hash value will change, making it easy to detect alterations.

- **Examples**: `d41d8cd98f00b204e9800998ecf8427e` (MD5 hash of an empty file)

**Advantages**: Easy to use and compare.  
**Challenges for Adversaries**: Simple for adversaries to change by altering the file slightly.

**References**: [VirusTotal](https://www.virustotal.com/), [Malware Bazaar](https://bazaar.abuse.ch/)

#### 2. IP Addresses

**IP addresses** identify the source or destination of network traffic. Monitoring specific IP addresses known to be associated with malicious activity can help detect potential threats.

- **Examples**: `192.168.1.1`, `203.0.113.5`

**Advantages**: Useful for identifying the origin of network connections.  
**Challenges for Adversaries**: Moderately difficult to change due to the limited number of IP addresses available and reliance on certain infrastructure.

**References**: [Spamhaus](https://www.spamhaus.org/), [AbuseIPDB](https://www.abuseipdb.com/)

#### 3. Domain Names

**Domain names** are human-readable addresses used to identify resources on the internet. Malicious actors often use specific domains to host command-and-control servers or distribute malware.

- **Examples**: `malicious-site.com`, `phishing-attack.org`

**Advantages**: Effective for blocking or monitoring connections.  
**Challenges for Adversaries**: More challenging to change than IP addresses due to the need for domain registration and DNS propagation.

**References**: [PhishTank](https://www.phishtank.com/), [OpenPhish](https://openphish.com/)

#### 4. URLs

**URLs** specify the exact location of a resource on the internet. They include the domain name and additional path information. Malicious URLs often point to phishing sites, malware downloads, or exploit kits.

- **Examples**: `http://malicious-site.com/downloads/malware.exe`

**Advantages**: Highly specific and can be used to block access to known malicious content.  
**Challenges for Adversaries**: Easier to change than domains, but still requires infrastructure adjustments.

**References**: [URLhaus](https://urlhaus.abuse.ch/), [Google Safe Browsing](https://safebrowsing.google.com/)

#### 5. Network/Host Artifacts

**Network/Host artifacts** include specific patterns of network traffic, file names, registry keys, or system configurations that indicate a compromise. These artifacts are more complex and provide deeper insight into the attack.

- **Examples**: Specific registry key modifications, known malicious file names, particular traffic patterns indicating data exfiltration.

**Advantages**: Difficult to alter and often indicative of more sophisticated attacks.  
**Challenges for Adversaries**: Changing these requires altering the behavior of their tools or their methods significantly.

**References**: [AlienVault OTX](https://otx.alienvault.com/), [MITRE ATT&CK](https://attack.mitre.org/)

#### 6. Tools

**Tools** refer to software and scripts used by attackers to conduct their operations. These can include malware, remote access tools (RATs), and exploit kits.

- **Examples**: Metasploit, Cobalt Strike, Mimikatz

**Advantages**: Identifying specific tools can provide a wealth of information about the attacker's capabilities and methods.  
**Challenges for Adversaries**: Developing or acquiring new tools is resource-intensive and time-consuming.

**References**: [VirusTotal](https://www.virustotal.com/), [Hybrid Analysis](https://www.hybrid-analysis.com/)

#### 7. Tactics, Techniques, and Procedures (TTPs)

**Tactics, Techniques, and Procedures (TTPs)** describe the overall behavior and methodology of adversaries. This includes their strategic objectives (tactics), the methods they use to achieve those objectives (techniques), and the specific implementation details (procedures).

- **Examples**: Using spear phishing emails for initial access (tactic), employing PowerShell scripts for lateral movement (technique), and the specific code and commands used in those scripts (procedures).

**Advantages**: Most challenging for adversaries to change because TTPs are deeply ingrained in their operational methods.  
**Challenges for Adversaries**: Altering TTPs often requires a fundamental change in their modus operandi, making it the most effective way to disrupt their activities.

**References**: [MITRE ATT&CK](https://attack.mitre.org/), [CISA Alerts](https://www.cisa.gov/uscert/ncas/alerts)


## Other IoC references:

A curated list of awesome Threat Intelligence resources:  
https://github.com/hslatman/awesome-threat-intelligence