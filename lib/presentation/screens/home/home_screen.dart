import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/images.dart';
import 'package:lavie/presentation/screens/home/cart_screen.dart';
import 'package:lavie/presentation/screens/search/search_screen.dart';
import 'package:lavie/presentation/widgets/buildselctet_itemshome.dart';
import 'package:lavie/presentation/widgets/default_image.dart';
import 'package:lavie/presentation/widgets/homeItems.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:lavie/presentation/widgets/retery.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
           backgroundColor: AppColors.white,
            body: (
            cubit.allProductModel ==null||
                cubit.plantsModel==null||
                cubit.seedsModel==null||
                cubit.toolsModel==null||
                cubit.userModel==null
            )
                ? const Center(child: CircularProgressIndicator())
                : ((state is GetAllProductErrorState ||
                            state is GetToolsErrorState ||
                state is GetPlantsErrorState ||
                state is GetSeedsErrorState||
            state is GetUserDataErrorState)
                    ? Center(
                        child: RETRY(
                          function: (){
                            cubit.getAllProductData();
                            cubit.getPlantsData();
                            cubit.getSeedsData();
                            cubit.getToolsData();
                            cubit.getUserData();
                          },
                          size: size,
                        ))
                    :Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 13),
                  child: Center(
                    child: DefaultImage(
                      image: logo,
                      height: size.height / 17,
                      width: size.width / 17,
                    ),
                  ),
                ),
                Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                NavigetorApp.navigatorTo(context,const SearchScreen());
                              },
                              child: Container(
                                width: size.width / 1.3,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color:
                                    Colors.black.withOpacity(0.04)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20,
                                    ),
                                    SvgPicture.asset(search),
                                    SizedBox(
                                      width: size.width / 30,
                                    ),
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.text),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 40,
                            ),
                            InkWell(
                              onTap: (){
                                NavigetorApp.navigatorTo(context,CartScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: AppColors.brand,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: SvgPicture.asset(
                                  homeCart,
                                  height: size.height / 25,
                                  width: size.width / 25,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height / 35,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.changeItemHomeScreen(0);
                              },
                              child: selectedItemsHome(
                                text: 'All',
                                select:
                                cubit.selectedItemHomeScreen == 0,
                                height: size.height / 23,
                                size: size,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                cubit.changeItemHomeScreen(1);
                              },
                              child: selectedItemsHome(
                                text: 'Plants',
                                select:
                                cubit.selectedItemHomeScreen == 1,
                                height: size.height / 23,
                                size: size,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                cubit.changeItemHomeScreen(2);
                              },
                              child: selectedItemsHome(
                                text: 'Seeds',
                                select:
                                cubit.selectedItemHomeScreen == 2,
                                height: size.height / 23,
                                size: size,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                cubit.changeItemHomeScreen(3);
                              },
                              child: selectedItemsHome(
                                  height: size.height / 23,
                                  text: 'Tools',
                                  select:
                                  cubit.selectedItemHomeScreen ==
                                      3,
                                  size: size),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                  child: cubit.selectedItemHomeScreen == 0
                      ? HomeItems(
                    size: size,
                    indexS: 0,
                    model: cubit.allProductModel,

                  )
                      : (cubit.selectedItemHomeScreen == 1
                      ? HomeItems(
                    model: cubit.plantsModel,
                    size: size,
                    indexS: 1,
                  )
                      : (cubit.selectedItemHomeScreen == 2
                      ? HomeItems(
                    model: cubit.seedsModel,
                    size: size,
                    indexS: 2,
                  )
                      : HomeItems(
                    model: cubit.toolsModel,
                    indexS: 3,
                    size: size,
                  ))),
                ),
              ],
            )



            )
        );
      },
    );
  }
}
