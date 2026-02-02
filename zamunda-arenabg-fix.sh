#!/bin/bash

# Zamunda.NET & ArenaBG.com Fix Tool for macOS/Linux
# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Hosts file location
if [[ "$OSTYPE" == "darwin"* ]]; then
    HOSTS_FILE="/etc/hosts"
    OS_NAME="macOS"
else
    HOSTS_FILE="/etc/hosts"
    OS_NAME="Linux"
fi

# Function to print colored text
print_header() {
    echo -e "${CYAN}============================================${NC}"
    echo -e "${CYAN} $1${NC}"
    echo -e "${CYAN}============================================${NC}"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check if running with sudo
check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        clear
        print_header "ADMINISTRATOR RIGHTS REQUIRED"
        echo ""
        print_error "This script needs to run with sudo to modify the hosts file."
        echo ""
        echo "Please run: sudo $0"
        echo ""
        exit 1
    fi
}

# Backup hosts file
backup_hosts() {
    local backup_file="${HOSTS_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$HOSTS_FILE" "$backup_file"
    print_success "Backup created: $backup_file"
}

# Update hosts file
update_hosts() {
    print_info "Updating hosts file..."
    echo ""
    
    # Check if entries already exist
    if grep -q "5.181.156.140 arenabg.com" "$HOSTS_FILE" 2>/dev/null; then
        print_success "Hosts file entries already configured"
        return 0
    fi
    
    # Backup first
    backup_hosts
    
    # Remove old entries if they exist
    sed -i.tmp '/arenabg\.com/d' "$HOSTS_FILE"
    sed -i.tmp '/zamunda\.net/d' "$HOSTS_FILE"
    rm -f "${HOSTS_FILE}.tmp"
    
    # Add new entries
    cat >> "$HOSTS_FILE" << EOF

# Zamunda and ArenaBG Fix
5.181.156.140 arenabg.com
5.181.156.140 www.arenabg.com
51.159.12.143 cdn.arenabg.com
104.21.23.130 zamunda.net
104.21.23.130 www.zamunda.net
EOF
    
    print_success "Hosts file updated successfully"
}

# Flush DNS cache
flush_dns() {
    echo ""
    print_info "Flushing DNS cache..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sudo dscacheutil -flushcache
        sudo killall -HUP mDNSResponder
    else
        # Linux
        if command -v systemd-resolve &> /dev/null; then
            sudo systemd-resolve --flush-caches
        elif command -v resolvectl &> /dev/null; then
            sudo resolvectl flush-caches
        elif [ -f /etc/init.d/nscd ]; then
            sudo /etc/init.d/nscd restart
        else
            print_info "Could not flush DNS cache automatically. You may need to restart your browser."
        fi
    fi
    
    print_success "DNS cache flushed"
}

# Open URL in default browser
open_url() {
    local url="$1"
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$url"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "$url" &> /dev/null
    elif command -v gnome-open &> /dev/null; then
        gnome-open "$url" &> /dev/null
    else
        print_info "Please open this URL manually: $url"
    fi
}

# Main menu
show_menu() {
    clear
    print_header "ZAMUNDA.NET & ARENABG.COM FIX TOOL"
    echo ""
    echo -e "${BLUE}Running on: $OS_NAME${NC}"
    echo ""
    
    # Check hosts file status
    if grep -q "5.181.156.140 arenabg.com" "$HOSTS_FILE" 2>/dev/null; then
        print_success "Hosts file entries configured"
    else
        print_info "Hosts file needs to be updated"
    fi
    
    echo ""
    print_header "MENU"
    echo ""
    echo "IMPORTANT: After opening the website, press CMD+SHIFT+R (macOS)"
    echo "           or CTRL+SHIFT+R (Linux) to force refresh!"
    echo ""
    echo -e "${CYAN}============================================${NC}"
    echo ""
    echo "What would you like to do?"
    echo ""
    echo "[1] Login to Zamunda.NET"
    echo "[2] Login to Zamunda.CH"
    echo "[3] Visit ArenaBG.com (no login needed)"
    echo "[4] Just visit Zamunda.NET (if already logged in)"
    echo "[5] Just visit Zamunda.CH (if already logged in)"
    echo "[6] Exit"
    echo ""
    read -p "Enter your choice (1-6): " choice
    
    case $choice in
        1) zamunda_net_login ;;
        2) zamunda_ch_login ;;
        3) arenabg_visit ;;
        4) zamunda_net_visit ;;
        5) zamunda_ch_visit ;;
        6) exit_script ;;
        *) 
            print_error "Invalid choice. Please try again."
            sleep 2
            show_menu
            ;;
    esac
}

# Login functions
zamunda_net_login() {
    clear
    print_header "ZAMUNDA.NET LOGIN"
    echo ""
    read -p "Enter your username: " username
    read -s -p "Enter your password: " password
    echo ""
    echo ""
    print_info "Opening Zamunda.NET login page..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Remember to press CMD + SHIFT + R once the page loads!"
    else
        echo "Remember to press CTRL + SHIFT + R once the page loads!"
    fi
    echo ""
    
    open_url "https://zamunda.net/takelogin.php?username=${username}&password=${password}"
    sleep 3
    show_menu
}

zamunda_ch_login() {
    clear
    print_header "ZAMUNDA.CH LOGIN"
    echo ""
    read -p "Enter your username: " username
    read -s -p "Enter your password: " password
    echo ""
    echo ""
    print_info "Opening Zamunda.CH login page..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Remember to press CMD + SHIFT + R once the page loads!"
    else
        echo "Remember to press CTRL + SHIFT + R once the page loads!"
    fi
    echo ""
    
    open_url "https://zamunda.ch/takelogin.php?username=${username}&password=${password}"
    sleep 3
    show_menu
}

arenabg_visit() {
    clear
    print_header "OPENING ARENABG.COM"
    echo ""
    print_info "Opening ArenaBG.com..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Remember to press CMD + SHIFT + R once the page loads!"
    else
        echo "Remember to press CTRL + SHIFT + R once the page loads!"
    fi
    echo ""
    
    open_url "https://arenabg.com/"
    sleep 3
    show_menu
}

zamunda_net_visit() {
    clear
    print_header "OPENING ZAMUNDA.NET"
    echo ""
    print_info "Opening Zamunda.NET..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Remember to press CMD + SHIFT + R once the page loads!"
    else
        echo "Remember to press CTRL + SHIFT + R once the page loads!"
    fi
    echo ""
    
    open_url "https://zamunda.net/bananas??"
    sleep 3
    show_menu
}

zamunda_ch_visit() {
    clear
    print_header "OPENING ZAMUNDA.CH"
    echo ""
    print_info "Opening Zamunda.CH..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Remember to press CMD + SHIFT + R once the page loads!"
    else
        echo "Remember to press CTRL + SHIFT + R once the page loads!"
    fi
    echo ""
    
    open_url "https://zamunda.ch/bananas??"
    sleep 3
    show_menu
}

exit_script() {
    clear
    print_header "THANK YOU FOR USING THE FIX TOOL"
    echo ""
    echo "The hosts file has been updated and DNS cache flushed."
    echo "You can run this script again anytime you need to access the sites."
    echo ""
    exit 0
}

# Main execution
main() {
    check_sudo
    clear
    print_header "ZAMUNDA.NET & ARENABG.COM FIX TOOL"
    echo ""
    
    # Update hosts and flush DNS
    update_hosts
    flush_dns
    
    echo ""
    print_success "Setup complete!"
    echo ""
    sleep 2
    
    # Show menu
    show_menu
}

# Run main function
main
