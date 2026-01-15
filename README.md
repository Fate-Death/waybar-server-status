
# Preview


<img width="454" height="35" alt="screenshot_30082025_223439" src="https://github.com/user-attachments/assets/2f00b707-8f1e-4521-ad2a-42c8b6072327" />

# 📡 Server Status on Waybar

This project provides a small script to display your **server status** directly on [Waybar](https://github.com/Alexays/Waybar).

It checks if your server is online and updates a Waybar module with an icon + text.

⚠️ **Note:**
This script is **highly modified for my personal use**. You’ll likely need to adapt server addresses, icons, and paths for your setup.

## 🚀 Features

* ✅ Check if server is online/offline
* ✅ Updates automatically on Waybar
* ✅ Custom icons & colors


## 📂 Project Structure
```
.
├── scripts/
│   ├── onClick.sh
│   └── serverstatus.sh    # Main script  
└── waybar/
    ├── config.jsonc       # Waybar config (snippet)
    └── style.css
```
## ⚡ Installation

1. Clone this repo:

```bash
git clone https://github.com/yourname/waybar-server-status.git
cd waybar-server-status
```

2. Make the script executable:

```bash
chmod +x scripts/server_status.sh
```

3. Add a Waybar custom module in your `~/.config/waybar/config.jsonc`:

```jsonc
"custom/server": {
    "exec": "~/.config/waybar/scripts/server_status.sh",
    "interval": 10,
    "return-type": "json"
}
```

4. Add it to your Waybar `modules-right` or `modules-left`.

## 📝 Example Script (Reduced)

```bash
#!/bin/bash

SERVER="fatedeath.ddns.net:6969"
if nc -z -w2 $(echo $SERVER | cut -d: -f1) $(echo $SERVER | cut -d: -f2); then
    echo '{"text":" Online","class":"online"}'
else
    echo '{"text":" Offline","class":"offline"}'
fi
```

## 🎨 Customization

* Change `SERVER` in the script.
* Adjust Waybar icons (``, ``, etc).
* Tweak `interval` in Waybar config.
* 
## 🔹CSS Styling (Waybar)

Waybar uses style.css to control how the module looks. Add this snippet:
```css
#custom-statusdot {
  font-size: 14px;
  padding: 0 6px;
}

#custom-statusdot.green {
  color: #5cb85c; /* soft green */
}

#custom-statusdot.yellow {
  color: #f0ad4e; /* muted yellow */
}

#custom-statusdot.red {
  color: @iconcolor; /* default theme color */
}
```
