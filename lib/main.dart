// import 'dart:async';
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_page_app/Screens/Login/auth.dart';

// import 'package:passcode_screen/circle.dart';
// import 'package:passcode_screen/keyboard.dart';
// import 'package:passcode_screen/passcode_screen.dart';

// Future<void> openHiveBox(String boxName, {bool limit = false}) async {
//   final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
//     final Directory dir = await getApplicationDocumentsDirectory();
//     final String dirPath = dir.path;
//     File dbFile = File('$dirPath/$boxName.hive');
//     File lockFile = File('$dirPath/$boxName.lock');
//     if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
//       dbFile = File('$dirPath/BlackHole/$boxName.hive');
//       lockFile = File('$dirPath/BlackHole/$boxName.lock');
//     }
//     await dbFile.delete();
//     await lockFile.delete();
//     await Hive.openBox(boxName);
//     throw 'Failed to open $boxName Box\nError: $error';
//   });
//   // clear box if it grows large
//   if (limit && box.length > 500) {
//     box.clear();
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('settings');

  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      initialRoute:
          (Hive.box('settings').get('hasSettings', defaultValue: false) as bool)
              ? '/Auth'
              : '/LoadSettings',
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => const AuthScreen(),
        '/b': (BuildContext context) => const AuthScreen(),
        '/c': (BuildContext context) => const AuthScreen(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Passcode Lock Screen Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ExampleHomePage_1(),
//     );
//   }
// }

// class ExampleHomePage_1 extends StatefulWidget {
//   ExampleHomePage_1({Key? key}) : super(key: key);

//   @override
//   State<ExampleHomePage_1> createState() => _ExampleHomePage_1State();
// }

// class _ExampleHomePage_1State extends State<ExampleHomePage_1> {
//   final StreamController<bool> _verificationNotifier =
//       StreamController<bool>.broadcast();

//   _onPasscodeEntered(String enteredPasscode) {
//     bool isValid = '123456' == enteredPasscode;
//     _verificationNotifier.add(isValid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PasscodeScreen(
//       digits: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '1'],
//       backgroundColor: Colors.green.shade100.withOpacity(0.9),
//       bottomWidget: const Padding(
//         padding: EdgeInsets.all(15.0),
//         child: Text("bottomWidget"),
//       ),
//       title: const Text("123123"),
//       passwordEnteredCallback: _onPasscodeEntered,
//       isValidCallback: () {
//         log("code valid");
//       },
//       cancelButton: const Text('Отмена'),
//       deleteButton: const Text('Удалить'),
//       cancelCallback: () {
//         log("Cancel");
//       },
//       shouldTriggerVerification: _verificationNotifier.stream,
//     );
//   }
// }

// const storedPasscode = '123456';

// class ExampleHomePage extends StatefulWidget {
//   ExampleHomePage({Key? key}) : super(key: key);
//   final String title = 'asdasd';

//   @override
//   State<StatefulWidget> createState() => _ExampleHomePageState();
// }

// class _ExampleHomePageState extends State<ExampleHomePage> {
//   final StreamController<bool> _verificationNotifier =
//       StreamController<bool>.broadcast();

//   bool isAuthenticated = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You are ${isAuthenticated ? '' : 'NOT'} authenticated'),
//             _defaultLockScreenButton(context),
//             _customColorsLockScreenButton(context)
//           ],
//         ),
//       ),
//     );
//   }

//   _defaultLockScreenButton(BuildContext context) => MaterialButton(
//         color: Theme.of(context).primaryColor,
//         child: const Text('Open Default Lock Screen'),
//         onPressed: () {
//           _showLockScreen(
//             context,
//             opaque: false,
//             cancelButton: const Text(
//               'Cancel',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               semanticsLabel: 'Cancel',
//             ),
//           );
//         },
//       );

//   _customColorsLockScreenButton(BuildContext context) {
//     return MaterialButton(
//       color: Theme.of(context).primaryColor,
//       child: const Text('Open Custom Lock Screen'),
//       onPressed: () {
//         _showLockScreen(context,
//             opaque: false,
//             circleUIConfig: const CircleUIConfig(
//                 borderColor: Colors.blue,
//                 fillColor: Colors.blue,
//                 circleSize: 30),
//             keyboardUIConfig: const KeyboardUIConfig(
//                 digitBorderWidth: 2, primaryColor: Colors.blue),
//             cancelButton: const Icon(
//               Icons.arrow_back,
//               color: Colors.blue,
//             ),
//             digits: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '零']);
//       },
//     );
//   }

//   _showLockScreen(
//     BuildContext context, {
//     required bool opaque,
//     CircleUIConfig? circleUIConfig,
//     KeyboardUIConfig? keyboardUIConfig,
//     required Widget cancelButton,
//     List<String>? digits,
//   }) {
//     Navigator.push(
//         context,
//         PageRouteBuilder(
//           opaque: opaque,
//           pageBuilder: (context, animation, secondaryAnimation) =>
//               PasscodeScreen(
//             title: const Text(
//               'Enter App Passcode',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white, fontSize: 28),
//             ),
//             circleUIConfig: circleUIConfig,
//             keyboardUIConfig: keyboardUIConfig,
//             passwordEnteredCallback: _onPasscodeEntered,
//             cancelButton: cancelButton,
//             deleteButton: const Text(
//               'Delete',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               semanticsLabel: 'Delete',
//             ),
//             shouldTriggerVerification: _verificationNotifier.stream,
//             backgroundColor: Colors.black.withOpacity(0.8),
//             cancelCallback: _onPasscodeCancelled,
//             digits: digits,
//             passwordDigits: 6,
//             bottomWidget: _buildPasscodeRestoreButton(),
//           ),
//         ));
//   }

//   _onPasscodeEntered(String enteredPasscode) {
//     bool isValid = storedPasscode == enteredPasscode;
//     _verificationNotifier.add(isValid);
//     if (isValid) {
//       setState(() {
//         this.isAuthenticated = isValid;
//       });
//     }
//   }

//   _onPasscodeCancelled() {
//     Navigator.maybePop(context);
//   }

//   @override
//   void dispose() {
//     _verificationNotifier.close();
//     super.dispose();
//   }

//   _buildPasscodeRestoreButton() => Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
//           child: TextButton(
//             child: const Text(
//               "Reset passcode",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300),
//             ),
//             onPressed: _resetAppPassword,
//             // splashColor: Colors.white.withOpacity(0.4),
//             // highlightColor: Colors.white.withOpacity(0.2),
//             // ),
//           ),
//         ),
//       );

//   _resetAppPassword() {
//     Navigator.maybePop(context).then((result) {
//       if (!result) {
//         return;
//       }
//       _showRestoreDialog(() {
//         Navigator.maybePop(context);
//         //TODO: Clear your stored passcode here
//       });
//     });
//   }

//   _showRestoreDialog(VoidCallback onAccepted) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             "Reset passcode",
//             style: TextStyle(color: Colors.black87),
//           ),
//           content: const Text(
//             "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
//             style: TextStyle(color: Colors.black87),
//           ),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             TextButton(
//               child: const Text(
//                 "Cancel",
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 Navigator.maybePop(context);
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 "I understand",
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: onAccepted,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
