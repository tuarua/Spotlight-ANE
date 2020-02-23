Spotlight Adobe Air Native Extension for OSX 10.12+, iOS 10.0+

[ASDocs Documentation](https://tuarua.github.io/asdocs/spotlightane/index.html)  

-------------

Much time, skill and effort has gone into this. Help support the project

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/tuarua)

-------------

## iOS

### The ANE + Dependencies

N.B. You must use a Mac to build an iOS app using this ANE. Windows is NOT supported.

From the command line cd into /example-mobile and run:

```shell
bash get_ios_dependencies.sh
```

This folder, ios_dependencies/device/Frameworks, must be packaged as part of your app when creating the ipa. How this is done will depend on the IDE you are using.
After the ipa is created unzip it and confirm there is a "Frameworks" folder in the root of the .app package.


## macOS

### The ANE + Dependencies

>N.B. You must create a **signed** release to use on OSX. It is not possible to run Spotlight from a debug app.

From the command line cd into /example-desktop and run:

```shell
bash get_dependencies.sh
```

### App Setup

As per iOS above.



### Prerequisites

You will need:
- a Mac. Windows is not supported
- IntelliJ IDEA
- AIR 33.0.2.338+
- Xcode 11.3
- * wget on macOS via `brew install wget`


### References
* [https://developer.apple.com/documentation/corespotlight]
