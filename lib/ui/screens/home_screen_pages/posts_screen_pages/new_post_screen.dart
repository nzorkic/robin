// Flutter imports:
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new post'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [TextFormField()],
      ),
    );
  }
}