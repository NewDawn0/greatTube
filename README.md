<img src="./icon.png" width=200>
<h1 style="margin-left: 10px;">Great Tube</h1>

A decent youtube mobile app

<!-- vim-markdown-toc GFM -->

* [Features](#features)
* [Installing](#installing)

<!-- vim-markdown-toc -->

## Features

- No Ads
- Better Logo (subjective)

## Installing

1. Check if the following dependencies are installed

- **Swfit 5**: Used for language and compiler
- **XCode**: Sadly unavoidable for loading the app on an iphone
- **ImageMagick**: (Optional) Used for resizing the logo

2. Clone the repo

```bash
    git clone https://github.com/NewDawn0/greatTube.git
    cd greatTube

```

3. Install the app on your phone
   1. Open the project in XCode and sign in with your Apple-ID
   2. Navigate to signing and capabilities under the project settings
   3. Enable `Automatically manage signing`
   4. Set the `Team` to your Apple-ID
   5. Set the `Bundle Identifier` to `com.<your Apple-ID name>.greattube`
   6. Connect your phone via cable
   7. Select your phone as the build target
   8. Enable developer mode on your phone settings
      Under `Privacy & Security > Developer Mode` enable the switch (This will restart your device)
   9. Build and Run with `⌘+r`
   10. Enable permission in the settings
       In `General > VPN & Device Management` you should see your Apple-ID.
       Click on it and select trust this author
