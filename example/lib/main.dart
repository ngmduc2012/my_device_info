import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:my_device_info/my_device_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown',
      _imeiNo = "",
      _modelName = "",
      _manufacturerName = "",
      _deviceName = "",
      _productName = "",
      _cpuType = "",
      _hardware = "";
  var _apiLevel;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    late String platformVersion,
        imeiNo = '',
        modelName = '',
        manufacturer = '',
        deviceName = '',
        productName = '',
        cpuType = '',
        hardware = '';
    var apiLevel;
    // Platform messages may fail,
    // so we use a try/catch PlatformException.
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
    } on PlatformException catch (e) {
      platformVersion = '${e.message}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = "Running on :$platformVersion";
      _imeiNo = imeiNo;
      _modelName = modelName;
      _manufacturerName = manufacturer;
      _apiLevel = apiLevel;
      _deviceName = deviceName;
      _productName = productName;
      _cpuType = cpuType;
      _hardware = hardware;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Device Info Plugin Example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text('$_platformVersion\n'),
              SizedBox(
                height: 10,
              ),
              Text('IMEI Number: $_imeiNo\n'),
              SizedBox(
                height: 10,
              ),
              Text('Device Model: $_modelName\n'),
              SizedBox(
                height: 10,
              ),
              Text('API Level: $_apiLevel\n'),
              SizedBox(
                height: 10,
              ),
              Text('Manufacture Name: $_manufacturerName\n'),
              SizedBox(
                height: 10,
              ),
              Text('Device Name: $_deviceName\n'),
              SizedBox(
                height: 10,
              ),
              Text('Product Name: $_productName\n'),
              SizedBox(
                height: 10,
              ),
              Text('CPU Type: $_cpuType\n'),
              SizedBox(
                height: 10,
              ),
              Text('Hardware Name: $_hardware\n'),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    initPlatformState();
                  },
                  child: Text("Reload"))
            ],
          ),
        ),
      ),
    );
  }
}
