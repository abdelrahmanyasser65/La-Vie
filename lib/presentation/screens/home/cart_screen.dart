import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:lavie/presentation/widgets/cart/empty_card.dart';
import 'package:lavie/presentation/widgets/default_button.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        var model=cubit.cartProducts;
        return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              toolbarHeight: 10.h,
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(
                    top: 2.h
                ),
                child: DefaultText(
                  text: "My Cart",
                  fontSize: 19.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 2.h,
                      left: 5.w
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 4.h,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            body:cubit.cartProducts.isEmpty?
                EmptyCard():
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,vertical: 2.h
                  ),
                  child: ListView(

                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                       itemCount:cubit.cartProducts.length,
                        itemBuilder: (context,index){
                         return  Container(
                           height:17.h ,
                           width: double.infinity,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(14),
                             boxShadow: const [
                               BoxShadow(
                                 color: Color.fromARGB(255, 228, 228, 230),
                                 offset: Offset(3, 4),
                                 blurRadius: 15,
                                 spreadRadius: 0.1,
                               ),
                             ],
                           ),
                           padding: EdgeInsets.symmetric(
                               horizontal: 5.w,
                               vertical: 2.h
                           ),
                           child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Image.network(
                                 model[index].imageUrl.isEmpty?
                                   "https://lavie.orangedigitalcenteregypt.com/uploads/60da9dc5-2974-45a2-bd24-7f38038d7999.jpg"
                               :"https://lavie.orangedigitalcenteregypt.com${model[index].imageUrl}",
                               ),
                               SizedBox(width: 3.w,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     width:32.w,
                                     child: Text(
                                         model[index].name,
                                         overflow: TextOverflow.ellipsis,
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14.sp,
                                         ),
                                     ),
                                   ),
                                   SizedBox(height: 2.h,),
                                   DefaultText(
                                     text: "${model[index].price} EGP",
                                     color: AppColors.brand,
                                     fontWeight: FontWeight.bold,

                                   ),
                                   SizedBox(height: 3.h,),
                                   Row(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       InkWell(
                                         onTap: () {
                                           cubit.productDecreaseQuantity(index);
                                         },
                                         child: Container(
                                           padding: const EdgeInsets.all(2),
                                           decoration: BoxDecoration(
                                             color: const Color.fromRGBO(245, 245, 245, 1),
                                             borderRadius: BorderRadius.circular(3),
                                           ),
                                           child: Icon(
                                             Icons.remove,
                                             size: 2.5.h,
                                             color: AppColors.brand,
                                           ),
                                         ),
                                       ),
                                       const SizedBox(width: 5),
                                       Text(
                                         "${cubit.allProductModel!.data[index].quantity}" ,
                                         style:const  TextStyle(fontWeight: FontWeight.bold),
                                       ),
                                       const SizedBox(width: 5),
                                       InkWell(
                                         onTap: () {
                                           cubit.productIncreaseQuantity(index);
                                           print(cubit.totalPrice);
                                         },
                                         child: Container(
                                           padding: const EdgeInsets.all(2),
                                           decoration: BoxDecoration(
                                             color: const Color.fromRGBO(245, 245, 245, 1),
                                             borderRadius: BorderRadius.circular(3),
                                           ),
                                           child: Icon(
                                             Icons.add,
                                             size: 2.5.h,
                                             color: AppColors.brand,
                                           ),
                                         ),
                                       ),
                                     ],
                                   )

                                 ],
                               ),
                               Spacer(),
                               InkWell(
                                   onTap: (){
                                     cubit.removeFromCart(index);
                                   },
                                   child: Icon(Icons.delete,color: AppColors.brand,))
                             ],
                           ),
                         );
                        },
                        separatorBuilder: (context,index){
                         return SizedBox(height: 2.h,);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 9.h
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                DefaultText(
                                  text: "Total",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,

                                ),
                               const Spacer(),
                                DefaultText(
                                  text: "${cubit.totalPrice} Egp",
                                  color: AppColors.brand,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            DefaultButton(
                                text: "Checkout",
                                textColor: AppColors.white,
                                onPressed: (){},
                                height: 6.h, width: double.infinity,
                                radius: 10, fontSize: 15.sp,
                                primary: AppColors.brand)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

        );
      },
    );
  }
}
