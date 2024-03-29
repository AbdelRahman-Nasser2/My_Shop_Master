import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/CategoryProductsModel.dart';
import 'package:shop/modules/productdetails/productdetails.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/components/constant.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class CategoryProducts extends StatelessWidget {
  final String categoryName;

  const CategoryProducts({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: cubit.normalAppBar(
              context,
              showSearch: true,
              addChild: true,
              height: 140,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: states is! CategoryProductsGetDataLoading,
            builder: (BuildContext context) {
              return
                  //   GridView.custom(
                  //   physics: physics,
                  //                 shrinkWrap: true,
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 24, horizontal: 16),
                  //                 clipBehavior: Clip.antiAlias,
                  //   gridDelegate: SliverWovenGridDelegate.count(
                  //     crossAxisCount: 2,
                  //     mainAxisSpacing: 16,
                  //     crossAxisSpacing:0,
                  //     pattern: [
                  //       const WovenGridTile(2/2,crossAxisRatio: 0.9),
                  //       const WovenGridTile(
                  //         5/ 6,
                  //         crossAxisRatio: 0.9,
                  //         // alignment: AlignmentDirectional.centerEnd,
                  //       ),
                  //     ],
                  //   ),
                  //   childrenDelegate: SliverChildBuilderDelegate(
                  //         (context, index) => categoryProductsItem(
                  //     context,
                  //     cubit.categoryProductsModel!.data!.data![index],
                  //
                  //     cubit.cartIconAdd(),
                  //   onFavTap: (){
                  //       cubit.addOrDeleteFavorites(id: cubit.categoryProductsModel!.data!.data![index].id!);
                  //   },
                  //   ff:  cubit.categoryProductsModel!.data!.data![index].inFavorites!,
                  // ),
                  //   ),
                  // );

                  Center(
                child: GridView.builder(
                  physics: physics,
                  shrinkWrap: true,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 24),
                  clipBehavior: Clip.antiAlias,
                  itemCount: cubit.categoryProductsModel?.data!.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) => categoryProductsItem(
                    context,
                    cubit.categoryProductsModel!.data!.data![index],
                    cubit.cartIconAdd(
                        cubit.categoryProductsModel!.data!.data![index].id),
                    onFavTap: () {
                      cubit.addOrDeleteFavorites(
                          id: cubit
                              .categoryProductsModel!.data!.data![index].id!);
                    },
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  Widget categoryProductsItem(
    context,
    ProductsData model,
    Widget? cartIconAdd, {
    Function()? onFavTap,
  }) {
    return SizedBox(
      height: (model.discount != 0) ? 180 : 150,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              AppCubit.get(context).getProductDataById(model.id, context);
              navigateTo(context, ProductDetails(model.id!));
            },
            child: Container(
              // height: 186,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
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
                          image: NetworkImage(model.image!), fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        model.name!,
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
                            model.price!.toString(),
                            style: TextStyle(
                              color: HexColor("#F99100"),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      if (model.discount != 0)
                        Row(
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
                              model.oldPrice.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
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
                onTap: () {
                  AppCubit.get(context).addOrDeleteFavorites(id: model.id!);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.favorite,
                    color: (AppCubit.get(context).favorites[model.id]!)
                        ? Colors.red
                        : HexColor("#B8B8B8"),
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
