import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/own_searchIndicator.dart';
import 'package:flutter_complete_guide/providers/search/linear_search_provider.dart';
import 'package:flutter_complete_guide/ux/widgets/search/search.dart';
// import 'package:flutter_complete_guide/ux/widgets/search/search_indicator.dart';
import 'package:flutter_complete_guide/ux/widgets/search/search_message.dart';
import 'package:flutter_complete_guide/ux/widgets/search/search_speed.dart';
import 'package:flutter_complete_guide/ux/widgets/search/search_visualizer.dart';

class OwnLinearSearch extends StatelessWidget {
  const OwnLinearSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Linear Search',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 24),
            //Below can not be constant
            Expanded(
              child: SearchVisualizer<LinearSearchProvider>(),
            ),
            SearchMessage<LinearSearchProvider>(),
            const SizedBox(height: 24),
            SearchSpeed<LinearSearchProvider>(),
            Search<LinearSearchProvider>(),
            const SizedBox(height: 24),
          ],
        ),
        OwnSearchIndicator<LinearSearchProvider>(),
      ],
    );
  }
}
