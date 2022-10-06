import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/bussiness_logic/feed/state.dart';
import 'package:lavie/data/models/allforums_model.dart';
import 'package:lavie/data/models/myforums_model.dart';
import 'package:lavie/data/remote/dio_helper.dart';
import 'package:lavie/presentation/constants/constants.dart';
import 'package:lavie/presentation/constants/end_points.dart';

class FeedCubit extends Cubit<FeedState>{
  FeedCubit():super(FeedInitialState());
  static FeedCubit get(context) => BlocProvider.of(context);
  int selectedItemHomeScreen = 0;

  void changeItemHomeScreen(int val) {
    selectedItemHomeScreen = val;
    emit(ChangeItemFeedScreenState());
  }
  ForumsModel ?forumsModel;
  getMyForums() {
   emit(GetMyFeedLoadingState());
    DioHelper.getData(
      url: myForumsEndPoint,
      token: token,
    ).then((value) async {
      forumsModel = ForumsModel.fromJson(value.data);
      print(forumsModel.toString());
      emit(GetMyFeedSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetMyFeedErrorState());
    });
  }

  AllForumsModel?allForumsModel;
  getAllForums() {
    emit(GetAllFeedLoadingState());
    DioHelper.getData(
      url: allForumsEndPoint,
      token: token,
    ).then((value) async {
      allForumsModel=AllForumsModel.fromJson(value.data);
      emit(GetAllFeedSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(GetAllFeedErrorState());
    });
  }

  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
  File?postImage;
  var picker=ImagePicker();
  Future tackPostImage()async{
    final pickedFile=await
    picker.pickImage(source: ImageSource.camera);
    if(pickedFile!=null){
      postImage=File(pickedFile.path);
      emit(GetImagePostSuccessState());
    }else{
      print("No image selected");
      emit(GetImagePostErrorState());
    }

  }
  Future getPostImage()async{
    final pickedFile=await
    picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      postImage=File(pickedFile.path);
      emit(GetImagePostSuccessState());
    }else{
      print("No image selected");
      emit(GetImagePostErrorState());
    }

  }
  void removePostImage(){
    postImage=null;
    emit(RemovePostImageState());
  }
  postNewPost()async{

    Uint8List imagebytes = await postImage!.readAsBytes(); //convert to bytes
    String base64string = base64Encode(imagebytes); //convert bytes to base64 string


    var json={
      "title": titleController.text,
      "description": descriptionController.text,
      "imageBase64": "data:image/png;base64,$base64string",
    };
    print("data:image/png;base64,$base64string");
  emit(CreatePostLoadingState());
  DioHelper.postData(
      url: postEndPoint,
      data: json,
      token: token
  ).then((value) {
    emit(CreatePostSuccessState());
  }).catchError((e){
    print(e.toString());
    emit(CreatePostErrorState());
  });
  }

}