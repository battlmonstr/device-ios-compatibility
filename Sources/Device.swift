import DeviceKit

public struct Device {
    private let deviceID: DeviceKit.Device

    init(_ deviceID: DeviceKit.Device) {
        self.deviceID = deviceID
    }

    public static var current: Device {
        return Device(DeviceKit.Device.current)
    }

    // References:
    // https://support.apple.com/en-gb/guide/iphone/iphe3fa5df43/16.0/ios/16.0
    // https://iosref.com/ios
    private static let compatibleDevicesForIOSVersions: [(ClosedRange<Int>, [DeviceKit.Device])] = [
        ((16...17), [
            .iPhone14Pro,
            .iPhone14ProMax,
            .iPhone14,
            .iPhone14Plus,
        ]),

        ((15...17), [
            .iPhoneSE3,
            .iPhone13Pro,
            .iPhone13ProMax,
            .iPhone13,
            .iPhone13Mini,
        ]),

        ((14...17), [
            .iPhone12Pro,
            .iPhone12ProMax,
            .iPhone12,
            .iPhone12Mini,
        ]),

        ((13...17), [
            .iPhoneSE2,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhone11,
        ]),

        ((12...17), [
            .iPhoneXS,
            .iPhoneXSMax,
            .iPhoneXR,
        ]),

        ((11...16), [
            .iPhoneX,
            .iPhone8,
            .iPhone8Plus,
        ]),

        ((10...15), [
            .iPhone7,
            .iPhone7Plus,
        ]),

        ((9...15), [
            .iPhoneSE,
            .iPhone6s,
            .iPhone6sPlus,
        ]),

        ((8...12), [
            .iPhone6,
            .iPhone6Plus,
        ]),

        ((7...12), [
            .iPhone5s,
        ]),

        ((12...15), [
            .iPodTouch7,
        ]),

        ((8...12), [
            .iPodTouch6,
        ]),

        ((16...16), [
            .iPadPro12Inch6,
            .iPadPro11Inch4,
            .iPad10,
        ]),

        ((15...16), [
            .iPadAir5,
            .iPad9,
            .iPadMini6,
        ]),

        ((14...16), [
            .iPadPro12Inch5,
            .iPadPro11Inch3,
            .iPadAir4,
            .iPad8,
        ]),

        ((13...16), [
            .iPadPro12Inch4,
            .iPadPro11Inch2,
            .iPad7,
        ]),

        ((12...16), [
            .iPadAir3,
            .iPadMini5,
            .iPadPro12Inch3,
            .iPadPro11Inch,
        ]),

        ((11...16), [
            .iPad6,
        ]),

        ((10...16), [
            .iPadPro12Inch2,
            .iPadPro10Inch,
            .iPad5,
        ]),

        ((9...16), [
            .iPadPro9Inch,
            .iPadPro12Inch,
        ]),

        ((9...15), [
            .iPadMini4,
        ]),

        ((8...12), [
            .iPadMini3,
        ]),

        ((8...15), [
            .iPadAir2,
        ]),

        ((7...12), [
            .iPadMini2,
            .iPadAir,
        ]),
    ]

    public func isCompatible(withMajorIOSVersion version: Int) -> Bool? {
        guard (12...16).contains(version) else {
            return nil
        }

        guard let compatibleVersions = Self.compatibleDevicesForIOSVersions.first(where: { self.deviceID.realDevice.isOneOf($0.1) })?.0 else {
            return nil
        }

        return compatibleVersions.contains(version)
    }
}
