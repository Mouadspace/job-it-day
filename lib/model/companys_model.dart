class CompanyModel {
  String companyName;
  String companyEmail;
  String? companyImage = 'assets/images/companyLogo-default.png';
  BlueBarButton blueBarButtons;
  List<CompanyPost>? companyPosts;

  CompanyModel({
    required this.companyName,
    required this.companyEmail,
    this.companyImage,
    required this.blueBarButtons,
    this.companyPosts,
  });
}

class CompanyPost {
  String title;
  PostDate startDate;
  PostDate endDate;
  String description;
  String offerPosition;

  CompanyPost({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.offerPosition,
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
    title: 'Offer',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Formation : Bac+3 à Bac + 5 dans un domaine de l'IT Bon niveau en Français et en Anglais, Espagnole souhaité Une certification dans un des domaines IT est un plus Forte autonomie, créativité, rapidité de compréhension et de montée en compétenceUne première séléction se fera sur CV",
    offerPosition: 'Web developper',
  ),
  CompanyPost(
    title: 'Offer',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Nous recherchons un étudiant senior (CI2) pour un stage. Si vous êtes passionné par le développement back-end et que vous cherchez à vous perfectionner, envoyez votre CV à nos RH.\n\nAddress-email : email@gmail.com",
    offerPosition: 'Back-end developper',
  ),
  CompanyPost(
    title: 'Stande',
    startDate: PostDate(day: 15, month: 'juillet'),
    endDate: PostDate(day: 27, month: 'juillet'),
    description:
        "Chers étudiants de l'ENSAK, Nous organisons notre stand ce lundi, pour ceux qui souhaitent en savoir plus sur notre entreprise, si vous avez des questions, ou postulez pour des stages... \n\nA bientôt !",
    offerPosition: '',
  ),
];
