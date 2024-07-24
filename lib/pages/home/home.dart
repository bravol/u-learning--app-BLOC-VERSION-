import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';
import 'package:u_learning_app/pages/home/bloc/home_bloc.dart';
import 'package:u_learning_app/pages/home/bloc/home_states.dart';
import 'package:u_learning_app/pages/home/widgets/home_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15.w),
            child: CustomScrollView(
              //slivers are great in smooth scrolling
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    'Hello',
                    color: AppColors.primaryThirdElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText('Lumala Brian', top: 5),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),

                // serach bar
                SliverToBoxAdapter(
                  child: searchView(),
                ),

                //slider view
                SliverToBoxAdapter(child: slidersView(context, state)),
                //menue View
                SliverToBoxAdapter(child: menuView()),

                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(childCount: 4,
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/Image(2).png'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15.w),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  'Best Course for IT and Enginnering',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: AppColors.primaryElementText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                margin:
                                    EdgeInsets.only(left: 10.w, bottom: 5.h),
                                child: Text(
                                  'Flutter Best Course',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: AppColors.primaryForthElementText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
