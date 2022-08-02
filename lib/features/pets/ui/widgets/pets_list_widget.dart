import 'package:flutter/material.dart';
import 'package:pets_exercise/features/pets/ui/widgets/pet_item.dart';

class PetsListWidget extends StatelessWidget {
  final List petsList;

  const PetsListWidget({Key? key, required this.petsList,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 24,
          spacing: 24,
          children: List.generate(
            petsList.length,
            (index) => PetItem(index: index,petItem: petsList[index],radius: 8),
          ),
        ),
      ),
    );
  }


}
