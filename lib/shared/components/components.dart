// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/HomeDataModel.dart';
import 'package:shop/models/categeory_models.dart';
import 'package:shop/shared/style/colors.dart';

import '../../modules/webview/webview.dart';

//Login Screen components

Widget text({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType input,
  required String hint,
  String? label,
 Widget? prefix,
  // IconData? suffix,
  bool password = false,
  Function(String)? onchange,
  Function(String)? onSubmit,
  Function()? prefixPressed,
  Function()? onTap,
  Widget? suffix,
}) =>
    TextFormField(
      textAlign: TextAlign.right,
      obscureText: password,
      controller: controller,
      validator: validate,
      onTap: onTap,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      keyboardAppearance: Brightness.light,
      keyboardType: input,
      textCapitalization: TextCapitalization.words,
      onChanged: onchange,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        suffixIcon: suffix,
// suffixIcon: suffixx,
        hintTextDirection: TextDirection.rtl,

        // isDense: true,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        fillColor: Colors.transparent,
        // label: Text(
        //   label!,
        //   textDirection: TextDirection.rtl,
        // ),
        // prefix: Padding(
        //   padding: EdgeInsets.only(right: 10.0),
        //   child: InkWell(onTap: (){}, child: prefix),
        // ),
        prefix: prefix !=null?InkWell(onTap: prefixPressed, child: prefix):null,
        // labelText: label,
        // labelStyle: const TextStyle(
        //   color: Color.fromRGBO(99, 99, 99, 100),
        //   // fontWeight: FontWeight.w600,
        //   fontSize: 14,
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: HexColor("#F99100"),
            // width: 1,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            width: 1,
            color: HexColor("#F99100"),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        filled: true,
        // suffixIcon: suffix != null
        //     ? IconButton(
        //         icon: Icon(suffix),
        //         onPressed: suffixpressed,
        //       )
        //     : null,
        // contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 2),
      ),
    );

Widget searchBar({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType input,
  required String hint,
  String? label,
  required Widget prifix,
  bool password = false,
  Function(String)? onchange,
  Function(String)? onsubmit,
  Function()? suffixpressed,
  Function()? prifixpressed,
  Function()? onTap,
  required Widget? suffix,
}) =>
    TextFormField(
      textAlign: TextAlign.right,
      obscureText: password,
      controller: controller,
      validator: validate,
      onTap: onTap,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      keyboardAppearance: Brightness.light,
      keyboardType: input,
      // textCapitalization: TextCapitalization.words,
      onChanged: onchange,
      onFieldSubmitted: onsubmit,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,

        hintText: hint,

        hintStyle: TextStyle(
          color: HexColor('#636363'),
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),

        fillColor: Colors.white,
        prefixIcon: InkWell(onTap: prifixpressed, child: prifix),

        suffixIcon: suffix,
//
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            width: 0,
            color: HexColor("#1E55A2"),
          ),

          // gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            width: 0,
          ),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(28),
        //   borderSide: BorderSide(
        //     width: 1,
        //     color: HexColor("#F99100"),
        //   ),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
              // color: HexColor("#F99100"),
              ),
        ),

        filled: true,
      ),
    );

Widget ShoppingCart() => CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: IconButton(
        // iconSize: 20,
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart,
          size: 20,
          color: HexColor("#F99100"),
        ),
      ),
    );

Widget AppBarShape({
  required Widget child,
  double height = 150,
  double opacity = 1,
}) =>
    Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: HexColor("#1E55A2").withOpacity(opacity),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: HexColor("#1E55A2").withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 0,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );

//Category

//Category Items

Widget buildHomeProductItem(CategeoryItemsModel model) => InkWell(
  onTap: model.onTap,
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      width: 135,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white54,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
              blurRadius: 2, blurStyle: BlurStyle.outer, spreadRadius: 5)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4, right: 2, left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 110,
              width: 130,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(model.pathImage), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.favorite,
                          color: HexColor("#B8B8B8"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.nameProduct,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: defaultcolor,
                          radius: 17,
                          child: Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor: HexColor("#F99100"),
                              radius: 8,
                              child: Icon(
                                Icons.add,
                                size: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                Spacer(),
                Text(
                  "جنيه",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  model.price,
                  style: TextStyle(
                      color: HexColor("#F99100"),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);
//Build CategoryList

Widget buildHomeProductList({
  required String type,
  required Function() allshow_ontap,
  required List list,
}) =>
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                TextButton(
                  onPressed: allshow_ontap,
                  child: Text(
                    "عرض الكل",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: HexColor("#646464"),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  type,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) => buildHomeProductItem(list[index]),
                separatorBuilder: (context, index) => SizedBox(
                      width: 30,
                    ),
                itemCount: list.length),
          ),
        ],
      ),
    );

