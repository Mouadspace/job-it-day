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
  static const String presentation =
      "L’Ecole Nationale des Sciences Appliquées de Kénitra (ENSAK) a été créée en 2008. Sa Majesté le Roi Mohammed VI a procédé le Lundi 13 0ctobre 2008 à la pose de la première pierre pour la construction des locaux de l’établissement. L’ENSAK a pour vocation de former des ingénieurs d’état dans des domaines scientifiques et techniques mais avec des compétences en management et en communication. L’ouverture de l’ENSAK vient conforter les efforts déployés tant au niveau national que régional visant à répondre au programme national de formation des 10 000 ingénieurs. quatre cycles ingénieurs sont ouverts dans des spécialités susceptibles de connaître d’importants développements";

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
