import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mediasquest/app_routes.dart';
import 'package:mediasquest/themes/app_theme.dart';
import 'package:mediasquest/utils/dio_client.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();

  final Dio dio = DioClient.dio;

  runApp(
    MultiProvider(
      providers: [],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
