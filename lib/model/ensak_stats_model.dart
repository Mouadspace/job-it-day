class EnsakStatsModel {
  String icon, label;
  int stats;
  EnsakStatsModel({
    required this.icon,
    required this.stats,
    required this.label,
  });
}

List<EnsakStatsModel> statsList = [
  EnsakStatsModel(
    icon: 'assets/svgs/students.svg',
    stats: 1697,
    label: 'Etudiants',
  ),
  EnsakStatsModel(
    icon: 'assets/svgs/teachers.svg',
    stats: 60,
    label: 'Professeurs',
  ),
  EnsakStatsModel(
    icon: 'assets/svgs/administration.svg',
    stats: 28,
    label: 'Administratifs',
  ),
  EnsakStatsModel(
    icon: 'assets/svgs/formation.svg',
    stats: 10,
    label: 'Formations',
  ),
];
