import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/screens/homeScreen/popularPackageWidget.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';

class PopularListWidget extends StatefulWidget {
  const PopularListWidget({Key? key}) : super(key: key);

  @override
  State<PopularListWidget> createState() => _PopularListWidgetState();
}

class _PopularListWidgetState extends State<PopularListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleWidget(),
              _seeAllButtonWidget(),
            ],
          ),
        ),
        const SizedBox(height: 27.5),
        Column(
          children: const [
            PopularPackageWidget(
              resortName: 'Kuta Resort',
              resortImagePath: 'assets/images/img_kuta_resort.png',
              packagePrice: '20,000',
              description:
                  'A resort is a place used for vacation, relaxation or as a day',
              rating: 4.8,
            ),
            PopularPackageWidget(
              resortName: 'Baga Beach Resort',
              resortImagePath: 'assets/images/img_baga_beach.png',
              packagePrice: '15,000',
              description:
              'A resort is a place used for vacation, relaxation or as a day',
              rating: 4.8,
            ),
          ],
        )
      ],
    );
  }

  Widget _titleWidget() {
    return Text(
      'Popular Package',
      style: fontStyleInterMedium(fontSize: 16),
    );
  }

  Widget _seeAllButtonWidget() {
    return Text('See all',
        style: fontStyleInterMedium(
            fontSize: 12, fontColor: seeAllButtonTextColor));
  }
}
