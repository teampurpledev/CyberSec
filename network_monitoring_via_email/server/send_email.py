import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def send_email(subject, body):
    sender_email = "test@gmail.com"  # Your gmail address
    password = "app pass"  # Your Gmail app password
    # https://support.google.com/accounts/answer/185833?hl=en
    receiver_email = "manager@example.com"  # Manager email address

    message = MIMEMultipart()
    message["From"] = sender_email
    message["To"] = receiver_email
    message["Subject"] = subject
    message.attach(MIMEText(body, "plain"))

    with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message.as_string())

def read_log_file(filename):
    with open(filename, 'r') as file:
        return file.read().strip()

def main():
    log_file = "log_analysis_output.txt"
    log_content = read_log_file(log_file)

    if not log_content:
        subject = "No Incidents Detected"
        body = "The log analysis output file is empty. No incidents were detected."
    else:
        subject = "Suspicious Network Activity Report"
        body = log_content

    send_email(subject, body)

if __name__ == "__main__":
    main()
