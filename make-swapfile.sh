sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
cat << EOF | sudo tee -a /etc/fstab
/swapfile   none    swap    sw    0   0
EOF