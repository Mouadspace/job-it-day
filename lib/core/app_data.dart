import 'package:flutter_svg/svg.dart';

import '../src/model/drawer_items_model.dart';
import '../src/view/screens/company-screens/company_profile.dart';
import '../src/view/screens/company-screens/dashboard.dart';
import '../src/view/screens/company-screens/offers.dart';
import '../src/view/screens/company-screens/settings.dart';
import '../src/view/screens/company-screens/students.dart';
import 'app_asset.dart';
import 'app_color.dart';

class AppData {
  AppData._();

  // URL LAUNCHER
  static const String url = 'https://www.google.com';
  // PRESENTATION
  static const String presentation = '';

  // DRAWER
  static List<DrawerItems> drawerItems = [
    DrawerItems(
      icon: SvgPicture.asset(AppAsset.drawerProfile),
      label: 'Profile',
      screen: const CompanyProfile(),
      screenColor: LightThemeColor.primaryColor,
    ),
    DrawerItems(
      icon: SvgPicture.asset(AppAsset.drawerDashboard),
      label: 'Dashboard',
      screen: const Dashboard(),
    ),
    DrawerItems(
      icon: SvgPicture.asset(AppAsset.drawerStudents),
      label: 'Etudiants',
      screen: const Students(),
    ),
    DrawerItems(
      icon: SvgPicture.asset(AppAsset.drawerOffers),
      label: 'Offres',
      screen: const Offers(),
    ),
    DrawerItems(
      icon: SvgPicture.asset(AppAsset.drawerSettings),
      label: 'Settings',
      screen: Settings(),
    ),
  ];
}
