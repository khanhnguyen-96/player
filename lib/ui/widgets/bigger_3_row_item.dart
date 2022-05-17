import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/images.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:cached_network_image/cached_network_image.dart';

class Bigger3RowDetailItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String caption;
  final String? imageUrl;
  final EdgeInsetsGeometry? padding;

  const Bigger3RowDetailItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.caption,
    this.imageUrl,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle2
        ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.dullWhite);
    final subtitleStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(color: AppColors.dullWhite);
    final captionStyle =
        Theme.of(context).textTheme.caption?.copyWith(color: AppColors.gray);
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            width: 88,
            height: 88,
            placeholder: (_, __) => defaultImage,
            errorWidget: (_, __, ___) => defaultImage,
            imageUrl: imageUrl ?? preferences.defaultImageUrl,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: subtitleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  caption,
                  style: captionStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
