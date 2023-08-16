import 'package:flutter/material.dart';
import 'package:jobitday/view/screens/students_module.dart';

class SearchStudent extends StatelessWidget {
  SearchStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Down here, i'm trying to create a little sample of students list
  static List<StudentModel> main_students_list = [
    StudentModel('Oubayahe Otmane', 'CI2, Génie Informatique',
        'assets/images/default-student-image.png'),
    StudentModel('Saif Mouad', 'CI2, Génie Informatique',
        'assets/images/default-student-image.png'),
    StudentModel('Laarbi Ilham', 'CI2, Génie Mechatronics',
        'assets/images/ilhamLaarbi.jpg'),
    StudentModel('Tabchi Yassine', 'CI2, Génie Mechatronics',
        'assets/images/yassineTabchi.jpg'),
    StudentModel('Bouhouch Yassine', 'CI2, Génie Mechatronics',
        'assets/images/default-student-image.png'),
    StudentModel('El Omari Imane', 'CI2, Génie Industrielle',
        'assets/images/imaneElOmari.jpg'),
  ];

  // creating the list that we're going to display and filter
  List<StudentModel> display_list = List.from(main_students_list);

  void updateList(String value) {
    // this is the function that will filter our list
    setState(() {
      display_list = main_students_list
          .where((element) =>
              element.student_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 248, 249, 250),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Etudiants',
              style: Theme.of(context).textTheme.titleLarge,
              // Ma3erftch 3elach henna, makaybanch text kbir bhal ENSAK en chiffres
              // Wakha khedmt b nafss lcode (theme)
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Chercher ...",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: Color(0xFFE3F1FA),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                        title: Text(
                          display_list[index].student_name!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${display_list[index].student_education_grade!}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            display_list[index].student_image_path!,
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
