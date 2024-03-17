# 📧 Network Monitoring via E-mail 📈

The goal of this project is to analyze HTTP logs for unusual activity and notify stakeholders via email about any suspicious network behavior.

## What does suspicious network behavior mean? 🕵️‍♂️

* HTTP response code 401 - Unauthorized access attempt. Can detect bruteforce attack (Oliveira 2023).
* HTTP response code 403 - Forbidden. Can detect XSS attack (Meyer 2008).
* HTTP response code 404 - Resource not found. Can detect web crawling reconnaissance.
* HTTP response code 500 - Internal server error.

## How does it work? 🛠️

1. The bash script `client/copy_http_log.sh` copies the HTTP log data from the client machines, to the server's `http.log` file
2. The script `server/sus_network_activity.py` parses the HTTP logs to identify suspicious activities based on predefined error codes mentioned above.
3. The script `server/send_email.py` notifies the user via the predefined email address. Requires a valid [Gmail app password](https://support.google.com/accounts/answer/185833?hl=en) to use.

## How to use it? 🚀

### Client - sending files to server

Recommendation: run this in a virtualized machine (VM) or secure virtual environment.

1. In a text editor, open the `client/copy_http_log.sh` and replace `source_hostname` and `destination_hostname` with the actual hostnames or IP addresses of the source and destination machines.
2. Replace `/path/to/source/log.log` and `/path/to/destination/http.log` with the actual paths of the source log file and the destination log file respectively.
3. Open a terminal
4. Run `crontab -e` to edit your cron jobs.
5. Add the following lines to schedule the script to run the script daily at 11:59PM:

```
59 23 * * * path/to/copy_http_log.sh
```


### Server - Generating a weekly report

1. In a text editor, open the `sus_network_activity.py` and modify the `http.log` file path and error codes in the script as needed.
2. Open the `send_email.py` and modify the `sender_email`, `password`, and `receiver_email` values
3. Open a terminal
4. Run `crontab -e` to edit your cron jobs.
5. Add the following lines to schedule the script to run every Thursday at midnight GMT:

```
0 0 * * 4 /path/to/python3 /path/to/sus_network_activity.py
1 0 * * 4 /path/to/python3 /path/to/send_email.py
```

## Dependencies 📦

* Python 3.x
* `smtplib` - Python SMTP library for sending emails

## References 📚

> Monitor for many failed authentication attempts across various accounts that may result from password spraying attempts.

Oliveira, A. (2023). *Brute Force*. Brute Force, Technique T1110 - Enterprise | MITRE ATT&CK®. https://attack.mitre.org/techniques/T1110/

Meyer, R. (2008). *Detecting Attacks on Web Applications*. GIAC. https://www.giac.org/paper/gcia/1996/detecting-attacks-web-applications-log-files/106864


## Contributors 🙌

* Murdoc - teampurple.dev@gmail.com

Feel free to provide feedback to help me improve this project! 🌟