#!/bin/bash

apt-get update
apt-get upgrade -y

apt-get install fail2ban ufw -y

useradd deploy
mkdir /home/deploy
mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh

# Add public keys for SSH access
curl https://pub.hashtagjohnt.com > /home/deploy/.ssh/authorized_keys
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R

# Change shell to be bash by default
chsh -s /bin/bash deploy

echo 'Set a password for deploy'
sleep 0.5
passwd deploy

echo -e 'deploy\tALL=(ALL) ALL' >> /etc/sudoers

# No root login, don't ask for password
sed -i 's/^#\{0,1\}PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/^#\{0,1\}PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

service ssh restart

# Set up a firewall
ufw allow 22
ufw allow 80
ufw allow 443
ufw enable

# Enable automatic security updates
apt-get install unattended-upgrades

#
echo 'APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
' > /etc/apt/apt.conf.d/10periodic

echo '// Automatically upgrade packages from these (origin:archive) pairs
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESM:${distro_codename}";
//      "${distro_id}:${distro_codename}-updates";
//      "${distro_id}:${distro_codename}-proposed";
//      "${distro_id}:${distro_codename}-backports";
};

// List of packages to not update (regexp are supported)
Unattended-Upgrade::Package-Blacklist {
//      "vim";
//      "libc6";
//      "libc6-dev";
//      "libc6-i686";
};
' > /etc/apt/apt.conf.d/50unattended-upgrades

echo 'done'

