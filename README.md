# DevOps Environment Setup – Monitoring, Users, and Backup Automation

## 📌 Context
This repository contains automation scripts and sample logs for setting up and managing development environments at **TechCorp**.  
The tasks were performed to support two developers, **Sarah** (Apache server) and **Mike** (Nginx server).  

The setup includes:
1. **System Monitoring** (CPU, memory, disk, processes)
2. **User Management & Access Control**
3. **Automated Web Server Backups** with verification

---

## ✅ Task 1: System Monitoring

### Tools Used
- **htop** and **nmon** → real-time process, CPU, and memory monitoring
- **df** and **du** → track disk usage
- **ps** → identify resource-intensive processes

### Script
- `scripts/setup_monitoring.sh` → installs monitoring tools, collects system metrics, and writes logs.

### Sample Log
`logs/system_metrics_sample.log`



---

## ✅ Task 2: User Management & Access Control

### Steps
- Created users `sarah` and `mike`
- Isolated directories:
  - `/home/sarah/workspace`
  - `/home/mike/workspace`
- Applied secure permissions (`chmod 700`)
- Password policy:
  - Expiry: **30 days**
  - Complexity: Enforced via `/etc/login.defs` and PAM

### Script
- `scripts/setup_users.sh` → automates user creation, workspace setup, and password policy.

## ✅ Task 3: Backup Configuration

### Requirements
- **Sarah (Apache):** `/etc/httpd/` + `/var/www/html/`
- **Mike (Nginx):** `/etc/nginx/` + `/usr/share/nginx/html/`

### Scripts
- `scripts/backup_apache.sh` → backs up Apache files
- `scripts/backup_nginx.sh` → backs up Nginx files
- `scripts/verify_backup.sh` → verifies backups (`tar -tzf` + `sha256sum`)

### Cron Jobs
Run every **Tuesday at 12:00 AM**:


---

## 🚀 How to Run

```bash
# Clone repo
git clone https://github.com/Adish786/devops-environment-setup.git
cd devops-environment-setup/scripts

# Task 1: Setup monitoring
sudo bash setup_monitoring.sh

# Task 2: Setup users
sudo bash setup_users.sh

# Task 3: Run backups
sudo bash backup_apache.sh
sudo bash backup_nginx.sh

# Verify backups
sudo bash verify_backup.sh /backups/apache_backup_YYYY-MM-DD.tar.gz
sudo bash verify_backup.sh /backups/nginx_backup_YYYY-MM-DD.tar.gz
