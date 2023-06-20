// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/category/maincategeoriesscreen.dart';
import 'package:shop/modules/showall/showall.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {
        if (states is AddOrDeleteFavoritesSuccess) {
          if (!states.model!.status!) {
            showToast(state: ToastStates.ERROR, text: states.model!.message!);
          } else {
            if (states.model!.message == 'تمت الإضافة بنجاح') {
              showToast(
                  state: ToastStates.SUCCESS, text: states.model!.message!);
            } else {
              showToast(state: ToastStates.ERROR, text: states.model!.message!);
            }
          }
        }

        if (states is DeleteCartsItemSuccess) {
          if (!states.model!.status!) {
            showToast(state: ToastStates.ERROR, text: states.model!.message!);
          } else {
            if (states.model!.message == 'تمت الإضافة بنجاح') {
              showToast(
                  state: ToastStates.SUCCESS, text: states.model!.message!);
            } else {
              showToast(state: ToastStates.ERROR, text: states.model!.message!);
            }
          }
        }
        if (states is AddOrDeleteCartsItemSuccess) {
          if (!states.model!.status!) {
            showToast(state: ToastStates.ERROR, text: states.model!.message!);
          } else {
            if (states.model!.message == 'تمت الإضافة بنجاح') {
              showToast(
                  state: ToastStates.SUCCESS, text: states.model!.message!);
            } else {
              showToast(state: ToastStates.ERROR, text: states.model!.message!);
            }
          }
        }
      },
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        List products = cubit.homeModel!.data.products;
        List banners = cubit.homeModel!.data.banners;
        List categories = cubit.categoriesModel!.data!.data;
        CarouselController carouselController = CarouselController();

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(170),
            child: Stack(
              children: [
                cubit.normalAppBar(context,
                    showSearch: true, addChild: false, height: 130),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 20, end: 20),
                    height: 100,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.passthrough,
                      clipBehavior: Clip.antiAlias,
                      children: [
                        Container(
                            margin: EdgeInsets.all(2),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer
                                    // changes position of shadow
                                    ),
                              ],
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CarouselSlider(
                              carouselController: carouselController,
                              items: banners
                                  .map(
                                    (e) => Image(
                                      image: NetworkImage(
                                        e.image,
                                      ),
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                  height: double.infinity,
                                  initialPage: 0,
                                  clipBehavior: Clip.antiAlias,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: true,
                                  enlargeCenterPage: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(minutes: 1),
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 1),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    cubit.carouselIndexChange(index);
                                  }),
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 5),
                              decoration: BoxDecoration(
                                  color: HexColor("#1E55A2").withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: banners.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.white)
                                              .withOpacity(
                                                  cubit.carouselHomeCurrent ==
                                                          entry.key
                                                      ? 1
                                                      : 0.3)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildHomeCategoryList(
                    axis: Axis.horizontal,
                    allShow_OnTap: () {
                      navigateTo(context, MainCategoryScreen());
                    },
                    type: 'التصنيفات',
                    list: categories,
                    listCount: 3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildHomeProductList(
                      type: 'أفضل العروض',
                      list: products,
                      // cartIconAdd: cubit.cartIconAdd(AppCubit.get(context).),
                      allShow_onTap: () {
                        navigateTo(context,
                            ShowAllProducts(categoryName: 'أفضل العروض'));
                        // CacheHelper.removeData(key: "token");
                        // CacheHelper.removeAllData();
                        // CacheHelper.removeData(key: "onBoarding");
                        // CacheHelper.removeData(key: "start");
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  buildHomeProductList(
                    type: 'الأكثر مبيعاً ',
                    list: products,
                    allShow_onTap: () {
                      navigateTo(context,
                          ShowAllProducts(categoryName: 'الأكثر مبيعا'));
                    },
                    // cartIconAdd: cubit.cartIconAdd(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
                    : Text(''),
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
            width: double.infinity,
            height: heightList,

            // padding: EdgeInsets.symmetric(horizontal: 5),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: axis,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => categoryItem(
                context,
                list[index],
                height: height,
                width: width,
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: sizedBoxWidth,
                height: sizedBoxHeight,
              ),
              itemCount: listCount,
            ),
          ),
        ],
      );
}
