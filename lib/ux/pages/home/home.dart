import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/ux/pages/home/widgets/category_switcher.dart';
import 'package:flutter_complete_guide/ux/pages/home/widgets/configuration_widget.dart';
// import 'package:keepsettings/keepsettings.dart';
import 'package:provider/provider.dart';

import '../../../utils/screen_size.dart';
import '../../providers/pages_provider.dart';
// import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PagesProvider(),
      child: deviceScreenType(MediaQuery.of(context).size.width) ==
              DeviceScreenType.Desktop
          ? HomeDesktop()
          : HomeMobile(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ConfigurationWidget(),
        Expanded(
          child: CategorySwitcher(),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: const <Widget>[
          Expanded(
            child: ConfigurationWidget(),
          ),
          Expanded(
            child: CategorySwitcher(),
          ),
        ],
      ),
    );
  }
}
