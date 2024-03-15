# 📧 Network Monitoring via E-mail 📈

The goal of this project is to analyze HTTP logs for unusual activity and notify stakeholders via email about any suspicious network behavior.

## What does suspicious network behavior mean? 🕵️‍♂️

* HTTP response code 401 - Unauthorized access attempt.
* HTTP response code 404 - Resource not found.
* HTTP response code 500 - Internal server error.

## How does it work? 🛠️

1. The script `server/sus_network_activity.py` parses the HTTP logs to identify suspicious activities based on predefined error codes mentioned above.
2. The script `server/send_email.py` notifies the user via the predefined email address. Requires a valid [Gmail app password](https://support.google.com/accounts/answer/185833?hl=en) to use.

## How to use it? 🚀

### Generating a weekly report

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

## Contributors 🙌

* Murdoc - teampurple.dev@gmail.com

Feel free to provide feedback to help me improve this project! 🌟