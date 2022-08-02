import 'package:flutter/material.dart';
import 'package:pets_exercise/features/pets/logic/pets_apis.dart';
import 'package:pets_exercise/features/pets/models/cats_model.dart';
import 'package:pets_exercise/features/pets/models/dogs_model.dart';
import 'package:rxdart/rxdart.dart';

class PetsBloc {
  final PetsApis _apis = PetsApis();

  final _dogsBlocFetcher = BehaviorSubject<DogsModel>();

  Stream<DogsModel> get dogsStream => _dogsBlocFetcher.stream;

  final _catsBlocFetcher = BehaviorSubject<CatsModel>();

  Stream<CatsModel> get catsStream => _catsBlocFetcher.stream;

  Future getDogs(BuildContext context) async {
    try {
      DogsModel model = await _apis.getDogs(context);
      _dogsBlocFetcher.sink.add(model);
    } catch (error) {
      _dogsBlocFetcher.sink.addError(error);
      debugPrint('error $error');
    }
  }

  Future getCats(BuildContext context) async {
    try {
      CatsModel model = await _apis.getCats(context);
      _catsBlocFetcher.sink.add(model);
    } catch (error) {
      _catsBlocFetcher.sink.addError(error);
      debugPrint('error $error');
    }
  }
}

PetsBloc petsBloc = PetsBloc();
