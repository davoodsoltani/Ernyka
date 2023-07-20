import 'package:ernyka/features/presentation/pages/myip/myip_page.dart';
import 'package:ernyka/features/presentation/pages/setting/setting_page.dart';
import 'package:ernyka/main.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MyApp());

      case '/Setting':
        return _materialRoute(const SettingPage());

      case '/MyIp':
        return _materialRoute(const MyIpPage());

      default:
        return _materialRoute(const MyApp());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
