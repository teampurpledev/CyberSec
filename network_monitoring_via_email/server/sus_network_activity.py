from collections import defaultdict

def parse_http_log(log_file, error_codes):
    ip_error_count = defaultdict(lambda: defaultdict(int))

    with open(log_file, 'r') as f:
        for line in f:
            parts = line.split()
            ip_address = parts[0]
            http_status_code = parts[-2]

            if http_status_code in error_codes:
                ip_error_count[ip_address][http_status_code] += 1

    return ip_error_count

def sus_network_activity():
    log_file = "http.log"  # Replace this with the path to your log file
    error_codes = ['500', '401', '404']  # Add more HTTP codes as needed

    ip_error_count = parse_http_log(log_file, error_codes)
    sorted_ip_error_count = dict(sorted(ip_error_count.items(), key=lambda x: sum(x[1].values()), reverse=True))

    with open("log_analysis_output.txt", "w") as output_file:
        for ip, errors in sorted_ip_error_count.items():
            error_str = ", ".join([f"{count} 'HTTP {code}' errors" for code, count in errors.items()])
            output_line = f"IP address {ip} had {error_str}\n"
            print(output_line, end='')
            output_file.write(output_line)

    print("Results stored in: log_analysis_output.txt")

sus_network_activity()

# Sample http.log output:
# IP address 127.0.0.1 had 2 'HTTP 404' errors, 1 'HTTP 500' errors
# IP address 192.16.14.52 had 2 'HTTP 500' errors
# Results stored in: log_analysis_output.txt