
# My Device Info

A Flutter plugin to retrieve comprehensive device information, including IMEI number, model name, API level, CPU type, product name, and more, with seamless support for both Android and iOS platforms.

[![GitHub](https://img.shields.io/badge/Nguyen_Duc-GitHub-black?logo=github)](https://github.com/ngmduc2012)
_[![Buy Me A Coffee](https://img.shields.io/badge/Donate-Buy_Me_A_Coffee-blue?logo=buymeacoffee)](https://www.buymeacoffee.com/ducmng12g)_
_[![PayPal](https://img.shields.io/badge/Donate-PayPal-blue?logo=paypal)](https://paypal.me/ngmduc)_
_[![Sponsor](https://img.shields.io/badge/Sponsor-Become_A_Sponsor-blue?logo=githubsponsors)](https://github.com/sponsors/ngmduc2012)_
_[![Support Me on Ko-fi](https://img.shields.io/badge/Donate-Ko_fi-red?logo=ko-fi)](https://ko-fi.com/I2I81AEJG8)_

## Installation

Add following dependency in pubspec.yaml file:

```yaml
my_device_info: ^last_version
```
Then, run

```bash
$ flutter pub get 
```
### Set up
- In android add following permission:
```xml
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
```
## Usage

```dart
import 'package:my_device_info/my_device_info.dart';

if(Permission.phone.request().isGranted){
  try {
      platformVersion = await MyDeviceInfo.platformVersion;
      imeiNo = await MyDeviceInfo.deviceIMEINumber;
      modelName = await MyDeviceInfo.deviceModel;
      manufacturer = await MyDeviceInfo.deviceManufacturer;
      apiLevel = await MyDeviceInfo.apiLevel;
      deviceName = await MyDeviceInfo.deviceName;
      productName = await MyDeviceInfo.productName;
      cpuType = await MyDeviceInfo.cpuName;
      hardware = await MyDeviceInfo.hardware;

  } on PlatformException {
      platformVersion = 'Failed to get platform version.';
  }
}

```

## Developer Team:
[ThaoDoan](https://github.com/mia140602) and [DucNguyen](https://github.com/ngmduc2012)


