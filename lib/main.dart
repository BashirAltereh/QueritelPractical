import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';
import 'features/pets/ui/pet_list_web_page.dart';
import 'features/pets/ui/pets_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figozo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      home: kIsWeb ? const PetsListWebPage() : const PetsListPage(),
    );
  }
}
