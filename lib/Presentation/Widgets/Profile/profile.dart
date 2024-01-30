import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';
import 'package:uitask/Presentation/Widgets/Home/home.dart';
import 'package:uitask/Presentation/Widgets/Profile/Components/EngagmentProgress/engagement_progress.dart';
import 'package:uitask/Presentation/Widgets/Profile/Components/statistics.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        actions: [
          SvgPicture.asset(Assets.setting),
          const SizedBox(
            width: 15,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.union),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Account',
                  style: Styles.plusJakartaSans(context,
                      fontSize: 13.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 90),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(children: [
                        Image.asset(Assets.person),
                        Positioned(
                            top: 60.h,
                            left: 70.w,
                            child: Image.asset(Assets.coinstar)),
                      ]),
                      Text(
                        'Andrew Ainsley',
                        style: Styles.plusJakartaSans(context,
                            fontSize: 17.sp, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'joined since 20 jun 2020',
                        style: Styles.plusJakartaSans(context,
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                          side: BorderSide(
                              color: AppColors.whiteColor, width: 1.w),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.pen),
                            Padding(
                              padding: EdgeInsets.only(left: 5.sp),
                              child: Text(
                                'Edit profile    ',
                                style: Styles.plusJakartaSans(context,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.dollar),
                            Padding(
                              padding: EdgeInsets.only(left: 5.sp),
                              child: Text(
                                'Claim my points',
                                style: Styles.plusJakartaSans(context,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondaryColor),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 5.sp,
                        left: 15.sp,
                      ),
                      child: Text(
                        'Your Statistics',
                        style: Styles.plusJakartaSans(
                          context,
                          fontSize: 17,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Image.asset(Assets.stats),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Statistics(),
                Text(
                  'Your Engagement Progress',
                  style: Styles.plusJakartaSans(context,
                      color: AppColors.whiteColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20.h,),
EngagementProgress(), 
                
              ],
            ),
          ))
        ],
      ),
    );
  }
}
