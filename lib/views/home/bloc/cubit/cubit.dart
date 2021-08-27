import 'package:bloc/bloc.dart';
import 'package:breaking_bad_bloc/views/home/bloc/states/controller.dart';
import 'package:breaking_bad_bloc/views/home/models/characters_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  Dio _dio = Dio();
  bool isSearch = false;
  List<CharactersModel> charactersList = [];
  List<CharactersModel> list = [];

  String name = '';

  Future<void> checkConnectivity() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(HomeError());
      } else {
        getData();
        emit(HomeInit());
      }
    });
  }

  Future<void> getData() async {
    bool connected =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;

    if (connected) {
      emit(HomeLoading());
      try {
        final response =
            await _dio.get('https://www.breakingbadapi.com/api/characters');
        final data = response.data as List;
        data.forEach((element) {
          CharactersModel homeModel = CharactersModel.fromJson(element);
          charactersList.add(homeModel);
          charactersList = list;
        });
      } catch (e) {
        print(e.toString());
      }
      emit(HomeInit());
    } else {
      emit(HomeError());
    }
  }

  void search(String name) {
    final character = list.where((element) {
      final actor = element.name!.toLowerCase();
      final search = name.toLowerCase();
      return actor.contains(search);
    }).toList();
    this.name = name;
    this.charactersList = character;
    emit(HomeSearch());
  }

  clickSearch() {
    isSearch = !isSearch;
    emit(HomeSearchButton());
  }
}
