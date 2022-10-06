import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/search/cubit.dart';
import 'package:lavie/bussiness_logic/search/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/search/empty_search.dart';
import 'package:lavie/presentation/widgets/search/recentsearch.dart';
import 'package:lavie/presentation/widgets/search/searchitems.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/search/buildsearch.dart';

class SearchScreen extends StatefulWidget {
 const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    SearchCubit().getRecentSearchItems();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<SearchCubit>(context);
        bool isEmpty=cubit.searchChange.isEmpty;

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            actions:[
              Container(
                width: 100.w,
                padding: EdgeInsets.only(
                  left: 5.w,
                    right: 5.w,
                    top: 2.h, bottom: 2.h),
                child: buildSearch(
                    searchC: cubit.searchController,
                    onFieldSubmitted: (val) {
                      cubit.onSubmitSearchText(val);
                      cubit.saveSearchItems(val);
                       cubit.getRecentSearchItems();
                    },
                    onChange: (val) {
                      cubit.changeSearchText(val);
                      // cubit.search(val);
                    }),
              )
            ],
            leading: Container(),
            backgroundColor: AppColors.white,
            elevation: 0,
            toolbarHeight: 10.h,

          ),
          body:
              isEmpty?
                  buildRecentSearch(
                    cubit

                  ):
          (
              cubit.modelItems.isNotEmpty?
                   SearchItems(cubit: cubit):
              buildEmptySearch(cubit: cubit)
          ),
        );
      },
    );
  }
}
