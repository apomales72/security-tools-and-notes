Linux Hardening Guide
Overview

This document outlines essential steps to secure a Linux system against unauthorized access, malware, and other potential threats. 
It is designed for system administrators and security-conscious users.
1. Keep the System Updated

Always keep your Linux system up-to-date with the latest security patches.

# Debian/Ubuntu
sudo apt update && sudo apt upgrade -y

# CentOS/RHEL
sudo yum update -y

2. Manage User Accounts

Remove unused accounts.
Disable the root login for SSH.
Use strong, unique passwords.

# Lock a user account
sudo usermod -L username

# Disable root SSH login
sudo nano /etc/ssh/sshd_config
# Set: PermitRootLogin no

3. Configure the Firewall

Use ufw or firewalld to control inbound and outbound traffic.

# UFW example
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# firewalld example
sudo firewall-cmd --get-services
sudo firewall-cmd --list-all
sudo firewall-cmd --list-ports
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-port=22/tcp
sudo firewall-cmd --reload

4. Enable Intrusion Detection

Use tools like Fail2Ban or AIDE.

# Install Fail2Ban (Debian/Ubuntu)
sudo apt install fail2ban -y
sudo systemctl enable fail2ban --now
# Install Fail2Ban  (Red Hat/CentOS)

5. Secure SSH Access

Use key-based authentication.
Change the default SSH port.
Limit allowed users.

sudo nano /etc/ssh/sshd_config
# Change Port 2222
# PermitRootLogin no
# AllowUsers youruser
sudo systemctl restart sshd

6. Enable Automatic Updates (Not Recommended in most cases)

# Debian/Ubuntu
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades

7. File Permissions and Auditing

Limit file access.
Enable auditing.

# Set restrictive permissions
chmod 640 /etc/shadow
chmod 644 /etc/passwd

# Install auditd
sudo apt install auditd -y  (Debian/Ubuntu)
sudo yum install auditd -y  (Red Hat/CentOS) 8 and earlier
sudo dnf install auditd -y  (Red Hat/CentOS) 9 and later
sudo systemctl enable auditd --now

8. Disable Unused Services

List running services and disable unnecessary ones.

sudo systemctl list-unit-files --type=service --state=enabled
sudo systemctl disable service_name

9. Use SELinux or AppArmor

# Check SELinux status
getenforce
To set SELinux to enforcing mode, edit the /etc/selinux/config file and 
change the line SELINUX=permissive to SELINUX=enforcing. 
After saving the changes, restart your system for the changes to take effect.

# Enable AppArmor
sudo apt install apparmor apparmor-utils -y
sudo systemctl enable apparmor --now

10. Backups and Recovery

Always keep regular, encrypted backups of critical data.

# Example using tar
tar -czvf backup.tar.gz /path/to/important/files
