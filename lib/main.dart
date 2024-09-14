import 'package:al_ansary/pages_list/analysis_and_packadges/cubit/selectanalyses_cubit.dart';
import 'package:al_ansary/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectanalysesCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              theme: ThemeData(
                  navigationBarTheme: NavigationBarThemeData(
                    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(
                                0xFF002F5D), // Custom color for selected state
                          );
                        }
                        return TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color:
                              Colors.grey, // Custom color for unselected state
                        );
                      },
                    ),
                  ),
                  primaryColor: const Color(0xFF00B5AD),
                  scaffoldBackgroundColor: Colors.white),
              initialRoute: 'layout',
              routes: routes,
              debugShowCheckedModeBanner: false);
        },
      ),
    );
  }
}
