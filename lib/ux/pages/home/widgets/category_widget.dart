import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../utils/screen_size.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.pages,
    // ignore: unnecessary_null_comparison
  })  : assert(pages != null),
        super(key: key);

  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return (deviceScreenType(MediaQuery.of(context).size.width) ==
            DeviceScreenType.Desktop)
        ? _CategoryWidgetDesktop(pages: pages)
        : _CategoryWidgetMobile(pages: pages);
  }
}

class _CategoryWidgetDesktop extends StatelessWidget {
  const _CategoryWidgetDesktop({Key? key, required this.pages})
      : super(key: key);

  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Card(
        child: _AlgorithmCategory(pages: pages),
      ),
    );
  }
}

class _CategoryWidgetMobile extends StatelessWidget {
  const _CategoryWidgetMobile({Key? key, required this.pages})
      : super(key: key);

  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return _AlgorithmCategory(pages: pages);
  }
}

class _AlgorithmCategory extends StatefulWidget {
  const _AlgorithmCategory({
    Key? key,
    required this.pages,
  }) : super(key: key);

  final List<StatelessWidget> pages;

  @override
  _AlgorithmCategoryState createState() => _AlgorithmCategoryState();
}

class _AlgorithmCategoryState extends State<_AlgorithmCategory> {
  PageController pageController = PageController(keepPage: false);

  var page = 0.0;

  void _updateIndicator(int pageNumber) {
    setState(() {
      page = pageNumber.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 88, 111, 227),
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width > 800
            ? 800
            : MediaQuery.of(context).size.width,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.pages.length,
                onPageChanged: (page) {
                  _updateIndicator(page);
                },
                itemBuilder: (context, index) {
                  return widget.pages[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: DotsIndicator(
                dotsCount: widget.pages.length,
                position: page,
                decorator: DotsDecorator(
                  activeColor: Color.fromARGB(175, 27, 37, 67),
                  spacing: const EdgeInsets.symmetric(horizontal: 12),
                  size: const Size(10, 10),
                  activeSize: const Size(14, 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
