import re
from collections import defaultdict

def parse_http_log(log_file, error_codes):
    # Dictionary to store IP addresses and their error counts
    ip_error_count = defaultdict(lambda: defaultdict(int))

    # Open log file for reading
    with open(log_file, 'r') as f:
        # Iterate through each line in the log file
        for line in f:
            # Using regex to extract IP address and HTTP status code
            match = re.match(r'^(\S+)\s+\S+\s+\S+\s+\[.*?\]\s+"(?:GET|POST|PUT|DELETE)\s+.*?\s+.*?"\s+(\d+)', line)
            if match:
                ip_address = match.group(1)
                http_status_code = match.group(2)

                # Check if HTTP status code is in the specified error codes
                if http_status_code in error_codes:
                    # Increment error count for the IP address and HTTP status code
                    ip_error_count[ip_address][http_status_code] += 1

    return ip_error_count

def sus_network_activity():
    log_file = "http.log"  # Path to the log file
    error_codes = ['401', '403', '404', '500']  # List of HTTP error codes to track

    # Parse the HTTP log and get IP error counts
    ip_error_count = parse_http_log(log_file, error_codes)

    # Sort IP error counts based on the total count of errors
    sorted_ip_error_count = dict(sorted(ip_error_count.items(), key=lambda x: sum(x[1].values()), reverse=True))

    # Write results to an output file
    with open("log_analysis_output.txt", "w") as output_file:
        for ip, errors in sorted_ip_error_count.items():
            # Generate output line for each IP address and its errors
            error_str = ", ".join([f"{count} 'HTTP {code}' errors" for code, count in errors.items()])
            output_line = f"IP address {ip} had {error_str}\n"
            print(output_line, end='')
            output_file.write(output_line)

    print("Results stored in: log_analysis_output.txt")

# Call the main function
sus_network_activity()

# Sample http.log output:
# IP address 127.0.0.1 had 2 'HTTP 404' errors, 1 'HTTP 500' errors
# IP address 192.16.14.52 had 2 'HTTP 500' errors
# Results stored in: log_analysis_output.txt