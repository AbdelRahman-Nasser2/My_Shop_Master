// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// Widget text({
//   String? Function(String?)? validate,
//   required TextEditingController controller,
//   required TextInputType input,
//   required String hint,
//   required String label,
//   required IconData prifix,
//   IconData? suffix,
//   bool password = false,
//   Function(String)? onchange,
//   Function(String)? onsubmit,
//   Function()? onTap,
//   Function()? suffixpressed,
// }) =>
//     TextFormField(
//       obscureText: password,
//       controller: controller,
//       validator: validate,
//       onTap: onTap,
//       style: const TextStyle(
//         color: Colors.black54,
//         fontWeight: FontWeight.w600,
//         fontSize: 16,
//       ),
//       keyboardAppearance: Brightness.light,
//       keyboardType: input,
//       textCapitalization: TextCapitalization.words,
//       onChanged: onchange,
//       onFieldSubmitted: onsubmit,
//       decoration: InputDecoration(
//           // isDense: true,
//           hintText: hint,
//           hintStyle: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//           ),
//           fillColor: Colors.white,
//           // focusColor: Colors.amber,
//           // hoverColor: Colors.deepPurple,
//           prefix: Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: Icon(prifix),
//           ),
//           labelText: label,
//           labelStyle: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(28),
//             borderSide: BorderSide(
//               color: Colors.orange,
//               width: 1,
//             ),
//             gapPadding: 10,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(28),
//             borderSide: BorderSide(
//               width: 1,
//               color: HexColor('#b5862e'),
//             ),
//           ),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
//           filled: true,
//           suffixIcon: suffix != null
//               ? IconButton(
//                   icon: Icon(suffix),
//                   onPressed: suffixpressed,
//                 )
//               : null,
//           contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 2)),
//     );
//
// // show tasks
// // Widget buildTaskItem(
// //     Map model,context,{archive,done}
// //     ) =>Padding(
// //       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
// //       child:   Row(
// //
// //     mainAxisSize: MainAxisSize.min,
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     mainAxisAlignment: MainAxisAlignment.start,
// //
// //     children:
// //
// //     [
// //
// //       CircleAvatar(
// //         backgroundColor: HexColor('#b5862e'),
// //         radius: 30.0,
// //
// //
// //
// //       ),
// //
// //       SizedBox(
// //
// //         width: 25,),
// //
// //       Expanded(
// //         child: Column(
// //
// //           mainAxisSize: MainAxisSize.max,
// //           //
// //           mainAxisAlignment: MainAxisAlignment.start,
// //
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //
// //           children:
// //
// //           [
// //           //title
// //             Text(
// //
// //               '${model['title']}',
// //
// //               style: TextStyle(
// //
// //                 fontSize: 18.0,
// //
// //                 fontWeight: FontWeight.w700,
// //
// //               ),
// //
// //             ),
// //
// //             SizedBox(
// //
// //               height: 10.0,
// //
// //             ),
// //
// //
// //
// //             // SizedBox(
// //             //
// //             //   width: 15,
// //             //
// //             // ),
// //
// //             //note
// //             Text(
// //
// //               '${model['note']}',
// //
// //               style: TextStyle(
// //
// //                 fontSize: 14.0,
// //
// //                 color: Colors.grey,
// //
// //               ),
// //
// //             ),
// //
// //
// //
// //             Row(
// //               mainAxisSize: MainAxisSize.max,
// //               children:[ Expanded(
// //                 child: Text(
// //
// //                   '${model['date']}',
// //
// //                   style: TextStyle(
// //
// //                       fontSize: 16,
// //
// //                       fontWeight: FontWeight.bold,
// //
// //                       color: Colors.black
// //
// //                   ),
// //
// //                 ),
// //               ),
// //
// //
// //                 SizedBox(
// //                   width: 10,
// //                 ),
// //
// //
// //                 //time
// //                 Text(
// //
// //                   '${model['time']}',
// //
// //                   style: TextStyle(
// //
// //                       fontSize: 16,
// //
// //                       fontWeight: FontWeight.bold,
// //
// //                       color: Colors.black
// //
// //                   ),
// //
// //                 ),
// // ]
// //             ),
// //
// //
// //
// //
// //           ],
// //
// //         ),
// //       ),
// //
// //       SizedBox(
// //
// //         width: 20,),
// //
// //       PopupMenuButton(
// //         itemBuilder: (BuildContext context) =>
// //         [
// //           PopupMenuItem(
// //             child: Row(
// //               children:[
// //                 Icon(Icons.archive_outlined,
// //                   color: Colors.black45,),
// //                 SizedBox(width: 5,),
// //                 Text('Archive task'),
// //               ]
// //             ),
// //           value: MenuValues.archivetask,
// //           ),
// //           PopupMenuItem(
// //             child: Row(
// //                 children:[
// //                   Icon(Icons.done_outline_outlined,
// //                     color: Colors.green,),
// //                   SizedBox(width: 5,),
// //                   Text('Done Task'),
// //                 ]
// //             ),
// //             value: MenuValues.dontask,
// //           ),
// //           PopupMenuItem(
// //             child: Row(
// //                 children:[
// //                   Icon(Icons.clear,
// //                     color: Colors.red,),
// //                   SizedBox(width: 5,),
// //                   Text('Delete Task'),
// //                 ]
// //             ),
// //             value: MenuValues.deletetask,
// //           ),
// //         ],
// //
// //         onSelected: (value) {
// //           switch (value) {
// //             case MenuValues.archivetask:
// //              AppCubit.get(context).updatedatabase(status: 'archive', id: model['id']);
// //               break;
// //             case MenuValues.dontask:
// //           AppCubit.get(context).updatedatabase(status: 'done', id: model['id']);
// //               break;
// //           case MenuValues.deletetask:
// //             AppCubit.get(context).deletedatedatabase(id: model['id']);
// //             break;
// //
// //           }
// //         },
// //   )
// //       // PopupMenuButton<Widget>(itemBuilder: (context)=>items.map((item) => PopupMenuItem(child: child)).toList()),
// //
// //
// //
// //     ],
// //
// //   ),
// // );
//
// //conditional
//
// // Widget taskBuilder (
// // {
// //   required List<Map> tasks
// // })
// // =>ConditionalBuilder(
// //   condition: tasks.isNotEmpty,
// //   builder: (context)=>ListView.separated(
// //     itemBuilder: (context, index) => Expanded(child: buildTaskItem(tasks[index], context)),
// //     separatorBuilder: (context, index) => Padding(
// //       padding:  EdgeInsets.symmetric(horizontal: 20.0),
// //       child: Container(
// //         width: double.infinity,
// //         height: 1,
// //         color: HexColor('#b5862e'),
// //
// //       ),
// //     ),
// //     itemCount: tasks.length,
// //   ),
// //   fallback: (context)=>Center(
// //
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children:
// //       [
// //         Icon(
// //           Icons.menu,
// //           color: Colors.grey,
// //           size: 100,
// //         ),
// //         Text(
// //           "No Tasks yet",
// //           style: TextStyle(
// //               color: Colors.grey,
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold
// //           ),
// //         )
// //       ],
// //     ),
// //   ),
// // );
//
// //Login
// Widget bottum({
//   onpress,
//   required String nameButton,
// }) =>
//     Padding(
//       padding: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
//       child: Container(
//         width: double.infinity,
//         height: 50,
//         decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Colors.purple, Colors.red],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topLeft,
//             ),
//             borderRadius: BorderRadius.circular(30)),
//         child: MaterialButton(
//           autofocus: true,
//           onPressed: onpress,
//           child: Text(
//             nameButton,
//             style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.italic),
//           ),
//         ),
//       ),
//     );
//
// Widget defaultName({
//   required double width,
//   @required IconData? prefix,
//   IconData? suffix,
//   required Function onpress,
//   Function(String)? onsubmited,
//   required String lable,
//   required TextInputType? type,
//   required TextEditingController controller,
//   @required validate,
//   onChange,
// }) =>
//     Container(
//       width: width,
//       padding: const EdgeInsets.all(20.0),
//       child: TextFormField(
//         controller: controller,
//         cursorColor: Colors.black,
//         style: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//         ),
//         decoration: InputDecoration(
//           labelText: lable,
//           suffixIcon: Icon(suffix),
//           prefixIcon: Icon(prefix),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(28.0),
//           ),
//         ),
//         keyboardType: type,
//         onFieldSubmitted: onsubmited,
//         validator: validate,
//         onChanged: onChange,
//       ),
//     );
//
// Widget defaultLogin({
//   @required onpress,
//   required String nameButtom,
//   @required double? width,
//   @required double? height,
// }) {
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       width: double.infinity,
//       color: Colors.blueAccent,
//       child: TextButton(
//         onPressed: onpress,
//         child: Text(
//           nameButtom,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 30.0,
//           ),
//         ),
//       ),
//     ),
//   );
// }
