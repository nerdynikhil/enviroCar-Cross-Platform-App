import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './providers/authProvider.dart';
import './providers/tracksProvider.dart';
import 'models/track.dart';
import './screens/splashScreen.dart';
import './screens/bluetoothDevicesScreen.dart';
import './screens/index.dart';
import './screens/loginScreen.dart';
import './screens/mapScreen.dart';
import './screens/registerScreen.dart';
import 'providers/themeProvider.dart';
import './providers/userStatsProvider.dart';
import './globals.dart';
import './screens/carScreen.dart';
import './providers/carsProvider.dart';
import './screens/createCarScreen.dart';
import './screens/trackDetailsScreen.dart';
import './providers/fuelingsProvider.dart';
import './screens/createFuelingScreen.dart';
import './screens/logBookScreen.dart';
import './screens/reportIssueScreen.dart';
import '../screens/helpScreen.dart';
import './hiveDB/fuelingsCollection.dart';
import './hiveDB/sensorsCollection.dart';

Future<void> main() async {
  // Ensures all the future functions of main() finish before launching the app
  WidgetsFlutterBinding.ensureInitialized();

  // initializing Hive DB
  await Hive.initFlutter();

  // open Hive boxes to fetch data from
  await CarsCollection().openCarsHive();
  await FuelingsCollection().openFuelingsHive();

  // Instance of shared prefs
  preferences = await SharedPreferences.getInstance();

  // Restricts rotation of screen
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    DevicePreview(
      // to check the UI on different devices make enabled true
      enabled: false,
      builder: (context) {
        return MultiProvider(
          providers: [
            // Provides user data to different widgets on the tree
            ChangeNotifierProvider(
              create: (context) => AuthProvider(),
            ),

            // Provides user stats data to different widgets on the tree
            ChangeNotifierProvider(
              create: (context) => UserStatsProvider(),
            ),

            // Provides car data to different widget
            ChangeNotifierProvider(
              create: (context) => CarsProvider(),
            ),

            // Provides uploaded tracks to different widgets
            ChangeNotifierProvider(
              create: (context) => TracksProvider(),
            ),

            // Provides Fueling data to different widgets
            ChangeNotifierProvider(
              create: (context) => FuelingsProvider(),
            ),

            // Provides theme data to different widgets on the tree
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
            ),
          ],
          child: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      // For navigating to screens which accept arguments
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case TrackDetailsScreen.routeName:
            return MaterialPageRoute(
              builder: (_) {
                final Track track = settings.arguments as Track;
                return TrackDetailsScreen(track: track);
              },
            );

          default:
            return null;
        }
      },

      // Helps in navigating to different screens via route name
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        Index.routeName: (context) => Index(),
        BluetoothDevicesScreen.routeName: (context) => BluetoothDevicesScreen(),
        MapScreen.routeName: (context) => MapScreen(),
        CarScreen.routeName: (context) => CarScreen(),
        CreateCarScreen.routeName: (context) => CreateCarScreen(),
        CreateFuelingScreen.routeName: (context) => CreateFuelingScreen(),
        LogBookScreen.routeName: (context) => LogBookScreen(),
        ReportIssueScreen.routeName: (context) => ReportIssueScreen(),
        HelpScreen.routeName: (context) => HelpScreen(),
      },
    );
  }
}
