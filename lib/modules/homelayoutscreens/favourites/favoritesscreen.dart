import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/favoritesmodel.dart';
import 'package:shop/modules/productdetails/productdetails.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/components/constant.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: cubit.normalAppBar(context,
                  showSearch: true, addChild: false, height: 130),
            ),
            body: ConditionalBuilder(
              condition: states is! FavoritesDataLoading,
              builder: (BuildContext context) {
                return Center(
                  child: GridView.builder(
                    physics: physics,
                    shrinkWrap: true,
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 16, vertical: 24),
                    // padding: const EdgeInsets.only(
                    //     top: 24, bottom: 24, right: 16, left: 30),
                    itemCount: cubit.favoritesModel!.data!.data!.length,
                    clipBehavior: Clip.antiAlias,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 220,
                            mainAxisSpacing: 40,
                            crossAxisSpacing: 40,
                            childAspectRatio: 1),
                    itemBuilder: (context, index) => favoriteItem(
                        context,
                        cubit.favoritesModel!.data!.data![index],
                        cubit.cartIconAdd(cubit.favoritesModel!.data!
                            .data![index].product!.id), onFavTap: () {
                      cubit.addOrDeleteFavorites(
                          id: cubit
                              .favoritesModel!.data!.data![index].product!.id!);
                    }),
                  ),
                );
              },
              fallback: (BuildContext context) {
                return const Center(child: CircularProgressIndicator());
              },
            ));
      },
    );
  }

  Widget favoriteItem(
    context,
    FavoritesData model,
    Widget? cartIconAdd, {
    Function()? onTap,
    Function()? onFavTap,
  }) {
    return SizedBox(
      // width: 130,
      // height: 150,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              AppCubit.get(context)
                  .getProductDataById(model.product!.id, context);
              navigateTo(context, ProductDetails(model.product!.id!));
            },
            child: Container(
              // height: 186,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(model.product!.image!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        model.product!.name!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.visible,
                      ),
                      Row(
                        children: [
                          cartIconAdd!,
                          const Spacer(),
                          const Text(
                            "جنيه",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            model.product!.price!.toString(),
                            style: TextStyle(
                              color: HexColor("#F99100"),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Visibility(
                        visible: model.product!.discount != 0 ? true : false,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "جنيه",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              model.product!.oldPrice.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onFavTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(Icons.favorite,
                      color:
                          // (AppCubit.get(context).favorites[model.product!.id!]!) ?
                          Colors.red
                      // : HexColor("#B8B8B8"),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
