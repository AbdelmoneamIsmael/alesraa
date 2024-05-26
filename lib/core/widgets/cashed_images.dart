import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashedImage extends StatelessWidget {
  const CashedImage({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) {
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
