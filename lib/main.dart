import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/utils/color_constants.dart';
import 'package:idoc/utils/routes.dart';
import 'package:idoc/utils/shared_pref_instance.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.instance.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.dark,
  ));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iDoc',
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.getRoutes,

        theme: ThemeData(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,

          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary,),
          useMaterial3: true,
        ),
      ),
    );
  }
}

