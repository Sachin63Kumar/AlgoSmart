import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/search_model.dart';
import 'providers/search/search_provider.dart';
import 'ux/widgets/search/search_widget.dart';

class OwnSearchVisualizer<T extends SearchProvider> extends StatelessWidget {
  const OwnSearchVisualizer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<T, List<SearchModel>>(
        selector: (context, provider) => provider.numbers,
        builder: (_, numbers, __) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              for (var number in numbers)
                SearchWidget(
                  number: number,
                )
            ],
          );
        },
      ),
    );
  }
}
