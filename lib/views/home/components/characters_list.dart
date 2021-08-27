import 'package:breaking_bad_bloc/views/home/bloc/cubit/cubit.dart';
import 'package:breaking_bad_bloc/views/home/bloc/states/controller.dart';
import 'package:breaking_bad_bloc/views/home/widgets/character_list.dart';
import 'package:breaking_bad_bloc/widgets/error_view.dart';
import 'package:breaking_bad_bloc/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = HomeCubit.of(context);
    return BlocConsumer(
      listener: (context, state) {
        print(state.toString());
      },
      bloc: controller,
      builder: (context, state) {
        if (state is HomeLoading) {
          return LoadingIndicator();
        } else if (state is HomeError) {
          return ErrorView();
        } else {
          return GridView.extent(
            maxCrossAxisExtent: 350,
            padding: const EdgeInsets.all(5),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: characterList(controller.charactersList, context),
          );
        }
      },
    );
  }
}
