import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';

enum Gender{
  male, female, nonBinary ;


  IconData get icon =>switch(this){
    male => AppIcons.male ,
    female => AppIcons.female,
   _=> AppIcons.nonBinary
  } ;
  String get text =>switch(this){
    male => "ذكر" ,
    female => "انثى",
   _=> "اخر"
  } ;
}