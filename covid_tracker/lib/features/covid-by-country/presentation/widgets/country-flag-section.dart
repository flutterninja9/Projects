import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  const FlagImage({
    Key key,
    @required this.flag,
    @required this.countryName,
  }) : super(key: key);

  final String flag;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: flag,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 15, maxWidth: 15),
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            countryName,
            overflow: TextOverflow.clip,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
