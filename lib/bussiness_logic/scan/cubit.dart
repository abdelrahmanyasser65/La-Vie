import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/scan/state.dart';
import 'package:lavie/data/remote/dio_helper.dart';
import 'package:lavie/presentation/constants/constants.dart';
import 'package:lavie/presentation/constants/end_points.dart';
import 'package:lavie/presentation/screens/home/scan/scan_details_screen.dart';

import '../../data/models/blogs_screen.dart';
import '../../presentation/widgets/navigetor.dart';

class ScanCubit extends Cubit<ScanState>{
  ScanCubit():super(InitialScanState());
  static ScanCubit get(context) => BlocProvider.of(context);

  BlogsModel ?blogsModel;
  Iterable<Plants>? oneBlog;
  getAllBlogs(context) {
    emit(GetAllBlogLoadingState());
    DioHelper.getData(
      url: blogsEndPoint,
     token: token,
    ).then((value) async {
      blogsModel=BlogsModel.fromJson(value.data);
      NavigetorApp.navigatorTo(context, ScanDetails());
      emit(GetAllBlogSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllBlogErrorState());
    });
  }
  getOneBlog(String id) {
    var item = blogsModel!.data.plants.where((item) => item.plantId == id);
    oneBlog = item;
    print('-------------------------------');
    emit(GetOneBlogSuccessState());
  }
}
