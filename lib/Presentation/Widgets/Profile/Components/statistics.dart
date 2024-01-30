import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';

class Statistics extends StatefulWidget {
  const Statistics({
    super.key,
   
  });

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
   List<String> imagurls = [
    Assets.heartpng,
    Assets.adduser,
    Assets.button2,
    Assets.button3
  ];
   
  List<String> prices = [
    '300',
     '222', '189', '145'
  ];

  List<String> headings = ['Total likes ', 'New friens', 'New posts', 'New comments'];
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 400.w,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 16 / 8,
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(left:5.sp, right: 5.sp ),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
              color: AppColors.secondaryColor,
              
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical:10.sp),
                child: Row(
                  children: [
                    SizedBox(width: 10.w,), 
                    Column(
                      
                      children: [
                        Image.asset(
                           imagurls[index], 
                           height: 30, width: 30,
                           ),
                      ],
                    ),
                        SizedBox(width: 7.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     
                      children: [
                        Text(prices[index],
                            style: Styles.plusJakartaSans(context, fontWeight: FontWeight.w400,
                                color: AppColors.whiteColor)),
                        SizedBox(height: 8.h,),
                        Text(
                          headings[index],
                          style: Styles.plusJakartaSans(
                            context,
                            fontWeight: FontWeight.w300,
                            color: AppColors.whiteColor,
                            fontSize: 12,
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
