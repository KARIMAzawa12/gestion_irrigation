import 'package:flutter/material.dart';

class OldDiscussionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Old Discussions'),
      ),
      body: Center(
        child: Text(
          'This is the Old Discussions Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
