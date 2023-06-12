build:
	xcodebuild -scheme DeviceIOSCompatibility \
  		-destination 'platform=iOS Simulator,OS=16.4,name=iPhone SE (3rd generation)'

test:
	xcodebuild test -scheme DeviceIOSCompatibility \
  		-destination 'platform=iOS Simulator,OS=16.4,name=iPhone SE (3rd generation)'
