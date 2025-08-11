import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/book_review_state.dart';
import 'package:bookapp/controller/provider/book_saved_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/discountCheck.dart';
import 'package:bookapp/controller/provider/index_items_state.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/provider/search_fillter_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/provider/subscriptions_state.dart';
import 'package:bookapp/controller/provider/user_orders_state.dart';
import 'package:bookapp/controller/provider/user_transactions.dart';
import 'package:bookapp/controller/provider/wallet_payment.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/init_screen.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await clearCacheOnVersionChange();

  // var statuss = await Permission.locationAlways.status;
  // if (!statuss.isGranted) {
  //   await Permission.locationAlways.request();
  // }
  // await initializeService();
  // final service = FlutterBackgroundService();
  // service.startService();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ShopCardChargeState(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubChargeState(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoryState(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => IndexItemsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookDetailState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookSavedState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookReviewState(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubscriptionsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserTransactionsState(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileState(),
    ),
    ChangeNotifierProvider(
      create: (context) => BookListState(),
    ),
    ChangeNotifierProvider(
      create: (context) => ShopCardState(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserOrdersState(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchFillterState(),
    ),
    ChangeNotifierProvider(
      create: (context) => WalletChargeState(),
    ),
    ChangeNotifierProvider(
      create: (context) => DiscountCheckState(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubState(),
    ),
  ], child: const MyApp()));
}

Future<void> clearCacheOnVersionChange() async {
  final prefs = await SharedPreferences.getInstance();
  const appVersionKey = 'app_version';
  const currentVersion = '2.0.0';

  if (prefs.getString(appVersionKey) != currentVersion) {
    await prefs.clear(); // Clear old cache
    await prefs.setString(appVersionKey, currentVersion); // Save new version
  }
}

// final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   /// OPTIONAL, using custom notification channel id
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'my_foreground', // id
//     'MY FOREGROUND SERVICE', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   await flutterLocalNotificationsPlugin.initialize(
//     const InitializationSettings(
//       iOS: DarwinInitializationSettings(),
//       android: AndroidInitializationSettings('ic_bg_service_small'),
//     ),
//   );

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//       onForeground: onStart,
//     ),
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,

//       // auto start service
//       autoStart: true,
//       isForegroundMode: false,

//       notificationChannelId: 'my_foreground',
//       initialNotificationTitle: 'AWESOME SERVICE',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 888,
//       foregroundServiceTypes: [AndroidForegroundType.location],
//     ),
//   );
//   // final service = FlutterBackgroundService();
//   // service.startService();
//   WidgetsFlutterBinding.ensureInitialized();

//   // تنظیمات نوتیفیکیشن
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // اتصال به Hub سرور
//   final hubConnection = HubConnectionBuilder()
//       .withUrl('http://194.48.198.232:5004/notifhub')
//       .build();

//   hubConnection.on('newNotification', (message) {
//     _showNotification(message.toString());
//     print(message);
//   });

//   await hubConnection.start();

//   // ماندن در حالت فعال
//   // while (service.isRunning) {
//   //   await Future.delayed(const Duration(seconds: 5));
//   // }
// }

