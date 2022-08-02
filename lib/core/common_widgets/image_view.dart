import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pets_exercise/core/common_widgets/custom_shimmer.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;

  const ImageBuilder({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return imageProviderForWeb();
    } else {
      return imageProviderForMobile();
    }
  }

  Widget imageProviderForWeb() {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return loadingImage();
      },
    );
  }

  Widget imageProviderForMobile() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => loadingImage(),
      errorWidget: (context, url, error) => errorPlaceholder(),
    );
  }

  Widget errorPlaceholder() {
    return const SizedBox();
  }

  Widget loadingImage({double height = 80, double width = 80}) {
    return CustomShimmer.squarer();
  }
}
