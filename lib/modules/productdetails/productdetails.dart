import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/style/colors.dart';

import '../../shared/cubit/states.dart';

class ProductDetails extends StatelessWidget {
  final int id;

  const ProductDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {
        if (states is UpdateCartsItemSuccess) {
          if (!states.model!.status!) {
            showToast(state: ToastStates.ERROR, text: states.model!.message);
          } else {
            if (states.model!.message == 'تم التعديل بنجاح') {
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
        CarouselController carouselProductController = CarouselController();
        var counter = 1;
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
                      cubit.counter = 1;
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: cubit.cartsIcon(context),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 300,
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
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      backgroundBlendMode: BlendMode.darken,
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
                                      items: cubit
                                          .productDetailsModel!.data!.images!
                                          .map(
                                            (e) => Image(
                                              image: NetworkImage(
                                                e,
                                              ),
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                              filterQuality: FilterQuality.high,
                                              colorBlendMode: BlendMode.darken,
                                              color: Colors.blueAccent
                                                  .withOpacity(0.1),
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                          autoPlayInterval:
                                              const Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                              const Duration(seconds: 1),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (index, reason) {
                                            cubit.carouselProductIndexChange(
                                                index);
                                          }),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        decoration: BoxDecoration(
                                            color: HexColor("#406497")
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: cubit.productDetailsModel!
                                              .data!.images!
                                              .asMap()
                                              .entries
                                              .map((entry) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  carouselProductController
                                                      .animateToPage(entry.key),
                                              child: Container(
                                                width: 6.0,
                                                height: 6.0,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: (Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? HexColor('#406497')
                                                      : HexColor('#406497')
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
                        padding: const EdgeInsets.only(top: 290),
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
                                        cubit.productDetailsModel!.data!.name!,
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
                                      cubit.productDetailsModel!.data!.price
                                          .toString(),
                                      style: TextStyle(
                                        color: HexColor("#F99100"),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Visibility(
                                    visible: (cubit.productDetailsModel!.data!
                                                .discount ==
                                            0)
                                        ? false
                                        : true,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "جنيه",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          cubit.productDetailsModel!.data!
                                              .oldPrice
                                              .toString(),
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    )),
                                const Row(
                                  children: [
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
                                TextFieldTapRegion(
                                  child: Text(
                                    cubit.productDetailsModel!.data!
                                        .description!,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 270, start: 36),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                AppCubit.get(context).addOrDeleteFavorites(
                                    id: cubit.productDetailsModel!.data!.id!);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: Icon(
                                  Icons.favorite,
                                  color: (AppCubit.get(context).favorites[
                                          cubit.productDetailsModel!.data!.id]!)
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
                                child: Icon(Icons.share, color: defaultColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: 150,
                  padding: const EdgeInsetsDirectional.only(
                      top: 15, start: 18, end: 18, bottom: 30),
                  decoration: BoxDecoration(
                    color: defaultColor,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child: FloatingActionButton(
                                      clipBehavior: Clip.antiAlias,
                                      mini: true,
                                      backgroundColor: defaultColor,
                                      onPressed: () {
                                        cubit.increaseCounter();
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    child: FloatingActionButton(
                                      clipBehavior: Clip.antiAlias,
                                      mini: true,
                                      backgroundColor: HexColor('#406497'),
                                      onPressed: () {
                                        cubit.decreaseCounter();
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 37,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: HexColor('#707070'))),
                                      child: Center(
                                        child: Text(
                                          cubit.counter.toString(),
                                          style: GoogleFonts.lato(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: defaultColor,
                                          ),
                                          semanticsLabel:
                                              cubit.counter.toString(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Expanded(flex: 1, child: SizedBox()),
                          Text(
                            'الكمية',
                            style: GoogleFonts.lato(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          if (cubit.carts[id]! != false) {
                            print('t');
                            cubit.updateItemCarts(
                              id: cubit.carts2[id]!,
                              quantity: cubit.counter,
                            );
                          } else {
                            cubit.addOrDeleteCarts(id: id);
                            // cubit.updateItemCarts(
                            //     id: cubit.carts2[id]!, quantity: 2);
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              color: HexColor("#F99100"),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'إضافة للسلة',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
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
    );
  }
}
