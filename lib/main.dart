import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/providers/device_info_provider.dart';
import 'package:tap_vpn_details/providers/home_provider.dart';
import 'package:tap_vpn_details/providers/premium_subscription_provider.dart';
import 'package:tap_vpn_details/utils/shared_preferences/shared_preferences_data.dart';
import 'package:tap_vpn_details/views/splash_screen/splash_screen.dart';
import 'providers/vpn_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_qblFNYngBkEdjEZ16jxxoWSM';
  await Firebase.initializeApp();
  await SharedPreferencesData.initSharedPreferences();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider<DeviceInfoProvider>(
            create: (context) => DeviceInfoProvider()),
        ChangeNotifierProvider<PremiumSubscriptionProvider>(
            create: (context) => PremiumSubscriptionProvider()),
        ChangeNotifierProvider<VpnProvider>(create: (context) => VpnProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
      ],
      child: const TagVpn(),
    ),
  );
}

class TagVpn extends StatelessWidget {
  const TagVpn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          builder: EasyLoading.init(),
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: SplashScreen(),
          // initialRoute: SpalashPage.routeName,
          // routes: {
          //   SpalashPage.routeName: (context) => SpalashPage(),
          //   PrivacyPage.routeName: (context) => PrivacyPage(),
          //   OnBordingPage.routeName: (context) => OnBordingPage(),
          //   HomePage.routeName: (context) => HomePage(),
          //   SettingPage.routeName: (context) => SettingPage(),
          //   AutoProtectPage.routeName: (context) => AutoProtectPage(),
          //   RegisterPage.routeName: (context) => RegisterPage(),
          //   LogInPage.routeName: (context) => LogInPage(),
          // },
        );
      },
    );
  }
}
