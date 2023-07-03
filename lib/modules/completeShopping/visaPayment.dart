import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/style/colors.dart';

class VisaPayment extends StatelessWidget {
  const VisaPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        double transport = 50.0;
        if (cubit.paymentMethod == 2) {
          transport = 0;
        }
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
            padding: const EdgeInsetsDirectional.only(
              start: 25,
              end: 25,
              top: 10,
              bottom: 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Radio(
                        activeColor: defaultColor,
                        value: 2,
                        groupValue: cubit.paymentMethod,
                        onChanged: (val) {
                          cubit.changePaymentMethod2();
                        }),
                    const Spacer(),
                    Text(
                      'بطاقة الائتمان أو الخصم المباشر',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Visibility(
                  visible: (cubit.paymentMethod == 1) ? false : true,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 40,
                              child: Center(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.lato(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    keyboardAppearance: Brightness.light,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: InputDecoration(
                                        suffixIcon: Image.asset(
                                            'assets/images/icons&logos/masterCard.png'),
                                        hintTextDirection: TextDirection.rtl,
                                        // isDense: true,
                                        hintText: 'الرجاء إدخال رقم البطاقة',
                                        hintStyle: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        fillColor: Colors.transparent,
                                        prefixIcon: Icon(
                                          Icons.credit_card,
                                          color: defaultColor,
                                        ),
                                        labelStyle: GoogleFonts.lato(
                                          color: HexColor("#F99100"),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          borderSide: BorderSide(
                                            color: HexColor("#F99100"),
                                            // width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: HexColor("#F99100"),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28)),
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .symmetric(vertical: 5)),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: GoogleFonts.lato(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                            keyboardAppearance:
                                                Brightness.light,
                                            keyboardType: TextInputType.text,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            decoration: InputDecoration(
                                                // suffixIcon: Image.asset(
                                                //     'assets/images/icons&logos/masterCard.png'),
                                                hintTextDirection:
                                                    TextDirection.rtl,
                                                // isDense: true,
                                                hintText: 'الشهر / السنة',
                                                hintStyle: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                ),
                                                fillColor: Colors.transparent,
                                                prefixIcon: Icon(
                                                  Icons.calendar_today,
                                                  color: defaultColor,
                                                  weight: 50,
                                                  opticalSize: 20,
                                                ),
                                                labelStyle: GoogleFonts.lato(
                                                  color: HexColor("#F99100"),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  borderSide: BorderSide(
                                                    color: HexColor("#F99100"),
                                                    // width: 1,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  borderSide: BorderSide(
                                                    width: 1,
                                                    color: HexColor("#F99100"),
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28)),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                            .symmetric(
                                                        vertical: 5)),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: GoogleFonts.lato(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                            keyboardAppearance:
                                                Brightness.light,
                                            keyboardType: TextInputType.text,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            decoration: InputDecoration(
                                                hintTextDirection:
                                                    TextDirection.ltr,
                                                hintText: 'CVV  رقم  ',
                                                hintStyle: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                ),
                                                fillColor: Colors.transparent,
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(
                                                    'assets/images/icons&logos/cvv11.png',
                                                    fit: BoxFit.cover,
                                                    color: defaultColor,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  ),
                                                ),
                                                labelStyle: GoogleFonts.lato(
                                                  color: HexColor("#F99100"),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  borderSide: BorderSide(
                                                    color: HexColor("#F99100"),
                                                    // width: 1,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  borderSide: BorderSide(
                                                    width: 1,
                                                    color: HexColor("#F99100"),
                                                  ),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28)),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                            .symmetric(
                                                        vertical: 5)),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'هل ترغب بحفظ هذه البطاقة للتحويلات المستقبلية',
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Switch(
                                    onChanged: cubit.toggleSwitch,
                                    value: cubit.isSwitched,
                                    activeColor: Colors.blue,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: (cubit.paymentMethod == 1) ? false : true,
                  replacement: Divider(
                    color: HexColor('#D7DDE1'),
                    thickness: 3,
                  ),
                  child: const SizedBox(
                    height: 21,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Radio(
                        activeColor: defaultColor,
                        value: 1,
                        groupValue: cubit.paymentMethod,
                        onChanged: (val) {
                          cubit.changePaymentMethod1();
                        }),
                    const Spacer(),
                    Text(
                      'الدغع عند الاستلام',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                const SizedBox(
                  height: 21,
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
                                    fontWeight: FontWeight.normal,
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
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'المدفوع',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.normal,
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
                                    fontWeight: FontWeight.normal,
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
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'رسوم الشحن',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.normal,
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
                                    fontWeight: FontWeight.normal,
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
                                    fontSize: 17,
                                    color: Colors.black),
                                textDirection: TextDirection.rtl,
                              ),
                              const Spacer(),
                              Text(
                                'الإجمالى',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.normal,
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
                const Spacer(),
                InkWell(
                  onTap: () async {
                    cubit.addOrder(
                        address_id: 1,
                        payment_method: cubit.paymentMethod!,
                        use_points: true);
                    navigateAndFinish(context, const SuccessPayment());
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor("#F99100"),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'تأكيد الطلب',
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

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AddOrdersSuccess) {
          if (!state.addOrderModel.status!) {
            showToast(
                state: ToastStates.ERROR, text: state.addOrderModel.message!);
          } else {
            if (state.addOrderModel.message == 'تمت الإضافة بنجاح') {
              showToast(
                  state: ToastStates.SUCCESS,
                  text: state.addOrderModel.message!);
            } else {
              showToast(
                  state: ToastStates.ERROR, text: state.addOrderModel.message!);
            }
          }
        }
      },
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
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
                  ),
                )),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 30, bottom: 60),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor('#636363').withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        height: 154,
                        width: 154,
                        padding: const EdgeInsetsDirectional.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: defaultColor.withOpacity(0.5),
                        ),
                        child: Image.asset(
                          'assets/images/icons&logos/confirm.png',
                          fit: BoxFit.contain,
                          color: Colors.white,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'تم التأكيد',
                    style: GoogleFonts.lato(
                        color: defaultColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' لقد نجحت',
                    style: GoogleFonts.lato(
                        color: HexColor('#636363'),
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'أكملت إجراءات الدفع الخاصة بك',
                    style: GoogleFonts.lato(
                        color: HexColor('#636363'),
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      cubit.addOrder(
                          address_id: 3373,
                          payment_method: 1,
                          use_points: true);
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HexColor("#F99100"),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'تتبع طلبك',
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
          ),
        );
      },
    );
  }
}

class AddOrderModel {
  bool? status;
  String? message;

  AddOrderModel({
    this.status,
    this.message,
  });

  AddOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;

    return data;
  }
}
