import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../../../../Style/const.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Section1(), const Section2()],
          ),
          // Positioned(
          //   //  top: dHeight!*0.45,
          //
          //     child: Text('Integrated Platform',
          //       style: header2.copyWith(color: bColor,fontSize: 23),
          //     ))
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: dHeight! * 0.07, left: 17, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          //   Text('Welcome!',style: header1.copyWith(fontSize: 35),),
          const SizedBox(height: 10),
          Text(
            'Start login with your company code & key provided during product purchase',
            style: header2.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),

          height10,

          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: MaterialButton(
              onPressed: () {
                Get.toNamed(Routes.COMPANY_LOGIN);
              },
              minWidth: dWidth,
              height: dHeight! * 0.075,
              color: bColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Start',
                style: wheader1,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  Section1({Key? key}) : super(key: key);
  WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      //width: ,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Image.asset(
                controller.images[index],
                height: 49.h,
              ),
              Text(
                controller.names[index],
                style: header17,
              )
            ],
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: bColor,
            color: const Color.fromRGBO(171, 171, 171, 1),
            space: 5,
          ),
        ),
        duration: kDefaultAutoplayTransactionDuration,
        //control: SwiperControl(),
      ),
    );
  }
}
