import XCTest
@testable import DeviceIOSCompatibility

final class DeviceTests: XCTestCase {
    func testCompatibility() {
        XCTAssertNil(DeviceIOSCompatibility.Device(.iPhone14).isCompatible(withMajorIOSVersion: 1))
        XCTAssertNil(DeviceIOSCompatibility.Device(.iPhone14).isCompatible(withMajorIOSVersion: 100))

        //XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhone14).isCompatible(withMajorIOSVersion: 17), true)
        //XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhoneX).isCompatible(withMajorIOSVersion: 17), false)

        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhone8).isCompatible(withMajorIOSVersion: 16), true)
        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhone7).isCompatible(withMajorIOSVersion: 16), false)

        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhone6).isCompatible(withMajorIOSVersion: 12), true)
        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPhone6).isCompatible(withMajorIOSVersion: 13), false)

        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPadAir).isCompatible(withMajorIOSVersion: 12), true)
        XCTAssertEqual(DeviceIOSCompatibility.Device(.iPadAir).isCompatible(withMajorIOSVersion: 13), false)
    }

    func testCurrent() {
        let currentVersion = ProcessInfo.processInfo.operatingSystemVersion.majorVersion
        XCTAssertEqual(DeviceIOSCompatibility.Device.current.isCompatible(withMajorIOSVersion: currentVersion), true)
    }
}
