Resign
=============
Utility to resign iOS applications. Written on Ruby.
Uses zip - standard compression and file packaging utility for Unix (/usr/bin/zip)
Modified to pass codesign the generated ENTITLEMENTS.plist. 

Usage
---------
You can resign your app with resign.rb script using command:
```
    ruby resign.rb -p Your.mobileprovision  -a YourApp.app  -d "iPhone Distribution: Your Company Name (XXXXXXXXXX)"
```
Or you can resign-wrapper.rb script. This script just help not to type the name of identity during using ruby. You should change identity on your own.
```
    8: dev_id = "iPhone Distribution: Your Company Name (XXXXXXXXXX)"
```
And use next way:
```
    ruby resign.rb -p Your.mobileprovision  -a YourApp.app
```

Troubleshooting
---------
Make sure Xcode Command Line Tools are installed on the machine you're resigning from. If not errors like "object file format unrecognized, invalid or unsuitable" will appear.