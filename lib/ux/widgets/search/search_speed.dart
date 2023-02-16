import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/search/search_provider.dart';

class SearchSpeed<T extends SearchProvider> extends StatelessWidget {
  const SearchSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Animation Speed',
              // style: Theme.of(context).textTheme.caption),
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            Consumer<T>(
              builder: (context, provider, child) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Slider(
                    activeColor: Color.fromARGB(255, 27, 37, 67),
                    inactiveColor: Color.fromARGB(75, 27, 37, 67),
                    value: provider.executionSpeed,
                    onChanged: (value) => provider.executionSpeed = value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
