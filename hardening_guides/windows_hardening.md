# Windows Hardening Guide

This guide covers essential steps to harden Windows operating systems, improving security posture and reducing attack surfaces.

---

## 1. Keep Windows Updated
- Enable automatic updates  
- Regularly install critical and security patches  
- Monitor Microsoft Security Advisories

---

## 2. Use Strong Authentication
- Enforce complex passwords and password expiration policies  
- Enable multi-factor authentication (MFA) where possible  
- Limit the use of Administrator accounts and avoid using them for daily tasks  
- Use Windows Hello or smart cards for enhanced security

---

## 3. Configure User Account Control (UAC)
- Set UAC to the highest level to prevent unauthorized changes  
- Regular users should not have admin privileges  

---

## 4. Disable Unnecessary Services and Features
- Review and disable services not needed (e.g., Telnet, SMBv1)  
- Turn off Windows features that are not required (e.g., Remote Desktop if unused)  

---

## 5. Enable Windows Defender and Other Security Tools
- Ensure Windows Defender Antivirus and Firewall are enabled  
- Configure Windows Defender Exploit Guard and Application Control policies  
- Use Microsoft Defender Advanced Threat Protection (ATP) if available

---

## 6. Implement Network Security Measures
- Enable Windows Firewall with strict inbound and outbound rules  
- Disable SMBv1 and enforce SMB signing  
- Use IPsec for sensitive communications  
- Restrict Remote Desktop access and enforce Network Level Authentication (NLA)

---

## 7. Secure File Systems and Permissions
- Enable BitLocker encryption on system and data drives  
- Regularly audit NTFS permissions and remove excessive rights  
- Use Access Control Lists (ACLs) to enforce least privilege

---

## 8. Enable Auditing and Logging
- Enable Security Auditing via Group Policy  
- Monitor logs for suspicious activity regularly  
- Forward logs to a centralized logging server or SIEM system

---

## 9. Harden Internet Explorer / Edge and Browsers
- Disable unnecessary add-ons and plugins  
- Configure security zones and restrict scripts  
- Enable SmartScreen Filter and other browser protections

---

## 10. Backup and Recovery
- Implement regular system and data backups  
- Test recovery procedures regularly  
- Use System Restore points cautiously

---

## Useful Commands & Tools

- **Check for updates:**  
  ```powershell
  Get-WindowsUpdate

List enabled services:

Get-Service | Where-Object {$_.Status -eq 'Running'}

Enable BitLocker:

Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256

Audit policy status:

    AuditPol /get /category:*

Additional Resources

Microsoft Security Compliance Toolkit
Windows Security Baselines
CIS Microsoft Windows Benchmark

Prepared by [Your Name / Team]
Last updated: YYYY-MM-DD
