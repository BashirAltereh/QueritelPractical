import 'package:flutter/material.dart';
import 'package:pets_exercise/features/pets/logic/pets_bloc.dart';
import 'package:pets_exercise/features/pets/ui/widgets/tab_data_widget.dart';
import 'package:pets_exercise/features/pets/ui/widgets/tabs_widget.dart';
import '../../../core/constants/enums.dart';

class PetsListPage extends StatefulWidget {
  const PetsListPage({Key? key}) : super(key: key);

  @override
  State<PetsListPage> createState() => _PetsListPageState();
}

class _PetsListPageState extends State<PetsListPage> {

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData(){
    petsBloc.getCats(context);
    petsBloc.getDogs(context);
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabsWidget(),
        body: TabBarView(
          children: [
            TabDataWidget(petType: PetType.cats),
            TabDataWidget(petType: PetType.dogs),
          ],
        ),
      ),
    );
  }
}
