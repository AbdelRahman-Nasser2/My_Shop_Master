import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/modules/completeShopping/visaPayment.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class CompleteShopping extends StatelessWidget {
  const CompleteShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        double transport = 50.0;
        return Scaffold(
          backgroundColor: HexColor('#F1F1F1'),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: appBarShape(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'متابعة عملية الدفع',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    Text(
                      'خيارات الشحن',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'الشحن الى عنوان التوصيل',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black),
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.location_on,
                              color: HexColor('#313131'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 5.5, bottom: 5.5, end: 30, start: 15),
                          child: Text(
                            'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات ',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                                color: HexColor('#636363')),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Divider(
                          color: HexColor('#D7DDE1'),
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: HexColor("#F99100"),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'تغيير العنوان',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    Text(
                      'ملخص الدفع',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 17, end: 7),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'جنيه',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Text(
                                '${cubit.cartsDataModel!.data!.total!}',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'المدفوع',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 17, end: 7),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'جنيه',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Text(
                                transport.toString(),
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'رسوم الشحن',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: HexColor('#D7DDE1'),
                          thickness: 3,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 17, end: 7),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'جنيه',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Text(
                                '${cubit.cartsDataModel!.data!.total! + transport}',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'الإجمالى',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, const VisaPayment());
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor("#F99100"),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
