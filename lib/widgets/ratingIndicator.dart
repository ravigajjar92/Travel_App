import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';

class RatingIndicator extends StatelessWidget {
  final double rating;

  final Color? textColor;

  const RatingIndicator({Key? key, required this.rating, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          initialRating: rating,
          direction: Axis.horizontal,
          itemSize: 12,
          ratingWidget: RatingWidget(
              full: Image.asset('assets/icons/ic_star_fill.png'),
              half: Image.asset('assets/icons/ic_star_empty.png'),
              empty: Image.asset('assets/icons/ic_star_empty.png')),
          allowHalfRating: true,
          itemCount: 5,
          onRatingUpdate: (double value) {},
          ignoreGestures: true,
        ),
        const SizedBox(width: 5),
        Text(
          rating.toString(),
          style: fontStyleUrbanistSemiBold(
                  fontSize: 12, fontColor: textColor ?? Colors.white)
              .copyWith(decoration: TextDecoration.none),
        )
      ],
    );
  }
}
