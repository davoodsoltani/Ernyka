import 'package:ernyka/config/routes/routes.dart';
import 'package:ernyka/config/theme/theme.dart';
import 'package:ernyka/config/theme/theme_manager.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_bloc.dart';
import 'package:ernyka/features/presentation/widgets/widgets.dart';
import 'package:ernyka/inhection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, ThemeManager themeNotifier, child) {
          return BlocProvider<RemoteIpBloc>(
            create: (context) => s1<RemoteIpBloc>(),
            child: MaterialApp(
              title: 'Ernyka',
              theme: themeNotifier.isDark ? darkTheme : lightTheme,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              debugShowCheckedModeBanner: false,
              home: const MyHomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text(
        "Ernyka",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: const Text("my ip"),
            onPressed: () {
              Navigator.pushNamed(context, '/MyIp');
            },
          ),
          addVerticalSpace(20),
          ElevatedButton(
            child: const Text("Setting"),
            onPressed: () {
              Navigator.pushNamed(context, '/Setting');
            },
          ),
        ],
      ),
    );
  }
}
