import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_device_info/my_device_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('my_device_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await MyDeviceInfo.platformVersion, '42');
  });
}
