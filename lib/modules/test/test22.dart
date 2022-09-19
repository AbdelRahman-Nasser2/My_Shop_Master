import 'package:flutter/material.dart';




// BottomNavigationBar(
// onTap: itemselected,
// type: BottomNavigationBarType.fixed,
// selectedItemColor: HexColor("#1E55A2"),
// unselectedItemColor: Colors.black,
// unselectedLabelStyle: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 12,
// ),
// selectedLabelStyle: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 16,
// ),
// items: [
// BottomNavigationBarItem(
// icon: Icon(
// Icons.person,
// size: 30,
// ),
// label: "الحساب",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.notifications,
// size: 30,
// ),
// label: "الاشعارات",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.favorite_outlined,
// size: 30,
// ),
// label: "المفضلة",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.home,
// size: 30,
// ),
// label: "الرئيسية",
// ),
// ],
// )

class AddRecordScreen extends StatefulWidget {
  AddRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  String selectedItemPills = "Metformin Tablets";
  List<String> pillsList = [
    "Metformin Tablets",
    "Omformin",
    "Glucophage 100 mg",
    "other"
  ];

  var timeController = TextEditingController();
  var otheController = TextEditingController();

  var dateController = TextEditingController();

  var fastingController = TextEditingController();

  var reminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, RoutsNames.homeScreenForPatient);
        //       },
        //       icon: const Icon(Icons.home))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(

                        //label:Text("kkkk"),

                        hintText: ""),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    controller: timeController,
                    onTap: () {},
                    decoration: const InputDecoration(

                        //label:Text("kkkk"),

                        hintText: ""),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
            ),
            const SizedBox(
              height: 18.0,
            ),
            buildFormFeild(context,
                text: "Fasting", controller: fastingController),
            const SizedBox(
              height: 18.0,
            ),
            buildFormFeild(context,
                text: "Reminder", controller: reminderController),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .6,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedItemPills,
                      items: pillsList.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedItemPills = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            selectedItemPills == "other"
                ? buildFormFeild(context,
                    text: "Other", controller: otheController)
                : Container()
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

Widget buildFormFeild(context,
    {String? text, TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey,
        )
      ],
    ),
  );
}




//
// int currenindex = 3;
// void onPageChanged(int index) {
//   setState(() {
//     currenindex = index;
//   });
// }
//
// var pageview = PageController();
// void itemselected(int selectitem) {
//   pageview.jumpToPage(selectitem);
// }
//
// List<Widget> screens = [
//   profileScreen(),
//   notificationScreen(),
//   FavouritsScreen(),
//   HomeScreen(),
// ];
//
// return Scaffold(
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// floatingActionButton: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 32,
// child: FloatingActionButton(
// // elevation: 0,
// backgroundColor: Colors.grey[300],
// onPressed: () {
// navigateTo(context, AddProductScreen());
// },
// child: Icon(
// Icons.camera_alt,
// size: 40,
// color: HexColor("#F99100"),
// ),
// ),
// ),
// bottomNavigationBar: BottomNavigationBar(
// onTap: itemselected,
// type: BottomNavigationBarType.fixed,
// selectedItemColor: HexColor("#1E55A2"),
// unselectedItemColor: Colors.black,
// unselectedLabelStyle: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 12,
// ),
// selectedLabelStyle: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 16,
// ),
// items: [
// BottomNavigationBarItem(
// icon: Icon(
// Icons.person,
// size: 30,
// ),
// label: "الحساب",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.notifications,
// size: 30,
// ),
// label: "الاشعارات",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.favorite_outlined,
// size: 30,
// ),
// label: "المفضلة",
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.home,
// size: 30,
// ),
// label: "الرئيسية",
// ),
// ],
// ),
// body: PageView(
// children: screens,
// onPageChanged: onPageChanged,
// controller: pageview,
// physics: NeverScrollableScrollPhysics(),
// ),
// );