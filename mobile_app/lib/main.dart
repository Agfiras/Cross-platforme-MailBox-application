import 'dart:io';
import 'package:flutter/material.dart';
import 'package:post_app/Home.dart';
import 'package:post_app/login.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  MQTTClientWrapper newclient = new MQTTClientWrapper();
  newclient.prepareMqttClient();

  runApp(const MyApp());
}

// Mqtt config
enum MqttCurrentConnectionState {
  IDLE,
  CONNECTING,
  CONNECTED,
  DISCONNECTED,
  ERROR_WHEN_CONNECTING
}
enum MqttSubscriptionState { IDLE, SUBSCRIBED }

class MQTTClientWrapper {
  late MqttServerClient client;

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

  // using async tasks, so the connection won't hinder the code flow
  void prepareMqttClient() async {
    _setupMqttClient();
    await _connectClient();
    _subscribeToTopic('hivemq/test');
  }

  Future<void> _connectClient() async {
    try {
      print('client connecting....');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client.connect('3llisa', 'A-Fqf8WTuV6vzwK');
    } on Exception catch (e) {
      print('client exception - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }

    // when connected, print a confirmation, else print an error
    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      connectionState = MqttCurrentConnectionState.CONNECTED;
      print('client connected');
    } else {
      print(
          'ERROR client connection failed - disconnecting, status is ${client.connectionStatus}');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
  }

  void _setupMqttClient() {
    client = MqttServerClient.withPort(
        'e1ac740750fa44edb61998e003cc9ede.s1.eu.hivemq.cloud',
        'Agenui Firas',
        8883);
    // the next 2 lines are necessary to connect with tls, which is used by HiveMQ Cloud
    client.secure = true;
    client.securityContext = SecurityContext.defaultContext;
    client.keepAlivePeriod = 20;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.onSubscribed = _onSubscribed;
  }

  void _subscribeToTopic(String topicName) {
    print('Subscribing to the $topicName topic');
    client.subscribe(topicName, MqttQos.atMostOnce);

    // print the message when it is received
    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('YOU GOT A NEW MESSAGE:');

      print(message);
    });
  }

  // callbacks for different events
  void _onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }

  void _onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
  }

  void _onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    print('OnConnected client callback - Client connection was sucessful');
  }
}

//* */
class MyApp extends StatefulWidget {
  static const String title = 'Login';

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    final settingAndroid = AndroidInitializationSettings('adaptive_icon');

    notifications.initialize(InitializationSettings(android: settingAndroid),
        onSelectNotification: onSelectNotification);
  }

  Future<dynamic> onSelectNotification(String) async => await Navigator.push(
      context, MaterialPageRoute(builder: (context) => Home()));

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MyApp.title,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: const Color(0xffffffff))),
        home: LoginScreen(),
      );
}
