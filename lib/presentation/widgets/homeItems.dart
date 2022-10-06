import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/home/cubit.dart';
import 'package:lavie/bussiness_logic/home/state.dart';
import 'package:lavie/presentation/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
class HomeItems extends StatelessWidget {
  const HomeItems({Key? key,  this.model, required this.size, required this.indexS}) : super(key: key);
final  model;
final Size size;
final int indexS;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              vertical: size.height / 40, horizontal: size.width / 25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.67,
            crossAxisSpacing: size.width / 40,
            mainAxisSpacing: size.height / 65,
          ),
          itemCount: model.data.length??0,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Align(
                alignment: const AlignmentDirectional(-1, 1),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 228, 228, 228),
                        offset: Offset(2, 3),
                        blurRadius: 5,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0.95),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: AppColors.brand),
                        onPressed: () {
                          cubit.addToCart(context, index);
                        },
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, -1.2),
                child: Image.network(
                  model.data[index].imageUrl == ""
                      ?"https://lavie.orangedigitalcenteregypt.com/uploads/60da9dc5-2974-45a2-bd24-7f38038d7999.jpg"
                      : "https://lavie.orangedigitalcenteregypt.com${model.data[index].imageUrl}",
                  width: 100,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.2, 0.35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.data[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    indexS == 0
                        ? Text(
                      "${model.data[index].price}" " EGP",
                      style:  TextStyle(
                        fontSize: size.width*0.035,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
                        : Text(
                      "700 EGP",
                      style:  TextStyle(
                        fontSize: size.width*0.035,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: const AlignmentDirectional(0.75, -0.2),
                  child: Row(
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
                            color: AppColors.text,
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
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ],
                  ))
            ]);
          },
        );
      },
    );
  }
}
