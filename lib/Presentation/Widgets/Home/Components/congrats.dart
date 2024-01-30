import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Card(
        color: AppColors.secondaryColor,
        child: SizedBox(
          height: 130.h,
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 115.h,
                      width: 115.w,
                      child: Image.asset(Assets.achievement))
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'congrats',
                    style: Styles.plusJakartaSans(context,
                        fontSize: 10.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'You did it! \nHigh Points all \naround!',
                    style: Styles.plusJakartaSans(
                      context,
                      fontSize: 19.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '10,000 likes done!',
                    style: Styles.plusJakartaSans(context,
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
