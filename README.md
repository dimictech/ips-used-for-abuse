<a href="https://www.abuseipdb.com/user/158909" title="AbuseIPDB is an IP address blacklist for webmasters and sysadmins to report IP addresses engaging in abusive behavior on their networks">
	<img src="https://www.abuseipdb.com/contributor/158909.svg" alt="AbuseIPDB Contributor Badge" style="width: 381px;border-radius: 5px;border-top: 5px solid #058403;border-right: 5px solid #111;border-bottom: 5px solid #111;border-left: 5px solid #058403;padding: 5px;background: #35c246 linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.3) 50%, rgba(0,0,0,.2) 51%, rgba(0,0,0,0));padding: 5px;">
</a>

# Blocking Malicious IP Addresses

The following list of IP addresses has been identified by our honeypot system. These IPs have been involved in activities such as port scanning, brute forcing, and other malicious attempts to compromise our network infrastructure.

To block these IP addresses, please use our `ip.sh` script. This script will execute the command `sudo ufw deny {IP}` for each IP address in the list, effectively denying them access to our network.

## Usage Instructions

1. Ensure the list of malicious IP addresses is saved in a text file (e.g., `malicious_ips.txt`), with one IP address per line.
2. Save the `ip.sh` script provided below to your desired directory.
3. Make the script executable by running the following command:
   ```bash
   chmod +x ip.sh
   ```
4. Execute the script, providing the path to your IP list file as an argument:
   ```bash
   ./ip.sh malicious_ips.txt
   ```

## Script (`ip.sh`)

```bash
#!/bin/bash

# Check if file is provided as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file line by line
while IFS= read -r ip; do
    if [[ ! -z "$ip" ]]; then
        # Apply the deny rule using UFW
        echo "Denying IP: $ip"
        sudo ufw deny from "$ip"
    fi
done < "$1"

echo "All IPs have been processed."
```

This script ensures that all IP addresses listed in the file are blocked from accessing your network, enhancing your security measures against these identified threats.
