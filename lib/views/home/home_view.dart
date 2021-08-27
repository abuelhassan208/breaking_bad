import 'package:breaking_bad_bloc/views/home/bloc/states/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit/cubit.dart';
import 'components/app_bar.dart';
import 'components/characters_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..checkConnectivity()
        ..getData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: homeAppBar(context),
            backgroundColor: Colors.white12,
            body: HomeCharactersList(),
          );
        },
      ),
    );
  }
}
