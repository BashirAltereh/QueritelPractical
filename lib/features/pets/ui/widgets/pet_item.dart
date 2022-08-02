import 'package:flutter/material.dart';
import '../../../../core/common_widgets/animation_scale_widget.dart';
import '../../../../core/common_widgets/image_view.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../models/dogs_model.dart';
import '../pet_details_page.dart';

class PetItem extends StatelessWidget {
  const PetItem(
      {Key? key,
      required this.petItem,
      required this.index,
      required this.radius})
      : super(key: key);

  final PetItemModel petItem;
  final int index;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AnimationScaleWidget(
      horizontalOffset: index.isEven ? -30 : 30,
      position: index,
      verticalOffset: 0,
      child: SizedBox(
        height: 160,
        width: 160,
        child: Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          child: TextButton(
            onPressed: () => AppRouter.goToNextScreen(
                context,
                PetDetailsPage(
                  pet: petItem,
                  index: index,
                )),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_imageWidget(index), _contentWidget(context, index)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageWidget(int index) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        child: Hero(
          tag: '${AppConstants.heroTag}$index',
          child: ImageBuilder(
            imageUrl: petItem.photo ?? '',
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          Text(
            petItem.name ?? '',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            'Age: ${petItem.age ?? ''}',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
