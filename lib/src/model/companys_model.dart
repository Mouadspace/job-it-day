class CompanyModel {
  String companyName;
  String companyEmail;
  String? companyImage = 'assets/images/companyLogo-default.png';
  List<CompanyPost>? companyPosts;

  CompanyModel({
    required this.companyName,
    required this.companyEmail,
    this.companyImage,
    this.companyPosts,
  });
}

class CompanyPost {
  String title;
  PostDate startDate;
  PostDate endDate;
  String description;
  String? offerPosition = '';
  String? intershipType = '';
  int? applicants = 0;

  CompanyPost({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.offerPosition, // This one is '' for Stands
    this.intershipType, // This one is '' for Stands
    this.applicants, // number of applicants for an offre
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

// Exmaples
// for announcement/posts
List<CompanyPost> postsList = [
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Formation : Bac+3 à Bac + 5 dans un domaine de l'IT Bon niveau en Français et en Anglais, Espagnole souhaité Une certification dans un des domaines IT est un plus Forte autonomie, créativité, rapidité de compréhension et de montée en compétenceUne première séléction se fera sur CV",
    offerPosition: 'Web developper',
    intershipType: 'PFE',
    applicants: 5,
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Formation : Bac+3 à Bac + 5 dans un domaine de l'IT Bon niveau en Français et en Anglais, Espagnole souhaité Une certification dans un des domaines IT est un plus Forte autonomie, créativité, rapidité de compréhension et de montée en compétenceUne première séléction se fera sur CV",
    offerPosition: 'Web developper',
    intershipType: 'PFE',
    applicants: 7,
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Formation : Bac+3 à Bac + 5 dans un domaine de l'IT Bon niveau en Français et en Anglais, Espagnole souhaité Une certification dans un des domaines IT est un plus Forte autonomie, créativité, rapidité de compréhension et de montée en compétenceUne première séléction se fera sur CV",
    offerPosition: 'Web developper',
    intershipType: 'PFE',
    applicants: 9,
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Formation : Bac+3 à Bac + 5 dans un domaine de l'IT Bon niveau en Français et en Anglais, Espagnole souhaité Une certification dans un des domaines IT est un plus Forte autonomie, créativité, rapidité de compréhension et de montée en compétenceUne première séléction se fera sur CV",
    offerPosition: 'Web developper',
    intershipType: 'PFE',
    applicants: 10,
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Nous recherchons un étudiant senior (CI2) pour un stage. Si vous êtes passionné par le développement back-end et que vous cherchez à vous perfectionner, envoyez votre CV à nos RH.\n\nAddress-email : email@gmail.com",
    offerPosition: 'Back-end developper',
    intershipType: 'PFA',
    applicants: 0,
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Nous recherchons un étudiant senior (CI2) pour un stage. Si vous êtes passionné par le développement back-end et que vous cherchez à vous perfectionner, envoyez votre CV à nos RH.\n\nAddress-email : email@gmail.com",
    offerPosition: 'Back-end developper',
    intershipType: 'PFA',
  ),
  CompanyPost(
    title: 'Offre',
    startDate: PostDate(day: 5, month: 'juillet'),
    endDate: PostDate(day: 7, month: 'juillet'),
    description:
        "Nous recherchons un étudiant senior (CI2) pour un stage. Si vous êtes passionné par le développement back-end et que vous cherchez à vous perfectionner, envoyez votre CV à nos RH.\n\nAddress-email : email@gmail.com",
    offerPosition: 'Back-end developper',
    intershipType: 'PFA',
  ),
  CompanyPost(
    title: 'Stande',
    startDate: PostDate(day: 15, month: 'juillet'),
    endDate: PostDate(day: 27, month: 'juillet'),
    description:
        "Chers étudiants de l'ENSAK, Nous organisons notre stand ce lundi, pour ceux qui souhaitent en savoir plus sur notre entreprise, si vous avez des questions, ou postulez pour des stages... \n\nA bientôt !",
    offerPosition: '',
  ),
  CompanyPost(
    title: 'Stande',
    startDate: PostDate(day: 15, month: 'juillet'),
    endDate: PostDate(day: 27, month: 'juillet'),
    description:
        "Chers étudiants de l'ENSAK, Nous organisons notre stand ce lundi, pour ceux qui souhaitent en savoir plus sur notre entreprise, si vous avez des questions, ou postulez pour des stages... \n\nA bientôt !",
    offerPosition: '',
  ),
  CompanyPost(
    title: 'Stande',
    startDate: PostDate(day: 15, month: 'juillet'),
    endDate: PostDate(day: 27, month: 'juillet'),
    description:
        "Chers étudiants de l'ENSAK, Nous organisons notre stand ce lundi, pour ceux qui souhaitent en savoir plus sur notre entreprise, si vous avez des questions, ou postulez pour des stages... \n\nA bientôt !",
    offerPosition: '',
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

List<CompanyModel> companiesList = [
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
  CompanyModel(
    companyName: 'Company Name',
    companyImage: 'assets/images/companyLogo-default.png',
    companyEmail: 'companyEmail@gmail.com',
  ),
];
