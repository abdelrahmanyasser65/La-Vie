import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/search/state.dart';
import 'package:lavie/data/local/cache_helper.dart';

import '../../data/models/allProduct_model.dart';
class SearchCubit extends Cubit<SearchState>{
  SearchCubit():super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  final searchController=TextEditingController();
  String searchText="";
  String searchChange="";
  onSubmitSearchText(val){
    searchText=val;
    emit(OnSubmitSearchTextState());
  }
  changeSearchText(val){
    searchChange=val;
    emit(ChangeSearchTextState());
  }

  List<String>recentItems=[];
  final homeModel=HomeCubit().allProductModel;
  List<Data>modelItems=[];

  search(String text){
    modelItems.clear();
    for(int i=0;i<homeModel!.data.length;i++){
      if(homeModel!.data[i].name.startsWith(text)||
      homeModel!.data[i].name.toLowerCase().startsWith(text)||
          homeModel!.data[i].name.toUpperCase().startsWith(text)
      ){
        modelItems.add(homeModel!.data[i]);
      }
      print(modelItems);
      emit(GetItemsSearchState());
    }
  }

  saveSearchItems(String value)async{
    CachHelper.put(key: 'recentItems', value: value);
    emit(SaveSearchItemState());
  }

  Future getRecentSearchItems()async{
    recentItems=CachHelper.get(key: "recentItems")??[];
    emit(GetRecentSearchItemsState());
  }

  removeRecentItem(String value)async{
    getRecentSearchItems();
    recentItems.removeWhere((element) => element==value);
    await CachHelper.put(key: "searchItem", value: recentItems);
    getRecentSearchItems();
    emit(RemoveRecentItemState());
  }
  removeFromListModelItems(String id) {
    modelItems.removeWhere((element) => element.productId == id);
   emit(RemoveFromListModelItemsState());
  }
}