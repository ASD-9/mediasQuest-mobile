import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mediasquest/app_routes.dart';
import 'package:mediasquest/providers/creators_provider.dart';
import 'package:mediasquest/providers/types_provider.dart';
import 'package:mediasquest/services/creators_service.dart';
import 'package:mediasquest/services/types_service.dart';
import 'package:mediasquest/themes/app_theme.dart';
import 'package:mediasquest/utils/dio_client.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();

  final Dio dio = DioClient.dio;

  final TypesService typesService = TypesService(dio);
  final CreatorsService creatorsService = CreatorsService(dio);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TypesProvider>(create: (_) => TypesProvider(typesService)),
        ChangeNotifierProvider<CreatorsProvider>(create: (_) => CreatorsProvider(creatorsService)),
      ],
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
