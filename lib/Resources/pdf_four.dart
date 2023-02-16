// import 'package:flutter_complete_guide/Home.dart';
// import 'package:flutter_complete_guide/base_screen.dart';
// import 'package:flutter_complete_guide/circle_button.dart';
// import 'package:flutter_complete_guide/course.dart';
// import 'package:flutter_complete_guide/Extra%20files/course_screen.dart';
// import 'package:flutter_complete_guide/details_screen.dart';
import 'package:flutter_complete_guide/Resources/resource_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:flutter/material.dart';

class PdfScreenfour extends StatefulWidget {
  const PdfScreenfour({Key? key}) : super(key: key);

  @override
  State<PdfScreenfour> createState() => _PdfScreenfourState();
}

class _PdfScreenfourState extends State<PdfScreenfour> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  void _navigateToResourceScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResourceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfPdfViewer.asset(
        'assets/stack.pdf',
        controller: _pdfViewerController,
        key: _pdfViewerStateKey,
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 85, 210),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            _navigateToResourceScreen(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _pdfViewerStateKey.currentState!.openBookmarkView();
            },
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.jumpToPage(5);
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.zoomLevel = 1.25;
            },
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
