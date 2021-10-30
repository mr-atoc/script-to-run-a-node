echo Hi. What is swap file size in GB?
read size
echo Continue with $size in GB
#!/bin/bash
grep -q "swapfile" /etc/fstab
if [[ ! $? -ne 0 ]]; then
    echo '\n\e[42m[Swap] Swap file exist, update.\e[0m\n'
    sudo swapoff -a
    sudo dd if=/dev/zero of=/swapfile bs="$sizeG" count=8
    sudo mkswap /swapfile
    sudo swapon /swapfile
    grep SwapTotal /proc/meminfo
else
    sudo fallocate -l "$sizeG" /swapfile
    sudo dd if=/dev/zero of=swapfile bs=1K count=4M
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo swapon --show
    echo '/swapfile swap swap defaults 0 0' >> /etc/fstab
    echo -e '\n\e[42m[Swap] Done\e[0m\n'
fi
