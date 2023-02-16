import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../providers/search/search_provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  _SearchState<T> createState() => _SearchState<T>();
}

class _SearchState<T extends SearchProvider> extends State<Search<T>> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Value',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
          ),
        ),
        // Selector<T, bool>(
        //   selector: (_, searchProvider) => searchProvider.isSearching,
        //   builder: (_, isSearching, child) {
        //     return RaisedButton(
        //       onPressed: isSearching ? null : _search,
        //       child: child,
        //     );
        //   },
        //   child: const Text('Search'),
        // )

        Selector<T, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(175, 27, 37, 67),
                disabledForegroundColor: Colors.blueGrey,
              ),
              // color: Colors.blue,
              // disabledColor: Colors.blueGrey,
              onPressed: isSearching ? null : _search,
              child: child,
            );
          },
          child: const Text('Search', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
