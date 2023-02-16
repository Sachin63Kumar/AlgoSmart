import 'package:flutter/material.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  final items = List<String>.generate(10, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queue Animation'),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: items.map((item) {
            return Container(
              height: 50,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
