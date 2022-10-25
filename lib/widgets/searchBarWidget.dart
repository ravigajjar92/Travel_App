import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practical_travel_app/constants/appColor.dart';
import 'package:practical_travel_app/listeners/SearchListeners.dart';
import 'package:practical_travel_app/utils/styleUtils.dart';

class SearchBarWidget extends StatefulWidget {
  final SearchListeners? searchListeners;
  final String hintText;
  final EdgeInsets? padding;

  const SearchBarWidget({
    Key? key,
    this.searchListeners,
    this.hintText = 'Search',
    this.padding,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: widget.padding,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchFieldBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          hintStyle:
              fontStyleInterMedium(fontSize: 16, fontColor: hintTextColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.5, horizontal: 16),
        ),
        onChanged: _onTextChange,
      ),
    );
  }

  _onTextChange(String value) {
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
        _timer = Timer(const Duration(milliseconds: 800), () {
          widget.searchListeners!.onSearch(value);
        });
      } else {
        _timer = Timer(const Duration(milliseconds: 800), () {
          widget.searchListeners!.onSearch(value);
        });
      }
    } else {
      _timer = Timer(const Duration(milliseconds: 800), () {
        widget.searchListeners!.onSearch(value);
      });
    }
  }
}
