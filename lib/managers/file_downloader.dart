// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
//
// class FileDownloader {
//   static Future<void> downloadFileWithProgress(
//       String url,
//       String fileName,
//       FlutterLocalNotificationsPlugin notificationsPlugin,
//       ) async {
//     try {
//       Dio dio = Dio();
//
//       final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//       final filePath = '${appDocumentsDirectory.path}/$fileName';
//
//       Response response = await dio.get(
//         url,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             double progress = received / total;
//             int percentage = (progress * 100).toInt();
//
//             // Update the progress bar in the notification
//             _updateNotification(progress, notificationsPlugin);
//           }
//         },
//         options: Options(
//           responseType: ResponseType.bytes,
//           followRedirects: false,
//           validateStatus: (status) {
//             return status! < 500;
//           },
//         ),
//       );
//
//       File file = File(filePath);
//       await file.writeAsBytes(response.data);
//
//       // Clear the notification once the download is complete
//       _clearNotification(notificationsPlugin);
//
//       print('File downloaded to: $filePath');
//     } catch (e) {
//       print('Error downloading file: $e');
//       // Handle errors and update the notification accordingly
//     }
//   }
//
//   static void _updateNotification(
//       double progress,
//       FlutterLocalNotificationsPlugin plugin,
//       ) {
//     int percentage = (progress * 100).toInt();
//
//     // Create a progress notification
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//     const AndroidNotificationDetails('progress_channel', 'Progress');
//     NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     plugin.show(
//       0,
//       'Downloading...',
//       '$percentage% complete',
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
//
//   static void _clearNotification(FlutterLocalNotificationsPlugin plugin) {
//     // Clear the notification once the download is complete
//     plugin.cancel(0);
//   }
// }
