import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pets_exercise/core/constants/api_urls.dart';
import 'package:pets_exercise/features/pets/models/cats_model.dart';
import 'package:pets_exercise/features/pets/models/dogs_model.dart';

import '../../../core/utils/api_provider.dart';

class PetsApis {
  Future<CatsModel> getCats(BuildContext context) async {
    var response = await ApiProvider.dataLoader(
      context,
      RequestType.get,
      ApiUrls.cats,
    );

    log('response---: $response');

    return CatsModel.fromJson(json.decode(response.toString()));
  }

  Future<DogsModel> getDogs(BuildContext context) async {
    var response = await ApiProvider.dataLoader(
      context,
      RequestType.get,
      ApiUrls.dogs,
    );

    log('response---: $response');

    return DogsModel.fromJson(json.decode(response.toString()));
  }
}
