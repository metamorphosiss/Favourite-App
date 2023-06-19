import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/screen/homePage.dart';
import 'package:flutter_application_1/provider/favorit.provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 156, 23),
   brightness: Brightness.dark,
   )
);

void main() {
  runApp(const MyApp());
//i used provider package for state management and for fetching data i used 
// http package
// http ver

}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (create)=>FavoritProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:const HomePage() ,
    ),
    );
  }
}

