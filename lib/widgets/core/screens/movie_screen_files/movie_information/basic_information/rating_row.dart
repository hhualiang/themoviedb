import 'package:flutter/cupertino.dart';

import '../../../../../../utils/ui_constants.dart';
import 'rating.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RatingDisplay(
          rating: rating,
        ),
        const SizedBox(
          width: UiConstants.ratingRowSizedBoxWidth,
        ),
      ],
    );
  }
}