// void _showNotification(String message) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails('888', 'NikooBook',
//           channelDescription: 'NikooBook Notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//           showWhen: false);
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await _flutterLocalNotificationsPlugin.show(
//     0,
//     'نیکو بوک',
//     message,
//     platformChannelSpecifics,
//     payload: 'item x',
//   );
// }

// void onStart(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   print('STARTTTTTTTTTTTT');
//   // ایجاد اتصال به SignalR
//   final hubConnection = HubConnectionBuilder()
//       .withUrl(
//           'http://194.48.198.232:5004/notifhub') // آدرس سرور خود را اینجا قرار دهید
//       .build();

//   // Initialize local notifications
//   FlutterLocalNotificationsPlugin localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   var androidInitializationSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initializationSettings = InitializationSettings(
//     android: androidInitializationSettings,
//   );
//   await localNotificationsPlugin.initialize(initializationSettings);

//   hubConnection.on('newNotification', (message) {
//     // ارسال نوتیفیکیشن هنگام دریافت پیام
//     _showNotification(message![0].toString(), localNotificationsPlugin);
//   });

//   await hubConnection.start();

//   // Listen for data from the main isolate
//   // service.onDataReceived.listen((event) {
//   //   // Handle data received from Flutter app
//   // });
// }

// Future<void> _showNotification(String message,
//     FlutterLocalNotificationsPlugin localNotificationsPlugin) async {
//   var androidDetails = AndroidNotificationDetails(
//     'channelId',
//     'channelName',
//     channelDescription: 'Channel description',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   var notificationDetails = NotificationDetails(android: androidDetails);

//   await localNotificationsPlugin.show(
//     0,
//     'New Message',
//     message,
//     notificationDetails,
//     payload: 'Notification Payload',
//   );
// }
// late FlutterLocalNotificationsPlugin localNotificationsPlugin;
// void startBackgroundService() {
//   final service = FlutterBackgroundService();
//   service.startService();
// }

// void stopBackgroundService() {
//   final service = FlutterBackgroundService();
//   service.invoke("stop");
// }

// Future<String?> getTokenFromPreferences() async {
//   final SharedPreferences sp = await SharedPreferences.getInstance();
//   return sp.getString('accessToken'); // خواندن توکن
// }

// Future<void> initializeService() async {
//   localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   localNotificationsPlugin.initialize(initializationSettings);
//   showLocalNotification('init1', 'init1');
//   final service = FlutterBackgroundService();

//   await service.configure(
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//       onForeground: onStart,
//       onBackground: onIosBackground,
//     ),
//     androidConfiguration: AndroidConfiguration(
//       autoStart: true,
//       onStart: onStart,
//       isForegroundMode: false,
//       autoStartOnBoot: true,
//     ),
//   );
// }

// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   return true;
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   print('salammmmmmmmmmmmmmm');
//   showLocalNotification('init2', 'sssssss');

//   String? token = await getTokenFromPreferences();
// final socket = io.io(
//     "http://194.48.198.232:5004/notifhub?token=eyJhbGciOiJBMTI4S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwidHlwIjoiSldUIiwiY3R5IjoiSldUIn0.9eal5I-GTlUrWeHwEct8rkFC8m8Q4ed0DBNsgqwbXhpciieQ4QVpMA.sp5gBVfZyx3qI2gQSLopKg.Bl9RkFHZYC7l7j-DSARITdKsaoU70LsooB1g548W8MBGIibKCotw-AOlOMtb2E5jghHQ1PfMXDte-tlIF_92rJ72Jeso_J8Jo9XnbVJVxpxi0ga1RSxxJVxdWmZx30g66AxkkFwMEw1Rj71sHP408QTfzS_W60x2WsHxjvZ6J3wG7ZKiGUsWa32XyQ3U9mNZXuH1aGD_ClZjrcE5sPRjYCNIHV00L-eHkFnE5Cc_OnuSM6r3LZ2wuI2IZ0kHAgrYzv65hzDTycMoVI-UNHmXgZ2aG4TySIlJVX992qnO2abCazN7-A2mESGmzQaQ7Yea3p2PH4dqKJbkN4kMNtIv4O5HeCJRZQ8rZ1H0TEBAvskFZrqcTYAk-kwA008RJui0bAM3_Yp67BtfKMj6yzcdkZjcwCJ4l0Has4qpiI41xInchIm3-yxJon-774nF-ZHohVGlBwHFqggsNrb47qpXqtomR7la-7fqZ_lFQwlIoGMwdAZrYzLvwK12vrb5492yLL5ksI2tgUX4ZIIvS7fZyzvjo__i7nZgqiTpGG5nuHWCAoxZ-1kZOSWIUmbH73ttH44GaZfEd-4OH9nvt2La-SVmmZwpwiCiKxZjWF5huPA.zXeIQamFy0qLmX5WA5jVjQ",
//     <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': true,
//     });
// socket.onConnect((_) {
//   print('Connected. Socket ID: ${socket.id}');
//   showLocalNotification('init2', '${socket.id}');
//   // Implement your socket logic here
//   // For example, you can listen for events or send data
// });

// socket.onDisconnect((_) {
//   print('Disconnected');
// });
// socket.on("newNotification", (data) {
//   final notif = jsonDecode(data.toString()) as Map<String, dynamic>;
//   print(notif);

//   showLocalNotification(notif['Message'], notif['Title']);
//   //do something here like pushing a notification
// });
// service.on("stop").listen((event) {
//   service.stopSelf();
//   print("background process is now stopped");
// });

//   service.on("start").listen((event) {});

//   Timer.periodic(const Duration(seconds: 1), (timer) {
//     // socket.emit("event-name", "your-message");
//     print("service is successfully running ${DateTime.now().second}");
//   });
// }

// Future<void> showLocalNotification(String message, String title) async {
//   AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'newNotification',
//     'newNotification',
//     channelDescription: message,
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );

//   NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()!
//       .requestNotificationsPermission();

//   await localNotificationsPlugin.show(
//     0, // id نوتیفیکیشن
//     'New Notification',
//     message.toString(),
//     platformChannelSpecifics,
//   );
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppLinks _appLinks;
  String _initialLink = '';

  @override
  void initState() {
    super.initState();
    // _appLinks = AppLinks();
    // _initDeepLinkListener();
    // removeToken();
  }

  Future<void> removeToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove('accessToken');
  }

  void _initDeepLinkListener() async {
    try {
      final String? initialLink = await _appLinks.getInitialLinkString();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }

      _appLinks.uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          _handleDeepLink(uri.toString());
        }
      });
    } catch (e) {
      debugPrint('Error initializing deep link: $e');
    }
  }

  void _handleDeepLink(String link) {
    final uri = Uri.parse(link);
    if (uri.path.contains('target-page')) {
      final bookId = uri.queryParameters['bookId'];
      Navigator.pushNamed(context, '/target-page', arguments: bookId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Yekan'),
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError();
        };
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      onGenerateRoute: MyRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}

class CustomError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 1,
      ),
    );
  }
}

// class MyHomeNotif extends StatefulWidget {
//   const MyHomeNotif({super.key});

//   @override
//   State<MyHomeNotif> createState() => _MyHomeNotifState();
// }

// class _MyHomeNotifState extends State<MyHomeNotif> {
//   late FlutterLocalNotificationsPlugin _localNotificationsPlugin;

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1),
    );
  }
}
