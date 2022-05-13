import 'package:flutter/material.dart';
import 'package:hestia22/screens/schedule/enums.dart';

class DateInfo extends ChangeNotifier{
  DateType dateType;
  String date;
  String day;

  DateInfo(this.dateType, this.date, this.day);

  updateDate(DateInfo dateInfo){
    dateType = dateInfo.dateType;
    date = dateInfo.date;
    day = dateInfo.day;

    notifyListeners();
  }
}