//CategoryList

// Widget buildCategoryList(context, {required list, String? tittle}) =>
//     ListView.separated(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       itemBuilder: (
//         context,
//         index,
//       ) =>
//           buildCategoryItem(),
//       separatorBuilder: (context, index) => SizedBox(
//         height: 3,
//       ),
//       itemCount: list.length,
//     );

//HomecategoryItem

Widget categoryItem(
  CategeoryModel model, {
  double? width,
  double? height,
  double fontTittleSize = 14,
}) =>
    InkWell(
      onTap: model.onTap,
      child: Container(
        height: height,
        width: width,
        // clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(model.pathImage),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                child: Text(
                  model.nameType,
                  style: TextStyle(
                    fontSize: fontTittleSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget buildHomeCategoryList({
  required String type,
  Function()? allShow_OnTap,
  required List list,
  required Axis axis,
  int listCount = 3,
  double width = 150,
  double height = 150,
  double heightList = 150,
  double sizedBoxWidth = 10,
  double sizedBoxHeight = 10,
  bool showTextAll = true,
}) =>
    Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              (showTextAll == true)
                  ? TextButton(
                      onPressed: allShow_OnTap,
                      child: Text(
                        "عرض الكل",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: HexColor("#646464"),
                        ),
                      ),
                    )
                  : Text(""),
              Spacer(),
              Text(
                type,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: heightList,

          // padding: EdgeInsets.symmetric(horizontal: 5),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: axis,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) =>
                categoryItem(list[index], height: height, width: width),
            separatorBuilder: (context, index) => SizedBox(
              width: sizedBoxWidth,
              height: sizedBoxHeight,
            ),
            itemCount: listCount,
          ),
        ),
      ],
    );

//Start Button
Widget startButton({
  @required String? text,
  @required Function()? ontap,
}) =>
    InkWell(
      onTap: ontap,
      child: Container(
        width: 168,
        height: 33,
        decoration: BoxDecoration(
            color: HexColor("#F99100"),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

// Widget buildCategorywItemm(
//   // tittle=list["title"],
//
//   list,
//   context, {
//   bool color = false,
//   String? tittle,
//   ImageProvider? image,
// }) =>
//     InkWell(
//       onTap: () {
//         navigateTo(context, WebviewScrean(list["url"]));
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//         child: Container(
//           width: double.infinity,
//           height: 330,
//           decoration: BoxDecoration(
//               // color: Colors.red,
//               borderRadius: BorderRadius.circular(28),
// // color:Theme.of(context)?Colors.white :HexColor('333739'),
// // Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                     blurRadius: 2, blurStyle: BlurStyle.outer, spreadRadius: 5)
//               ]),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //image
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28),
//                   image: DecorationImage(
//                     // title == null ? "jhsdljhg" : title = "${list['content']}",
//                     image: NetworkImage(
//                       (list["urlToImage"] == null)
//                           ? "https://cdn.elwatannews.com/watan/840x473/5956948381439567683.jpg"
//                           : "${list["urlToImage"]}",
//                       // "${list["urlToImage"]}",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 // width: double.infinity,
//                 height: 200,
//               ),
//
//               //title
//
//               Padding(
//                 padding: EdgeInsets.only(left: 5),
//                 child: Text(
//                   //"title"
//                   (list["title"] == null) ? "Fayoum News" : "${list["title"]}",
//                   textDirection: TextDirection.rtl,
//                   style: Theme.of(context).textTheme.displayMedium,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//
//               //description
//               //لا لايمكن محاوطة الExpanded ب Padding
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     left: 5,
//                   ),
//                   child: Text(
//                     (list["description"] == null)
//                         ? "اخبار الفيوم "
//                         : "${list["description"]}",
//                     // "${list['content']}",
//                     style: Theme.of(context).textTheme.displaySmall,
//                     textDirection: TextDirection.rtl,
//
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//
//               //Author
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 5,
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 20,
//                       backgroundImage: NetworkImage(
//                         (list["urlToImage"] == null)
//                             ? "https://cdn.elwatannews.com/watan/840x473/5956948381439567683.jpg"
//                             : "${list["urlToImage"]}",
//                         // "${list["urlToImage"]}",
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Text(
//                         (list["author"] == null)
//                             ? "Fayoum News"
//                             : "${list["author"]}",
//                         textDirection: TextDirection.ltr,
//                         style: Theme.of(context).textTheme.displayMedium,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               //Time & Date
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 7,
//                 ),
//                 child: Text(
//                   "${list['publishedAt']}",
//                   textDirection: TextDirection.rtl,
//                   style: Theme.of(context).textTheme.labelSmall,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//

//Methods

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void showToast({
  String? text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}