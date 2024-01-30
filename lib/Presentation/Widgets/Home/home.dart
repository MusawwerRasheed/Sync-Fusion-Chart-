import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/strings.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uitask/Presentation/Widgets/Home/Components/congrats.dart';
import 'package:uitask/Presentation/Widgets/Home/Components/today_achievement.dart';
import 'package:uitask/Presentation/Widgets/Home/Components/today_activity.dart';
import 'package:uitask/Presentation/Widgets/Profile/profile.dart';

  

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

 final List<Widget> _pages = [
  Home(),
  Container(), 
  Container(),  
  Container(),  
  Profile(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          SvgPicture.asset(Assets.bell),
          const SizedBox(
            width: 15,
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello 👋',
              style: Styles.plusJakartaSans(context, fontSize: 12.sp),
            ),
            Text(
              AppStrings.andrew,
              style: Styles.plusJakartaSans(context,
                  fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Congrats(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.sp),
                    child: Text(
                      "Today's Activity",
                      style: Styles.plusJakartaSans(context,
                          fontSize: 19.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 180.h,
                    width: 700.w,
                    child: TodayActivity(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.sp),
                    child: Text(
                      "Today's Achievement",
                      style: Styles.plusJakartaSans(context,
                          fontSize: 19.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 350.h,
                    width: 400.w,
                    child: TodayAchievement(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    
//  bottomNavigationBar: ClipRRect(
//   borderRadius: BorderRadius.circular(16.r),
//   child: BottomNavigationBar(
//     type: BottomNavigationBarType.fixed, // Add this line
//     backgroundColor: AppColors.tertiaryColor,
//     currentIndex: _currentIndex,
//     onTap: (index) {
//       setState(() {
//         _currentIndex = index;
//       });
//     },
//     showSelectedLabels: false,
//     showUnselectedLabels: false,
//     items: [
//        BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//                 },
//                 child: SvgPicture.asset(Assets.homesmile)),
//               label: '',
//             ),
//       BottomNavigationBarItem(
//         icon: Image.asset(Assets.magnifier),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: Image.asset(Assets.giftpng),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: Image.asset(Assets.bagSmilepng),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: GestureDetector(
//           onTap: (){
//            Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => Profile(),
//   ),
// );

//           },
//           child: Image.asset(Assets.user)),
//         label: '',
//       ),
//     ],
//   ),
// ),



    );

  }
}
