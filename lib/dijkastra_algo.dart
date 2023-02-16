import 'package:flutter/material.dart';

class DijkastraScreen extends StatefulWidget {
  const DijkastraScreen({Key? key}) : super(key: key);

  @override
  _DijkastraScreenState createState() => _DijkastraScreenState();
}

class _DijkastraScreenState extends State<DijkastraScreen>
    with TickerProviderStateMixin {
  // Create an AnimationController
  late AnimationController _controller;

  // Set up the initial state of the animation
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dijkstra Algorithm'),
      ),
      body: Center(
        child: CustomPaint(
          // Pass the AnimationController to the CustomPaint widget
          painter: MyPainter(_controller),
        ),
      ),
    );
  }
}

// Define a custom painter class that extends the AbstractCustomPainter class
class MyPainter extends CustomPainter {
  MyPainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    // Use the animation to control the progress of the algorithm
    final progress = animation.value;

    // Draw the nodes and edges of the graph
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(100, 100), 20, paint);
    canvas.drawCircle(Offset(200, 100), 20, paint);
    canvas.drawLine(Offset(120, 100), Offset(180, 100), paint);

    // Draw the shortest path, using the progress value to control its length
    paint.color = Colors.red;
    canvas.drawLine(Offset(100, 100), Offset(100 + progress * 100, 100), paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
