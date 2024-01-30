import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';

class TodayActivity extends StatelessWidget {
  List<String> imageurls = [Assets.heartpng, Assets.button2, Assets.button3];
  List<double> progress = [0.8, 0.6, 0.3];
  List<int> amounts = [300, 200, 100];

  TodayActivity();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.secondaryColor,
          margin: EdgeInsets.all(10.sp),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.secondaryColor,
            ),
            width: 110.w,
            padding: EdgeInsets.all(16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 100,
                      child: CircularProgressIndicator(
                        value: progress[index],
                        strokeWidth: 6.w,
                        backgroundColor: AppColors.whiteColor,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Image.asset(
                      imageurls[index],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  amounts[index].toString(),
                  style:
                      TextStyle(fontSize: 16.sp, color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
