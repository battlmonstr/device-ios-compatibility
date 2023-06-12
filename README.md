Check iOS version compatibility with the iOS device.
If the device is compatible, it can be upgraded to that iOS version.

Usage:

```Swift
let isCompatible = DeviceIOSCompatibility.Device.current.isCompatible(withMajorIOSVersion: 13)
switch isCompatible {
case .some(true):
    // the device is upgradeable to iOS 13
    break
case .some(false):
    // the device is not upgradeable to iOS 13
    break
case .none:
    // the compatibility is unknown (happens if a very old or a future iOS version is passed)
    break
}
```

The library is based on:

[Apple iOS compatible iPhone models](https://support.apple.com/en-gb/guide/iphone/iphe3fa5df43/ios) lists  
[Apple iPadOS compatible iPad models](https://support.apple.com/en-gb/guide/ipad/ipad213a25b2/ipados) lists

[DeviceKit](https://github.com/devicekit/DeviceKit) device detection  
Copyright (c) 2015 Dennis Weissmann

[iOS Ref](https://github.com/ebelinski/iosref/blob/main/_subpages/ios.md) iOS version by device table  
Copyright (c) 2021 Eugene Belinski
