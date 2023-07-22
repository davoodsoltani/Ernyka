import 'package:ernyka/features/presentation/bloc/remote/remote_ip_bloc.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_event.dart';
import 'package:ernyka/features/presentation/bloc/remote/remote_ip_state.dart';
import 'package:ernyka/features/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyIpPage extends StatefulWidget {
  const MyIpPage({super.key});

  @override
  _MyIpPage createState() => _MyIpPage();
}

class _MyIpPage extends State<MyIpPage> {
  @override
  void initState() {
    super.initState();
    getIp();
  }

  void getIp() {
    BlocProvider.of<RemoteIpBloc>(context).add(const GetIp());
  }

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
      automaticallyImplyLeading: false,
    );
  }

  BlocBuilder<RemoteIpBloc, RemoteIpState> _buildMyIp() {
    return BlocBuilder<RemoteIpBloc, RemoteIpState>(
      builder: (_, state) {
        if (state is RemoteIpLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteIpError) {
          return Center(
            child: IconButton(
              onPressed: () {
                getIp();
              },
              icon: const Icon(Icons.refresh),
            ),
          );
        }
        if (state is RemoteIpDone) {
          return Center(
            child: Text(state.myIp!.ip ?? "empty ip"),
          );
        }
        return const SizedBox();
      },
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildMyIp(),
          addVerticalSpace(20),
          ElevatedButton(
            child: const Text("back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
