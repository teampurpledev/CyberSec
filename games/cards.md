## Blue Deck

| Role Name          | CIA Stats                  | Description of Role                                                                                         |
|--------------------|----------------------------|------------------------------------------------------------------------------------------------------------|
| Security Analyst   | +2 Confidentiality, +2 Integrity, +2 Availability | Security Analysts monitor and analyze security events, identify threats, and respond to incidents to protect systems.|
| Developer          | +2 Integrity, +2 Availability, +1 Confidentiality | Developers write and maintain secure code, ensuring that applications are resistant to attacks and vulnerabilities. |
| DevOps             | +3 Availability, +1 Confidentiality, +1 Integrity  | DevOps engineers maintain and optimize infrastructure, ensuring high availability and integrating security practices into the deployment process. |
| CTO                | +1 Confidentiality, +1 Integrity, +1 Availability  | The Chief Technology Officer oversees the organization's technology strategy, balancing security priorities with business needs. |
| Threat Hunter      | +2 Confidentiality, +2 Integrity, +1 Availability  | Threat Hunters proactively search for signs of threats and compromise within the network, aiming to identify and mitigate risks. |
| Vulnerability Engineer | +2 Integrity, +1 Confidentiality, +2 Availability | Vulnerability Engineers identify and remediate security weaknesses in systems and applications to prevent exploitation. |
| Incident Responder | +2 Confidentiality, +2 Integrity, +2 Availability | Incident Responders manage and mitigate security incidents, working to restore normal operations quickly while minimizing damage. |
| Security Architect | +3 Integrity, +2 Confidentiality, +2 Availability  | Security Architects design and implement security structures and frameworks to protect the organization's information systems. |
| Penetration Tester | +2 Confidentiality, +3 Integrity, +1 Availability  | Penetration Testers simulate attacks on systems to identify and address vulnerabilities before malicious actors can exploit them. |
| Compliance Officer | +2 Confidentiality, +2 Integrity, +1 Availability  | Compliance Officers ensure the organization adheres to regulatory requirements and internal policies, safeguarding data integrity and privacy. |
| Security Trainer   | +2 Confidentiality, +2 Integrity, +2 Availability  | Security Trainers educate employees on best practices and protocols to enhance overall security awareness and reduce human-related risks. |
| CEO                | -1 Confidentiality, -1 Integrity, +3 Availability  | The Chief Executive Officer focuses on business growth and continuity, which can sometimes lead to prioritizing availability over strict security controls. |

## Red Deck

| TTP Name                | CIA Stats Impact        | Description                                                                                                  |
|-------------------------|-------------------------|-------------------------------------------------------------------------------------------------------------|
| Denial of Service       | -3 Availability         | Overwhelming a system or network to make it unavailable to users, disrupting normal operations.              |
| Stored Data Manipulation| -3 Integrity            | Altering data stored on a system to cause harm or achieve malicious goals, compromising data accuracy.       |
| Phishing                | -2 Confidentiality      | Using deceptive emails or messages to trick users into revealing sensitive information or credentials.       |
| Ransomware              | -3 Confidentiality, -3 Availability | Encrypting data and demanding payment for decryption keys, making data inaccessible and compromising confidentiality. |
| Credential Dumping      | -2 Confidentiality      | Extracting account credentials from systems to gain unauthorized access to resources.                       |
| Man-in-the-Middle Attack| -2 Integrity, -2 Confidentiality | Intercepting and potentially altering communications between two parties without their knowledge.            |
| Data Exfiltration       | -3 Confidentiality      | Unauthorized transfer of data from an organization, leading to information leakage and loss.                 |
| Supply Chain Attack     | -2 Integrity, -1 Availability | Compromising third-party services or software used by the target to introduce vulnerabilities.              |
| SQL Injection           | -3 Integrity            | Inserting malicious SQL queries into input fields to manipulate database operations and extract or alter data.|
| Exploit Public-Facing Application | -2 Availability, -2 Integrity | Taking advantage of vulnerabilities in internet-facing applications to disrupt services or modify data.      |
