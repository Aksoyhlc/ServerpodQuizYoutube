import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Views/Auth/auth.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Serverpod Demo',
      onInit: () {
        controllerInjection();
      },
      initialBinding: BindingsBuilder(
        () {
          controllerInjection();
        },
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}
