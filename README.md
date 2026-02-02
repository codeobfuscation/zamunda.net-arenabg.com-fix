# Zamunda.NET & ArenaBG.com Fix Tool

A simple Windows batch script to fix access issues with Zamunda.NET and ArenaBG.com by automatically configuring your hosts file and DNS settings.

## 🚀 Features

- ✅ Automatically updates Windows hosts file with correct IP addresses
- ✅ Flushes DNS cache to apply changes immediately
- ✅ Quick login options for Zamunda.NET and Zamunda.CH
- ✅ Direct access to ArenaBG.com
- ✅ **No installation required** - just download and run
- ✅ **No dependencies** - pure Windows batch script
- ✅ Automatic hosts file backup before making changes
- ✅ User-friendly console interface

## 📥 Download & Usage

### Quick Start

1. **Download** the `zamunda-arenabg-fix.bat` file
2. **Right-click** on the file and select **"Run as administrator"**
3. Follow the on-screen menu options

### Important Notes

⚠️ **Administrator rights required** - The script needs admin privileges to modify the hosts file.

💡 **Remember to press CTRL + F5** in your browser after the website opens to force a page refresh!

## 🔧 What Does It Do?

The script performs the following actions:

1. **Updates your hosts file** (`C:\Windows\System32\drivers\etc\hosts`) with:
   ```
   5.181.156.140 arenabg.com
   5.181.156.140 www.arenabg.com
   51.159.12.143 cdn.arenabg.com
   104.21.23.130 zamunda.net
   104.21.23.130 www.zamunda.net
   ```

2. **Flushes DNS cache** using `ipconfig /flushdns`

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

1. Navigate to `C:\Windows\System32\drivers\etc\`
2. Look for backup files named `hosts.backup.YYYYMMDD_HHMMSS`
3. Remove the backup extension to restore

Or simply edit the hosts file and remove the lines under `# Zamunda and ArenaBG Fix`

## ⚙️ Technical Details

- **Platform**: Windows (7, 8, 10, 11)
- **Requirements**: Administrator privileges
- **Language**: Batch Script
- **Dependencies**: None - uses built-in Windows commands

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements!

## 📝 License

This project is released under the MIT License - feel free to use, modify, and distribute.

## ⚠️ Disclaimer

This tool is provided as-is for educational and accessibility purposes. Use at your own discretion. Always ensure you're accessing legitimate websites and protecting your credentials.

## 🐛 Troubleshooting

**Script won't run?**
- Make sure you're running it as Administrator (right-click → Run as administrator)

**Sites still not loading?**
- Press CTRL + F5 in your browser to force refresh
- Try clearing your browser cache
- Restart your browser

**Login not working?**
- Double-check your username and password
- Make sure cookies are enabled in your browser
- Try using option 4 or 5 to visit the site first, then login manually

---

Made with ❤️ for the Bulgarian torrenting community
