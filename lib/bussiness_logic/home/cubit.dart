import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
 import 'package:lavie/data/models/allProduct_model.dart' as products;
import 'package:lavie/data/models/plants_model.dart';
import 'package:lavie/data/models/seeds_model.dart';
import 'package:lavie/data/models/tools_model.dart';
import 'package:lavie/data/remote/dio_helper.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/constants/end_points.dart';
import 'package:lavie/presentation/widgets/default_toast.dart';
import '../../data/models/user_model.dart';
import '../../presentation/constants/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int index = 2;

  changeBottomNav(val) {
    index = val;
    emit(ChangeBottomNavState());
  }

  int selectedItemHomeScreen = 0;

  void changeItemHomeScreen(int val) {
    selectedItemHomeScreen = val;
    emit(ChangeItemHomeScreenState());
  }

 products.AllProductModel? allProductModel;

  Future getAllProductData() async {
    emit(GetAllProductLoadingState());
    DioHelper.getData(url: productEndPoint, token: token).then((value) {
      allProductModel = products.AllProductModel.fromJson(value.data);
      emit(GetAllProductSuccessState());
    }).catchError((e) {
      emit(GetAllProductErrorState());
    });
  }

  ToolsModel? toolsModel;

  Future getToolsData() async {
    emit(GetToolsLoadingState());
    DioHelper.getData(url: toolsEndPoint, token: token).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      emit(GetToolsSuccessState());
    }).catchError((e) {
      emit(GetToolsErrorState());
    });
  }

  PlantsModel? plantsModel;

  Future getPlantsData() async {
    emit(GetPlantsLoadingState());
    DioHelper.getData(url: plantsEndPoint, token: token).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
      emit(GetPlantsSuccessState());
    }).catchError((e) {
      emit(GetPlantsErrorState());
    });
  }

  SeedsModel? seedsModel;

  Future getSeedsData() async {
    emit(GetSeedsLoadingState());
    DioHelper.getData(url: seedsEndPoint, token: token).then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      emit(GetSeedsSuccessState());
    }).catchError((e) {
      emit(GetSeedsErrorState());
    });
  }

  UserModel? userModel;

  Future getUserData() async {
    emit(GetUserDataLoadingState());
    DioHelper.getData(url: userEndPoint, token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(GetUserDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetUserDataErrorState());
    });
  }


   changeName({
  firstName,
    lastName
})  {
    var json = {
      "firstName": firstName,
      "lastName":lastName,
      "email": userModel!.data.email,
      "address": ""
    };
    emit(ChangeNameLoadingState());
    DioHelper.putData(url: userEndPoint,
        data: json,token: token )
        .then((value) {
      emit(ChangeNameSuccessState());
    }).catchError((e) {
      print(e.toString());

      emit(ChangeNameErrorState());
    });
  }

  double totalPrice=0;
  List<products.Data>cartProducts=[];
  productIncreaseQuantity(int index) {
  var  model=allProductModel!.data;
    if (model[index].quantity >= 1 && model[index].quantity < 10) {
      model[index].quantity=model[index].quantity+1;
      calculateTotalPrice();
    }

  emit(ProductIncreaseQuantityState());
  }
  productDecreaseQuantity(int index) {
    var model=allProductModel!.data;
    if (model[index].quantity > 1) {
      model[index].quantity = model[index].quantity - 1;
      calculateTotalPrice();
      emit(ProductDecreaseQuantityState());
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var product in cartProducts) {
      totalPrice =
          totalPrice + (product.price * product.quantity);
    }
   emit(CalculateTotalPriceState());
  }



  void addToCart(context, int index) {
    var product=allProductModel!.data;
    int productIndex = cartProducts
        .indexWhere((e) => e.productId == product[index].productId);
    if (cartProducts.isNotEmpty && productIndex != -1) {
      for (var item in cartProducts) {
        if (item.productId == cartProducts[productIndex].productId)
        {
          productIncreaseQuantity(index);
         emit(AddToCartINcSuccessState());
        }
      }
    }


    else {
      cartProducts.add(product[index]);
      calculateTotalPrice();
      buildToast(
        text: "The product is added to cart successfully",
        color: AppColors.brand,
      );

     emit(AddToCartSuccessState());
    }
  }

 /* addToCartWithId(BuildContext context, String id) {
    int productIndex = products.indexWhere((e) => e.productId == id);
    cartProducts.add(products[productIndex]);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _colorHepler.brand,
        content: const Text(
          "The product is added to cart successfully",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }*/

  void removeFromCart(int index) async {
    var product=allProductModel!.data;
    int productIndexInCart = cartProducts
        .indexWhere((e) => e.productId == product[index].productId);
    product[index].quantity = 1;
    if (cartProducts.length == 1) {
      cartProducts.clear();
    } else {
      cartProducts.removeAt(productIndexInCart);
      calculateTotalPrice();
    }
   emit(RemoveFromCartState());
  }
}
