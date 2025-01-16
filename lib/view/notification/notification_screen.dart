// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:signalr_netcore/signalr_client.dart';

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   late HubConnection hubConnection;
//   late FlutterLocalNotificationsPlugin localNotificationsPlugin;
//   Object? object;
//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//     connectToSignalR();
//     // sendTokenToServer(); // ارسال توکن به سرور در هنگام راه‌اندازی
//   }

//   void initializeNotifications() {
//     localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     localNotificationsPlugin.initialize(initializationSettings);
//   }

//   // Future<void> sendTokenToServer() async {
//   //   String? token =
//   //       await getTokenFromPreferences(); // دریافت توکن از Shared Preferences
//   //   if (token != null && token.isNotEmpty) {
//   //     // ارسال توکن به سرور به‌صورت query
//   //     final response = await http.get(
//   //       Uri.parse(
//   //           "http://194.48.198.232:5004/notifhub?token=$token"), // آدرس سرور شما با توکن
//   //     );

//   //     if (response.statusCode == 200) {
//   //       print("Token sent to server: $token");
//   //     } else {
//   //       print("Failed to send token: ${response.statusCode}");
//   //     }
//   //   } else {
//   //     print("No token found in Shared Preferences");
//   //   }
//   // }

//   Future<String?> getTokenFromPreferences() async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     return sp.getString('accessToken'); // خواندن توکن
//   }

//   void connectToSignalR() async {
//     String? token = await getTokenFromPreferences();
//     print("$token" + "THis is Tokeeeeeen"); // دریافت توکن از Shared Preferences
//     // if (token != null && token.isNotEmpty) {
//     //   // ارسال توکن به سرور به‌صورت query
//     //   //   final response = await http.get(
//     //   //     Uri.parse(
//     //   //         "http://194.48.198.232:5004/notifhub?token=$token"), // آدرس سرور شما با توکن
//     //   //   );

//     //   //   if (response.statusCode == 200) {
//     //   //     print("Token sent to server: $token");
//     //   //   } else {
//     //   //     print("Failed to send token: ${response.statusCode}");
//     //   //   }
//     //   // } else {
//     //   //   print("No token found in Shared Preferences");
//     // }
//     hubConnection = HubConnectionBuilder()
//         .withUrl(
//             "http://194.48.198.232:5004/notifhub?token=$token") // آدرس سرور شما
//         .build();

//     hubConnection.on("newNotification", (arguments) {
//       final message = arguments![0];
//       final notif = jsonDecode(message.toString()) as Map<String, dynamic>;
//       print(notif);

//       showLocalNotification(notif['Message'], notif['Title']);
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//           FlutterLocalNotificationsPlugin();
//       flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()!
//           .requestNotificationsPermission();
//       // _showNotification(
//       //     title: notif['Title'] ?? "", body: notif['Message'] ?? "", id: 1);
//     });

//     hubConnection.start()?.then((_) {
//       print("Connection started");
//     }).catchError((error) {
//       print("Error starting connection: $error");
//     });
//   }

//   Future<void> showLocalNotification(String message, String title) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'newNotification',
//       'newNotification',
//       channelDescription: message,
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );

//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestNotificationsPermission();

//     await localNotificationsPlugin.show(
//       0, // id نوتیفیکیشن
//       'New Notification',
//       message.toString(),
//       platformChannelSpecifics,
//     );
//   }

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> _showNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('1', 'نیکو بوک',
//             channelDescription: 'NikooBook Notification Channel',
//             importance: Importance.max,
//             icon: '@mipmap/ic_launcher',
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: DarwinNotificationDetails(),
//     );
//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WebSocket Demo"),
//       ),
//       body: Center(
//         child: Text("Waiting for notifications..."),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     hubConnection.stop();
//     super.dispose();
//   }
// }
