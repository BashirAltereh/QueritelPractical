import 'package:flutter/material.dart';
import 'package:pets_exercise/core/common_widgets/image_view.dart';
import 'package:pets_exercise/core/constants/app_colors.dart';
import 'package:pets_exercise/core/constants/app_constants.dart';
import '../models/dogs_model.dart';

class PetDetailsPage extends StatefulWidget {
  final PetItemModel pet;
  final int index;

  const PetDetailsPage({
    Key? key,
    required this.pet,
    required this.index,
  }) : super(key: key);

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.blue),
        title: Text(
          widget.pet.name ?? '',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: AppColors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: petData(),
        ),
      ),
    );
  }

  Widget petData() {
    return Wrap(
      runAlignment: WrapAlignment.spaceAround,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 24,
      runSpacing: 24,
      children: [
        SizedBox(
          height: 220,
          width: 310,
          child: Card(
            elevation: 0.5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Hero(
                tag: '${AppConstants.heroTag}${widget.index}',
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageBuilder(imageUrl: widget.pet.photo ?? ''))),
          ),
        ),
        _contentWidget()
      ],
    );
  }

  Widget _contentWidget() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.pet.name ?? ''} - Age: ${widget.pet.age ?? ''}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            widget.pet.description ?? '',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
