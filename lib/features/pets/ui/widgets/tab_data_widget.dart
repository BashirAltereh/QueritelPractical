import 'package:flutter/material.dart';
import 'package:pets_exercise/features/pets/logic/pets_bloc.dart';
import 'package:pets_exercise/features/pets/ui/widgets/pets_list_widget.dart';
import '../../../../core/common_widgets/loading_view.dart';
import '../../../../core/constants/enums.dart';

class TabDataWidget extends StatelessWidget {
  final PetType petType;

  const TabDataWidget({Key? key, required this.petType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _getData(context);
        Future.delayed(const Duration(seconds: 1));
      },
      child: StreamBuilder(
          stream: _getStream(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return PetsListWidget(
                petsList: _getList(snapshot),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('No internet connection'),
              );
            } else {
              return const LoadingView();
            }
          }),
    );
  }

  Stream _getStream() {
    return petType == PetType.dogs ? petsBloc.dogsStream : petsBloc.catsStream;
  }

  List _getList(AsyncSnapshot snapshot) {
    return petType == PetType.dogs
        ? snapshot.data?.dogs ?? []
        : snapshot.data?.cats ?? [];
  }

  void _getData(BuildContext context) {
    if (petType == PetType.cats) {
      petsBloc.getCats(context);
    } else {
      petsBloc.getDogs(context);
    }
  }
}
