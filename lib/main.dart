import 'package:fahrplanauskunft_app/page/filter_api_list_page.dart';
import 'package:fahrplanauskunft_app/provider/location_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
    providers: [
       ChangeNotifierProvider(create: (_) => LocationDetails()),
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static const String title = 'Fahrplanauskunfts';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.grey[300]),
        home: const FilterApiListPage(),
      );
}

