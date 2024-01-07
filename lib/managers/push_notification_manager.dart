// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class PushNotificationsManager {
//   PushNotificationsManager._();
//
//   factory PushNotificationsManager() => _instance;
//
//   static final PushNotificationsManager _instance =
//       PushNotificationsManager._();
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   String? token;
//   bool _initialized = false;
//
//   Future<void> init() async {
//     if (!_initialized) {
//       //Get iOS request permissions
//       _firebaseMessaging.requestPermission();
//       FirebaseMessaging.onMessage.listen((message) {
//         processNotificationAtForeground(message.notification?.title,
//             message.notification?.body, message.data);
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         processNotificationAtBackground(message.data);
//       });
//
//       getToken();
//       _initialized = true;
//     }
//   }
//
//   void processNotificationAtBackground(Map<String, dynamic>? message) {
//     print('data is $message');
//   }
//
//   void processNotificationAtForeground(
//       String? heading, String? body, Map<String, dynamic>? message) {
//     // Map<String, dynamic> data;
//     // String title = heading;
//     // String msg = body;
//   }
//
//   Future<void> getToken() async {
//     await _firebaseMessaging.getToken().then((value) {
//       token = value;
//       print('token is $value');
//     });
//   }
//
// }
