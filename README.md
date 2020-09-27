Spotlight Adobe Air Native Extension for OSX 10.12+, iOS 10.0+

[ASDocs Documentation](https://tuarua.github.io/asdocs/spotlightane/index.html)  

-------------

## Prerequisites

You will need:

- IntelliJ IDEA
- AIR 33.1.1.217+
- [.Net Core Runtime](https://dotnet.microsoft.com/download/dotnet-core/3.1)
- [AIR-Tools](https://github.com/tuarua/AIR-Tools/)

-------------

## iOS

### The ANE + Dependencies

>N.B. You must use a Mac to build an iOS app using this ANE. Windows is **NOT** supported.

From Terminal cd into /example-mobile and run the _"air-tools"_ command (You will need [AIR-Tools](https://github.com/tuarua/AIR-Tools/) installed)

```bash
air-tools install
```

This folder, ios_dependencies/device/Frameworks, must be packaged as part of your app when creating the ipa. How this is done will depend on the IDE you are using.
After the ipa is created unzip it and confirm there is a "Frameworks" folder in the root of the .app package.


## macOS

### The ANE + Dependencies

>N.B. You must create a **signed** release to use on macOS. It is not possible to run Spotlight from a debug app.

From Terminal cd into /example-desktop and run:

```shell
air-tools install
```

### App Setup

As per iOS above.


### References
* [https://developer.apple.com/documentation/corespotlight]
