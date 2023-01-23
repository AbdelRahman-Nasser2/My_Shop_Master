import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/style/colors.dart';

import '../../shared/cubit/states.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  const ProductDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getProductDataById(id),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          CarouselController carouselProductController = CarouselController();

          return ConditionalBuilder(
            condition: states is! ProductGetDataLoading,
            builder: (BuildContext context) {
              return SafeArea(
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: HexColor('#1E55A2'),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 10),
                        child: cubit.cartsIcon(),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 380,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.1),
                                    backgroundBlendMode: BlendMode.darken,
                                  ),
                                  // padding: const EdgeInsetsDirectional.only(
                                  //     top: 15, bottom: 15),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 380,
                                          width: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent
                                                .withOpacity(0.1),
                                            backgroundBlendMode:
                                                BlendMode.darken,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  blurStyle: BlurStyle.outer
                                                  // changes position of shadow
                                                  ),
                                            ],
                                            // color: Colors.red,
                                            // borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: CarouselSlider(
                                            carouselController:
                                                carouselProductController,
                                            items: cubit.productDetailsModel!
                                                .data!.images!
                                                .map(
                                                  (e) => Image(
                                                    image: NetworkImage(
                                                      e,
                                                    ),
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    colorBlendMode:
                                                        BlendMode.darken,
                                                    color: Colors.blueAccent
                                                        .withOpacity(0.1),
                                                    loadingBuilder: (BuildContext context, Widget child,
                                                        ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return child;
                                                      }
                                                      return Center(
                                                        child: CircularProgressIndicator(
                                                          value: loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                              loadingProgress.expectedTotalBytes!
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
                                                autoPlayInterval:
                                                    const Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    const Duration(seconds: 1),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                onPageChanged: (index, reason) {
                                                  cubit
                                                      .carouselProductIndexChange(
                                                          index);
                                                }),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              decoration: BoxDecoration(
                                                  color: HexColor("#406497")
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: cubit
                                                    .productDetailsModel!
                                                    .data!
                                                    .images!
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  return GestureDetector(
                                                    onTap: () =>
                                                        carouselProductController
                                                            .animateToPage(
                                                                entry.key),
                                                    child: Container(
                                                      width: 6.0,
                                                      height: 6.0,
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4.0,
                                                          horizontal: 4.0),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? HexColor(
                                                                '#406497')
                                                            : HexColor(
                                                                    '#406497')
                                                                .withOpacity(
                                                                    cubit.carouselProductCurrent ==
                                                                            entry.key
                                                                        ? 1
                                                                        : 0.6)),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 370),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Spacer(),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              cubit.productDetailsModel!.data!
                                                  .name!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.start,
                                              textDirection: TextDirection.rtl,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          const Text(
                                            "جنيه",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            cubit.productDetailsModel!.data!
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                              color: HexColor("#F99100"),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                      (cubit.productDetailsModel!.data!
                                                  .discount ==
                                              0)
                                          ? const SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  "جنيه",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  cubit.productDetailsModel!
                                                      .data!.oldPrice
                                                      .toString(),
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                      Row(
                                        children: const [
                                          Spacer(),
                                          Text(
                                            "الوصف",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        cubit.productDetailsModel!.data!
                                            .description!,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                        textAlign: TextAlign.start,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 350, start: 36),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 18,
                                      child: Icon(
                                        Icons.favorite,
                                        color: (cubit.productDetailsModel!.data!
                                                    .inFavorites !=
                                                false)
                                            ? Colors.red
                                            : HexColor("#B8B8B8"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 18,
                                      child: Icon(Icons.share,
                                          color: defaultcolor),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Container(
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator()));
            },
          );
        },
      ),
    );
  }
}
