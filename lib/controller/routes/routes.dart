import 'package:bookapp/init_screen.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/view/auth/login_screen.dart';
import 'package:bookapp/view/auth/otp_screen.dart';
import 'package:bookapp/view/book_detail/book_detail_screen.dart';
import 'package:bookapp/view/book_detail/list_screen.dart';
import 'package:bookapp/view/book_detail/pdf_screen.dart';
import 'package:bookapp/view/buy/mybag_screen.dart';
import 'package:bookapp/view/home/all_books.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:bookapp/view/home/navigationbar_screen.dart';
import 'package:bookapp/view/home/por_forosh/por_forosh.dart';
import 'package:bookapp/view/home/taze_ha/taze_ha.dart';
import 'package:bookapp/view/init_pages/page_two_screen.dart';
import 'package:bookapp/view/init_pages/pageview_screen.dart';
import 'package:bookapp/view/profile/edit_profile.dart';
import 'package:bookapp/view/profile/profile_screen.dart';
import 'package:bookapp/view/questions/questions_screen.dart';
import 'package:bookapp/view/rating/my_rating.dart';
import 'package:bookapp/view/rating/nikoo_rating.dart';
import 'package:bookapp/view/rating/rating_screen.dart';
import 'package:bookapp/view/saved/read_screen.dart';
import 'package:bookapp/view/saved/saved_screen.dart';
import 'package:bookapp/view/saved/shelf_screen.dart';
import 'package:bookapp/view/search_fillter/search_fillter_screen.dart';
import 'package:bookapp/view/shop_card/shop_card_screen.dart';
import 'package:bookapp/view/subscription/buy_subs_screen.dart';
import 'package:bookapp/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  //route names
  // auth
  static const String bookDetail = "/bookDetail";
  static const String pdfScreen = "/pdfScreen";
  static const String homeScreen = "/homeScreen";
  static const String otpScreen = "/otpScreen";
  static const String pageTwo = "/pageTwo";
  static const String loginScreen = "/loginScreen";
  static const String navigationBarScreen = "/navigationBarScreen";
  static const String ratingScreen = "/ratingScreen";
  static const String allBooksScreen = "/allBooksScreen";
  static const String profileScreen = "/profileScreen";
  static const String editProfileScreen = "/editProfileScreen";
  static const String buySubsScreen = "/buySubsScreen";
  static const String myBagScreen = "/myBagScreen";
  static const String myRatingScreen = "/myRatingScreen";
  static const String myHomePage = "/myHomePage";
  static const String shopCardScreen = "/shopCardScreen";
  static const String notificationScreen = "/notificationScreen";
  static const String wellcomeScreen = "/wellcomeScreen";
  static const String initScreen = "/initScreen";
  static const String shelfScreen = "/shelfScreen";
  static const String savedScreen = "/savedScreen";
  static const String readScreen = "/readScreen";
  static const String searchFillterScreen = "/searchFillterScreen";
  static const String nikooRatingScreen = "/nikooRatingScreen";
  static const String questionScreen = "/questionScreen";
  static const String listScreen = "/listScreen";
  static const String porForoshHa = "/porForoshHa";
  static const String tazeHa = "/tazeHa";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/target-page':
      //   final bookId = settings.arguments as String?;
      //   return PageRouteBuilder(
      //       pageBuilder: (_, __, ___) => BookDetailScreen(bookId: bookId!));
      // auth
      case questionScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => QuestionsScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case nikooRatingScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => RatingNikooScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case bookDetail:
        var arg = settings.arguments as String;
        print(arg.toString() + " this");
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => BookDetailScreen(
            bookId: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case pdfScreen:
        var arg = settings.arguments as String;
        print(arg.toString() + " this");
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => PdfScreen(
            pdfLink: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case listScreen:
        var arg = settings.arguments as String;
        print(arg.toString() + " this");
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ListScreen(
            pdfLink: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case homeScreen:
        // var arg = settings.arguments as String;
        // print(arg.toString() + " this");
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case otpScreen:
        var arg = settings.arguments as String;
        print(arg.toString() + " this");
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => OtpScreen(
            phonenumber: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case pageTwo:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => PageTwoScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case loginScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => LoginScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case navigationBarScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => NavigationbarScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case ratingScreen:
        var arg = settings.arguments as String;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => RatingScreen(
            bookId: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case allBooksScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => AllBooksScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case profileScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ProfileScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case editProfileScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => EditProfileScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case buySubsScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => BuySubsScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case myBagScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => MyBagScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case myRatingScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => MyRatingScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case myHomePage:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => MyHomePage(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case shopCardScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ShopCardScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      // case notificationScreen:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (_, __, ___) => NotificationScreen(),
      //     transitionsBuilder: (_, a, __, c) =>
      //         FadeTransition(opacity: a, child: c),
      //   );
      case wellcomeScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => WellcomeScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case initScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => InitScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case shelfScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ShelfScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case readScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ReadScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case savedScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SavedScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case searchFillterScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SearchFillterScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case porForoshHa:
        var arg = settings.arguments as List<BookDto>;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => PorForoshScreen(
            bookDto: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );
      case tazeHa:
        var arg = settings.arguments as List<BookDto>;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => TazeHa(
            bookDto: arg,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        );

      // 404
    }
    return null;
  }
}
