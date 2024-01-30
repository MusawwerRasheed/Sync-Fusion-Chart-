import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uitask/Data/DataSource/Resources/assets.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';
import '../Home/home.dart';
import '../Profile/profile.dart';
import 'Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int? initialPage;
  const BottomNavigationScreen({super.key, this.initialPage});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BottomNotifier.bottomNavigationNotifier.value = 0;
    });
    BottomNotifier.bottomPageController =
        PageController(initialPage: widget.initialPage ?? 0);

    BottomNotifier.checkExitTimes.value = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (BottomNotifier.bottomPageController!.page != 0) {
          BottomNotifier.bottomNavigationNotifier.value = 0;
          BottomNotifier.checkExitTimes.value = 2;
          BottomNotifier.bottomPageController!.jumpToPage(0);
        }

        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
          body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: PageView(
              controller: BottomNotifier.bottomPageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (x) {
                print(x);
                BottomNotifier.bottomNavigationNotifier.value = x;
              },
              children: const [
                Home(),
                SizedBox(),
                SizedBox(),
                Profile(),
              ],
            ),
          ),
floatingActionButton: ClipRRect(
  borderRadius: BorderRadius.circular(75.r),
  child: Container(
    color: AppColors.secondaryColor,
    margin: EdgeInsets.symmetric(horizontal: 2),
    width: MediaQuery.sizeOf(context).width,
     
            
              child: BottomAppBar(
                color: Colors.transparent,
                child: ValueListenableBuilder(
                  builder: (context, state, dd) {
                    return Row(
                       
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        
                        GestureDetector(
                          onTap: () {
                            if (state != 0) {
                              BottomNotifier.bottomPageController!.jumpToPage(0);
                              BottomNotifier.bottomNavigationNotifier.value = 0;
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                state == 0 ? Assets.homesmile : Assets.homesmile,
                              ),
                           
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
              
                     
                        GestureDetector(
                          onTap: () {
                            if (state != 1) {
                              BottomNotifier.bottomPageController!.jumpToPage(1);
                              BottomNotifier.bottomNavigationNotifier.value = 1;
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                  state == 1 ? Assets.giftpng: Assets.giftpng),
                              
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
               
                        GestureDetector(
                          onTap: () {
                            if (state != 2) {
                              BottomNotifier.bottomPageController!.jumpToPage(2);
                              BottomNotifier.bottomNavigationNotifier.value = 2;
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                  state == 2 ? Assets.bagSmilepng : Assets.bagSmilepng),
                             
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
              
                    
                        GestureDetector(
                          onTap: () {
                            if (state != 3) {
                              BottomNotifier.bottomPageController!.jumpToPage(3);
                              BottomNotifier.bottomNavigationNotifier.value = 3;
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                  state == 3 ? Assets.user : Assets.user),
                              
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  valueListenable: BottomNotifier.bottomNavigationNotifier,
                ),
              ),
            ),
),


          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          ),

    );
  }
}
