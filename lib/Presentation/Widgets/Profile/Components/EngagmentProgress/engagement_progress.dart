import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitask/Data/DataSource/Resources/color.dart';
import 'package:uitask/Data/DataSource/Resources/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EngagementProgress extends StatefulWidget {
  const EngagementProgress({Key? key}) : super(key: key);

  @override
  State<EngagementProgress> createState() => _EngagementProgressState();
}

class _EngagementProgressState extends State<EngagementProgress>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<int> _currentIndexNotifier;

    List<Map<String, dynamic>> dailyData = List.generate(24, (index) {
    return {
      'day': DateTime(2024, 1, 1, index),
      'likes': Random().nextInt(100),
    };
  });

  List<Map<String, dynamic>> monthlyData = List.generate(30, (index) {
    return {
      'day': DateTime(2024, 1, index + 1),
      'likes': Random().nextInt(1000),
    };
  });

  List<Map<String, dynamic>> yearlyData = List.generate(12, (index) {
    return {
      'day': DateTime(2024, index + 1, 1),
      'likes': Random().nextInt(5000),
    };
  });

  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _currentIndexNotifier = ValueNotifier<int>(0);

    // _currentIndexNotifier.addListener(() {
    //   _tabController.index = _currentIndexNotifier.value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildTab('Daily', 0),
            _buildTab('Monthly', 1),
            _buildTab('Yearly', 2),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        TabBar(
          labelPadding: EdgeInsets.symmetric(horizontal: 1.sp),
          indicatorColor: AppColors.whiteColor,
          controller: _tabController,
          tabs: [
            Text(
              'Likes',
              style: Styles.plusJakartaSans(context,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 13),
            ),
            Text(
              'Friends',
              style: Styles.plusJakartaSans(context,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 13),
            ),
            Text(
              'Posts',
              style: Styles.plusJakartaSans(context,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 13),
            ),
            Text(
              'Comments',
              style: Styles.plusJakartaSans(context,
                  color: AppColors.whiteColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
          onTap: _onTabPressed,
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIndexNotifier,
          builder: (context, currentIndex, _) {
            List<Map<String, dynamic>> dataToShow;

            switch (currentIndex) {
              case 0:
                dataToShow = dailyData;
                break;
              case 1:
                dataToShow = monthlyData;
                break;
              case 2:
                dataToShow = yearlyData;
                break;
              case 3:
                dataToShow = [];
                break;
              default:
                dataToShow = monthlyData;
            }

            return Container(
              width: 400.w,
              height: 300.h,
              child: Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      height: 300,
                      child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index) {
                          _currentIndexNotifier.value = index;
                        },
                        itemBuilder: (context, index) {
                          return _buildChart(dataToShow, 'likes', 'Likes');
                        },
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          'Friends',
                          style: Styles.plusJakartaSans(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Posts',
                          style: Styles.plusJakartaSans(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                      child: Center(
                        child: Text(
                          'Comments',
                          style: Styles.plusJakartaSans(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

 Widget _buildTab(String text, int index) {
  return Expanded(
    child: InkWell(
      onTap: () {
        setState(() {
          _currentIndexNotifier.value = index;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),  
        child: Container(
          decoration: BoxDecoration(
            color: _currentIndexNotifier.value == index
                ? Colors.blue
                : AppColors.secondaryColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

  

  Widget _buildChart(
      List<Map<String, dynamic>> data, String seriesKey, String seriesName) {
    return Container(
      width: 400.w,
      height: 300.h,
      child: SfCartesianChart(
      
        primaryXAxis: const DateTimeAxis(
          majorGridLines: MajorGridLines(width: 0),
          interval: 1,
        ),
        primaryYAxis: const NumericAxis(
          majorGridLines: MajorGridLines(width: 0.5),
        ),
        series: <CartesianSeries>[
          ColumnSeries<Map<String, dynamic>, DateTime>(
            dataSource: data,
            xValueMapper: (Map<String, dynamic> data, _) => data['day'],
            yValueMapper: (Map<String, dynamic> data, _) => data[seriesKey],
            name: seriesName,
            color:AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ],
        legend: Legend(isVisible:false, position: LegendPosition.bottom),
        borderWidth: 0.1,
        borderColor: Colors.white,
      ),
    );
  }

  // Color _getSeriesColor(String seriesKey) {
     
  //   return AppColors.whiteColor;
  // }

  void _onTabPressed(int index) {
    _currentIndexNotifier.value = index;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }
}
