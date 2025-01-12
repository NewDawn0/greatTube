<img src="./assets/icon/icon.png" width=200>
<h1 style="margin-left: 10px;">Great Tube</h1>

A decent youtube mobile app

<!-- vim-markdown-toc GFM -->

* [Features](#features)
* [Installing](#installing)
* [Building & installing from source](#building--installing-from-source)

<!-- vim-markdown-toc -->

## Features

- No Ads
- Better Logo (subjective)
- Forward, backward and reload navigation buttons

## Installing

@NOTE: Sadly due to Apples restrictions and me not wanting to pay 100$ to pay for a one year license to put the app on the AppStore I cannot build a distrubutable app for IOS

For android users download and install the apk in the [releases](https://github.com/NewDawn0/greatTube/releases) tab

## Building & installing from source

1. Check if the following dependencies are installed

- **[Flutter](https://docs.flutter.dev/get-started/install) with [Dart-SDK](https://dart.dev/get-dart)**: Core language and build
- **[GNU Make](https://www.gnu.org/software/make/)**: Used to orchestrate build commands
- **[Xcode](https://apps.apple.com/us/app/xcode/id497799835/)**: (Optional) Only required to build the app for IOS

2. Clone the repo

```bash
    git clone https://github.com/NewDawn0/greatTube.git
    cd greatTube
```

4. Build & install for your platform

   - Android:

     1. Run the build command

        ```bash
        make build-apk
        ```

     2. Install the generated in `./build/app/outputs/flutter-apk/app-release.apk`

   - IOS:
     1. Open the project in XCode and sign in with your Apple-ID
     2. Navigate to signing and capabilities under the project settings
     3. Enable `Automatically manage signing`
     4. Set the `Team` to your Apple-ID
     5. Set the `Bundle Identifier` to `com.<your Apple-ID name>.greattube`
     6. Connect your phone via cable
     7. Select your phone as the build target
     8. Enable developer mode on your phone settings
        Under `Privacy & Security > Developer Mode` enable the switch (This will restart your device)
     9. Build the app using
        ```bash
        make build-app
        ```
     10. Enable permission in the settings
         In `General > VPN & Device Management` you should see your Apple-ID.
         Click on it and select trust this author
