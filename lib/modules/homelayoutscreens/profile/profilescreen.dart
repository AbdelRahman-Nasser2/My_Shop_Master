// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/restart.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:shop/shared/style/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: states is! UserDataLoading,
          builder: (BuildContext context) {
            List<ProfileItemModel> profileItems = [
              ProfileItemModel("بياناتى", Icon(Icons.edit), () => null),
              ProfileItemModel(
                  "منتجاتي",
                  SvgPicture.asset('assets/images/icons&logos/buy.svg'),
                  () => null),
              ProfileItemModel(
                  "بيانات المتجر",
                  SvgPicture.asset('assets/images/icons&logos/bag.svg'),
                  () => null),
              ProfileItemModel(
                  "طلباتي",
                  SvgPicture.asset(
                      'assets/images/icons&logos/ic_shopping_cart.svg'),
                  () => null),
              ProfileItemModel(
                  "إتصل بنا",
                  SvgPicture.asset('assets/images/icons&logos/multiple.svg'),
                  () => null),
              ProfileItemModel(
                  "خطط الاشتراك",
                  SvgPicture.asset('assets/images/icons&logos/money.svg'),
                  () => null),
              ProfileItemModel(
                  "سياسة البيع",
                  SvgPicture.asset('assets/images/icons&logos/privacy.svg'),
                  () => null),
              ProfileItemModel(
                  "أسئلة شائعة",
                  SvgPicture.asset('assets/images/icons&logos/help.svg'),
                  () => null),
              ProfileItemModel(
                  "تتبع طلبك",
                  SvgPicture.asset('assets/images/icons&logos/tracking.svg'),
                  () => null),
              ProfileItemModel(
                  "قم بتقييمنا",
                  SvgPicture.asset('assets/images/icons&logos/like.svg'),
                  () => null),
              ProfileItemModel(
                "تسجيل خروج",
                SvgPicture.asset('assets/images/icons&logos/logout.svg'),
                () {
                  showDialog(
                    context: context,
                    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
                    builder: (context) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1,
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 3)
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'هل تريد تسجيل الخروج؟',
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextButton(
                                          onPressed: () {
                                            CacheHelper.removeData(key: 'token')
                                                .then((value) {
                                              RestartWidget.restartApp(context);
                                            });
                                          },
                                          child: Text(
                                            'تسجيل الخروج',
                                            style: GoogleFonts.lato(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: defaultColor),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'إلغاء',
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: defaultColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ];
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(390),
                child: cubit.normalAppBar(
                  context,
                  height: 300,
                  showSearch: false,
                  addChild: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Colors.white, width: 3))),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: (cubit
                                              .profileModel!.data!.image ==
                                          'https://student.valuxapps.com/storage/uploads/users/w4yr38k4bR_1669077970.jpeg')
                                      ? NetworkImage(
                                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png')
                                      : NetworkImage(
                                          '${cubit.profileModel!.data!.image}'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: HexColor('#1E55A2'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${cubit.profileModel!.data!.name}',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${cubit.profileModel!.data!.email}',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  expectSearch: Expanded(
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/images/icons&logos/chat.svg'),
                      ],
                    ),
                  ),
                ),
              ),
              body: ListView.separated(
                padding:
                    EdgeInsets.only(top: 15, right: 5, left: 5, bottom: 20),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    profileItem(profileItems[index]),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: profileItems.length,
              ),
            );
          },
          fallback: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }

  Widget profileItem(ProfileItemModel profileItemModel) {
    return InkWell(
      onTap: profileItemModel.onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(40), right: Radius.circular(40)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: HexColor('#1E55A2')),
            Spacer(),
            Text(
              '${profileItemModel.title}',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: HexColor('#1E55A2'),
              child: profileItemModel.icon,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItemModel {
  String? title;
  Widget? icon;
  Function()? onTap;

  ProfileItemModel(this.title, this.icon, this.onTap);
}
