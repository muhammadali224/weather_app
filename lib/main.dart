
import 'package:flutter/material.dart';
import 'package:weather_app/screen/home.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp( const MyApp());


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[50],
        )
      ),
      home: const HomePage(),
      title: 'Weather ',
    );
  }
}
