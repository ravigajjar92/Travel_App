import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/listeners/SearchListeners.dart';
import 'package:practical_travel_app/screens/homeScreen/chooseCategory.dart';
import 'package:practical_travel_app/screens/homeScreen/destinationListWidget.dart';
import 'package:practical_travel_app/screens/homeScreen/popularPackageListWidget.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';
import 'package:practical_travel_app/widgets/searchBarWidget.dart';
import 'package:practical_travel_app/widgets/toolBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements SearchListeners {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              ToolBar(
                leadingWidget: _profileImageWidget(),
                titleWidget: _userNameWidget(),
                endWidget: _lampIconWidget(),
              ),
              _exploreTodayTextWidget(),
              SearchBarWidget(
                searchListeners: this,
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              const SizedBox(height: 30),
              ChooseCategory(onSelectCategory: (String category) {}),
              const SizedBox(height: 30),
              const DestinationListWidget(),
              const SizedBox(height: 40),
              const PopularListWidget(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImageWidget() {
    return Container(
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        color: greyColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _userNameWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Hello, Vineetha',
        style: fontStyleInterMedium(),
      ),
    );
  }

  Widget _lampIconWidget() {
    return SizedBox(
      height: 24,
      width: 24,
      child: Image.asset('assets/icons/ic_lamp.png'),
    );
  }

  Widget _exploreTodayTextWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      child: Text(
        'Where do you\nwant to explore today?',
        style: fontStylePoppinsSemiBold(),
      ),
    );
  }

  @override
  onSearch(String value) {
    debugPrint(value);
  }
}
