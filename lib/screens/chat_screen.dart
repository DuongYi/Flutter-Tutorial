import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          padding: const EdgeInsets.all(8),
          child: const Text('This works!'),
        ),
        itemCount: 10,
      ),
    );
  }
}
