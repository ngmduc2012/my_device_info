
# My Device Info

A Flutter plugin to retrieve comprehensive device information, including IMEI number, model name, API level, CPU type, product name, and more, with seamless support for both Android and iOS platforms.

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
Any comments please contact us [ThaoDoan](https://github.com/mia140602) and [DucNguyen](https://github.com/ngmduc2012)


[![Buy Me A Coffee](https://cdn.buymeacoffee.com/buttons/v2/default-orange.png)](https://buymeacoffee.com/ducmng12g)
