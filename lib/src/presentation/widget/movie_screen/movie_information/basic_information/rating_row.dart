import 'package:flutter/cupertino.dart';

import '../../../../../core/util/widget_keys.dart';
import 'rating.dart';

class RatingRow extends StatelessWidget {
  static const double sizedBoxWidth = 10;

  const RatingRow({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key(WidgetKey.movieDetailsRatingRow),
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RatingDisplay(
          rating: rating,
        ),
        const SizedBox(
          width: sizedBoxWidth,
        ),
      ],
    );
  }
}
