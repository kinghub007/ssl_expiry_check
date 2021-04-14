# SSL Certificate Expiry Checks
Checks SSL certificates validity days and prints name of the hosts and days remainning to expire their SSL certificates.


## Clone the repository
Clone the repository, modify the file ``` hosts.txt``` with list of FQDN:PORT and make the script executable if needed. 
```bash
cd ~/
git clone git@gitea.modirum.com:kingshuk.chowdhury/ssl_cert_check.git
cd ssl_cert_check
sudo chmod +x cert_check.sh
```

## CLI Usage:
```bash
./cert_check.sh
```
