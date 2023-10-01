import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/home_page.dart';
import 'package:quiz/question_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => QuestionProvider()), // Добавляем ваш провайдер
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: HomePage()),
      ),
    );
  }
}
