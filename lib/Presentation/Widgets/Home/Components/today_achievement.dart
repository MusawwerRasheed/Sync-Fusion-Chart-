import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';

class TodayAchievement extends StatefulWidget {
  const TodayAchievement({super.key});

  @override
  State<TodayAchievement> createState() => _TodayAchievementState();
}

class _TodayAchievementState extends State<TodayAchievement> {
  List<String> imagurls = [Assets.confettipng, Assets.friendshippng];
  List<String> imagurlsright = [Assets.coin1png, Assets.coin2png];
  List<String> prices = ['500', 'Refer a friend'];
  List<String> secondheadings = ['Points earned', 'Earn 50 for every referal'];
  List<String> buttontexts = ['claim my points', 'Get Now'];

  @override
  Widget build(BuildContext context) {

    return 
    
    ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
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
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(imagurls[index]),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prices[index],
                        style: Styles.plusJakartaSans(context,
                            color: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      secondheadings[index],
                      style: Styles.plusJakartaSans(
                        context,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text(buttontexts[index]))
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  children: [
                    Image.asset(imagurlsright[index]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    
  }
}
