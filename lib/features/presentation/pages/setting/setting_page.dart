import 'package:ernyka/config/theme/theme_manager.dart';
import 'package:ernyka/features/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, ThemeManager themeNotifier, child) {
      return Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(themeNotifier),
      );
    });
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        "Ernyka",
        style: TextStyle(color: Colors.black),
      ),
      automaticallyImplyLeading: false,
    );
  }

  _buildBody(ThemeManager themeNotifier) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
            value: themeNotifier.isDark,
            onChanged: (newValue) {
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            }),
        addVerticalSpace(20),
        ElevatedButton(
            child: const Text("back"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    ));
  }
}
