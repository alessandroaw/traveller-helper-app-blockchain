import 'package:flutter/widgets.dart';
import 'package:traveller_helper/screens/helper.dart';
import 'package:traveller_helper/screens/helper_submit.dart';
import 'package:traveller_helper/screens/traveler_home/traveller.dart';
import 'package:traveller_helper/screens/traveller_order.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => HelperPage(),
  '/helper': (context) => HelperPage(),
  '/helper-submit': (context) => HelperSubmitPage(),
  '/traveller-order': (context) => TravellerOrder(),
  '/traveller': (context) => TravellerPage(),
};
