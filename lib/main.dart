import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/controllers/navigation/navigation_bloc.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/screens.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('ar'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ataa Admin Panel',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.elMessiriTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        '/employee_details': (context) => EmployeesDetailsScreen(),
        '/add_edit_employee': (context) => AddEditEmployee(),
      },
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: ((context) =>
                  NavigationBloc()..add(NavigateToPage(pageIndex: 0))),
            ),
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}
