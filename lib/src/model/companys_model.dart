class CompanyModel {
  String companyName;
  String companyEmail;
  String? companyImage = 'assets/images/companyLogo-default.png';
  String? beginningTitle;
  BlueBarButton blueBarButtons;
  List<CompanyPost>? companyPosts;

  CompanyModel({
    required this.companyName,
    required this.companyEmail,
    this.companyImage,
    this.beginningTitle,
    required this.blueBarButtons,
    this.companyPosts,
  });
}

class CompanyPost {
  String title;
  PostDate startDate;
  PostDate endDate;
  String description;

  CompanyPost({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class PostDate {
  final int day;
  final String month;

  PostDate({
    required this.day,
    required this.month,
  });
}

class BlueBarButton {
  final String buttonText;
  final void Function() buttonClicked;

  BlueBarButton({
    required this.buttonText,
    required this.buttonClicked,
  });
}

// Exmaples
// for announcement/posts
List<CompanyPost> postsList = [
  CompanyPost(
    title: 'Recrutement',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Nous recherchons un étudiant senior (CI2) pour un stage. Si vous êtes passionné par le développement back-end et que vous cherchez à vous perfectionner, envoyez votre CV à nos RH.\n\nAddress-email : email@gmail.com",
  ),
  CompanyPost(
    title: 'Stande',
    startDate: PostDate(day: 15, month: 'juillet'),
    endDate: PostDate(day: 27, month: 'juillet'),
    description:
        "Chers étudiants de l'ENSAK, Nous organisons notre stand ce lundi, pour ceux qui souhaitent en savoir plus sur notre entreprise, si vous avez des questions, ou postulez pour des stages... \n\nA bientôt !",
  ),
];
