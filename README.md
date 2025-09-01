How To Run 


# Clone the repo
git clone https://github.com/Adish786/devops-environment-setup.git
cd devops-environment-setup/scripts

# Run monitoring setup
sudo bash setup_monitoring.sh

# Setup users
sudo bash setup_users.sh

# Run backups manually
sudo bash backup_apache.sh
sudo bash backup_nginx.sh
