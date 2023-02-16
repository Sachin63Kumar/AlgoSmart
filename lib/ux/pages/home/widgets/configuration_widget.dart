import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/screen_size.dart';
import '../../../providers/pages_provider.dart';
// import 'package:provider/provider.dart';

class ConfigurationWidget extends StatelessWidget {
  const ConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return deviceScreenType(MediaQuery.of(context).size.width) ==
            DeviceScreenType.Desktop
        ? _ConfigurationWidgetDesktop()
        : _ConfigurationWidgetMobile();
  }
}

class _ConfigurationWidgetMobile extends StatelessWidget {
  const _ConfigurationWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CategorySelector();
  }
}

class _ConfigurationWidgetDesktop extends StatelessWidget {
  const _ConfigurationWidgetDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Configuration',
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 32,
        ),
        CategorySelector(),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Consumer<PagesProvider>(
          builder: (_, categoryProvider, child) {
            return Container(
              color: Color.fromARGB(255, 88, 111, 227),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Category:',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DropdownButton<String>(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    hint: const Text('Category'),
                    value: categoryProvider.categoryKey,
                    icon: Icon(Icons.arrow_drop_down),
                    iconEnabledColor: Colors.white,
                    iconSize: 24,
                    elevation: 16,
                    dropdownColor: Color.fromARGB(255, 88, 111, 227),
                    underline: Container(
                      height: 2,
                      color: Color.fromARGB(255, 7, 23, 104),
                    ),
                    onChanged: (String? newValue) {
                      categoryProvider.changeKey(newValue!);
                    },
                    items: <String>[
                      'Search',
                      'Sort',
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
