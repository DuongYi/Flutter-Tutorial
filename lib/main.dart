import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        backgroundColor: Colors.blue,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.deepPurple),
      ),
      home: ChatScreen(),
    );
  }
}
