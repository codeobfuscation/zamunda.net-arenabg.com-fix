# Zamunda.NET & ArenaBG.com Fix Tool

A simple script to fix access issues with Zamunda.NET and ArenaBG.com by automatically configuring your hosts file and DNS settings.

**Available for Windows, macOS, and Linux!**

## 🚀 Features

- ✅ Automatically updates hosts file with correct IP addresses
- ✅ Flushes DNS cache to apply changes immediately
- ✅ Quick login options for Zamunda.NET and Zamunda.CH
- ✅ Direct access to ArenaBG.com
- ✅ **No installation required** - just download and run
- ✅ **No dependencies** - pure native scripts
- ✅ Automatic hosts file backup before making changes
- ✅ User-friendly console interface
- ✅ Cross-platform support (Windows, macOS, Linux)

---

## 📥 How to Download

### Easy Download (For Everyone)

**You don't need to know anything about GitHub!** Just follow these simple steps:

1. Click on the file you need:
   - **For Windows**: Click on `zamunda-arenabg-fix.bat`
   - **For Mac**: Click on `zamunda-arenabg-fix.sh`
   - **For Linux**: Click on `zamunda-arenabg-fix.sh`

2. On the file page, look for the **"Download raw file"** button (download icon ⬇️) on the right side

3. Click it to download the file to your computer

4. The file will be saved in your Downloads folder

**Alternative method**: 
- Click the green **"Code"** button at the top of this page
- Click **"Download ZIP"**
- Extract the ZIP file
- Use the file for your operating system

---

## 🚀 How to Use

### Windows - Step by Step

1. **Find the downloaded file** in your Downloads folder (it's called `zamunda-arenabg-fix.bat`)

2. **Right-click** on the file

3. Select **"Run as administrator"** from the menu
   - If you see a security warning, click "Yes" or "Run anyway"

4. A black window will appear with a menu - follow the instructions on screen

5. **IMPORTANT**: After opening any website, press **CTRL + F5** in your browser!

⚠️ **Note**: You MUST run as administrator, otherwise it won't work!

---

### macOS - Step by Step

1. **Find the downloaded file** in your Downloads folder (it's called `zamunda-arenabg-fix.sh`)

2. **Open Terminal**:
   - Press `CMD + Space` (Spotlight Search)
   - Type "Terminal" and press Enter

3. **Go to your Downloads folder** - copy and paste this command, then press Enter:
   ```bash
   cd ~/Downloads
   ```

4. **Make the file executable** - copy and paste this command, then press Enter:
   ```bash
   chmod +x zamunda-arenabg-fix.sh
   ```

5. **Run the script** - copy and paste this command, then press Enter:
   ```bash
   sudo ./zamunda-arenabg-fix.sh
   ```

6. Enter your Mac password when asked (you won't see it while typing - this is normal!)

7. Follow the menu instructions on screen

8. **IMPORTANT**: After opening any website, press **CMD + SHIFT + R** in your browser!

⚠️ **Note**: If macOS blocks the script, go to System Preferences → Security & Privacy and allow it to run

---

### Linux - Step by Step

1. **Find the downloaded file** in your Downloads folder (it's called `zamunda-arenabg-fix.sh`)

2. **Open Terminal** (usually CTRL + ALT + T)

3. **Go to your Downloads folder**:
   ```bash
   cd ~/Downloads
   ```

4. **Make the file executable**:
   ```bash
   chmod +x zamunda-arenabg-fix.sh
   ```

5. **Run the script**:
   ```bash
   sudo ./zamunda-arenabg-fix.sh
   ```

6. Enter your password when asked

7. Follow the menu instructions on screen

8. **IMPORTANT**: After opening any website, press **CTRL + SHIFT + R** in your browser!

---

## 🔧 What Does It Do?

The script performs the following actions:

1. **Updates your hosts file** with:
   ```
   5.181.156.140 arenabg.com
   5.181.156.140 www.arenabg.com
   51.159.12.143 cdn.arenabg.com
   104.21.23.130 zamunda.net
   104.21.23.130 www.zamunda.net
   ```

2. **Flushes DNS cache**

3. **Provides quick access options**:
   - Login to Zamunda.NET
   - Login to Zamunda.CH
   - Visit ArenaBG.com (no login needed)
   - Quick visit options for already logged-in users

## 🎯 Menu Options

After running the script, you'll see this menu:

```
[1] Login to Zamunda.NET
[2] Login to Zamunda.CH
[3] Visit ArenaBG.com (no login needed)
[4] Just visit Zamunda.NET (if already logged in)
[5] Just visit Zamunda.CH (if already logged in)
[6] Exit
```

### Login Options (1 & 2)
Enter your username and password when prompted. The script will automatically construct the login URL and open it in your default browser.

### Visit Options (3, 4 & 5)
Opens the website directly in your default browser without requiring credentials.

## 🛡️ Safety Features

- **Automatic backup**: The script creates a timestamped backup of your hosts file before making any changes
- **Smart detection**: Checks if hosts entries already exist to avoid duplicates
- **Non-destructive**: Only modifies the specific entries needed for Zamunda and ArenaBG

## 🔄 Reverting Changes

If you want to restore your original hosts file:

**Windows**: 
1. Navigate to `C:\Windows\System32\drivers\etc\`
2. Look for backup files named `hosts.backup.YYYYMMDD_HHMMSS`
3. Remove the backup extension to restore

**macOS/Linux**:
1. Navigate to `/etc/`
2. Look for backup files named `hosts.backup.YYYYMMDD_HHMMSS`
3. Restore using: `sudo cp /etc/hosts.backup.YYYYMMDD_HHMMSS /etc/hosts`

Or simply edit the hosts file and remove the lines under `# Zamunda and ArenaBG Fix`

## ⚙️ Technical Details

### Windows Version
- **Platform**: Windows (7, 8, 10, 11)
- **Requirements**: Administrator privileges
- **Language**: Batch Script
- **Dependencies**: None - uses built-in Windows commands

### macOS/Linux Version
- **Platform**: macOS (10.10+) / Linux (most distributions)
- **Requirements**: Sudo privileges
- **Language**: Bash Script
- **Dependencies**: None - uses built-in Unix commands
- **Tested on**: macOS Monterey+, Ubuntu 20.04+, Fedora, Debian

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements!

## 📝 License

This project is released under the MIT License - feel free to use, modify, and distribute.

## ⚠️ Disclaimer

This tool is provided as-is for educational and accessibility purposes. Use at your own discretion. Always ensure you're accessing legitimate websites and protecting your credentials.

## 🐛 Troubleshooting

**Windows - Script won't run?**
- Make sure you're running it as Administrator (right-click → Run as administrator)

**macOS/Linux - Script won't run?**
- Make sure you gave it execute permissions: `chmod +x zamunda-arenabg-fix.sh`
- Make sure you're running with sudo: `sudo ./zamunda-arenabg-fix.sh`
- On macOS, you may need to allow the script in System Preferences → Security & Privacy

**Sites still not loading?**
- **Windows**: Press CTRL + F5 in your browser to force refresh
- **macOS**: Press CMD + SHIFT + R in your browser to force refresh
- **Linux**: Press CTRL + SHIFT + R in your browser to force refresh
- Try clearing your browser cache
- Restart your browser

**Login not working?**
- Double-check your username and password
- Make sure cookies are enabled in your browser
- Try using option 4 or 5 to visit the site first, then login manually

---

Made with ❤️ for the Bulgarian torrenting community
