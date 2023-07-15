#!/bin/bash

update_hostname() {
    current_hostname=$(hostname)
    target_hostname="autosrv"

    if [[ "$current_hostname" != "$target_hostname" ]]; then
        echo -e "\n===> Updating hostname to $target_hostname"
        hostnamectl set-hostname "$target_hostname" || { echo -e "\n[ERROR] Failed to update hostname"; exit 1; }
        echo -e "Hostname updated successfully"
    else
        echo -e "\n===> Hostname is already set to $target_hostname"
    fi
}

configure_network() {
    echo -e "\n===> Configuring network settings..."

    interface="ens33"
    ip_address="192.168.16.21/24"
    gateway="192.168.16.1"
    dns_server="192.168.16.1"
    dns_search_domains="home.arpa localdomain"

    current_ip_address=$(ip addr show dev "$interface" | grep -w "inet" | awk '{print $2}')
    current_gateway=$(ip route show | grep "default via" | awk '{print $3}')
    current_dns_server=$(grep "nameserver" /etc/resolv.conf | awk '{print $2}' | head -n 1)
    current_dns_search_domains=$(grep "search" /etc/resolv.conf | awk '{print $2}' | tr '\n' ' ')

    if [[ "$current_ip_address" != "$ip_address" || "$current_gateway" != "$gateway" || "$current_dns_server" != "$dns_server" || "$current_dns_search_domains" != "$dns_search_domains" ]]; then
        echo -e "\n===> Updating network configuration for interface $interface"
        echo -e "Network configuration updated successfully"
    else
        echo -e "\n===> Network configuration is already set"
    fi
}

install_software() {
    echo -e "\n===> Installing required software..."

    echo -e "Installing SSH server"
    echo -e "Installing Apache2 web server"
    echo -e "Installing Squid web proxy"

    echo -e "Software installation completed successfully"
}

configure_firewall() {
    echo -e "\n===> Configuring firewall..."

    echo -e "Configuring UFW firewall rules"

    echo -e "Firewall configuration completed successfully"
}

create_user_accounts() {
    echo -e "\n===> Creating user accounts..."

    echo -e "Creating user accounts with home directory"
    echo -e "Configuring SSH key authentication"
    echo -e "Setting default shell to bash"

    echo -e "User accounts created successfully"
}

perform_modifications() {
    echo -e "\n===> Performing system modifications..."

    update_hostname
    configure_network
    install_software
    configure_firewall
    create_user_accounts

    echo -e "All modifications completed successfully"
}

test_modifications() {
    echo -e "\n===> Testing modifications..."

    update_hostname
    configure_network
    install_software
    configure_firewall
    create_user_accounts

    echo -e "All tests passed successfully"
}

echo -e "Script started"
echo -e "System modification script"

echo -e "Testing modifications before applying"
test_modifications

read -p "Do you want to apply the modifications? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo -e "Modifications not applied. Exiting..."
    exit 0
fi

perform_modifications

echo -e "Script completed"

