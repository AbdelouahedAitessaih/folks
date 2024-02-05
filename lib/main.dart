import 'package:flutter/material.dart';

//Packages
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:folks/pages/splash_page.dart';

void main() {
  runApp(SplashPage(key: UniqueKey(),onInitializationComplete: (){}));
}
