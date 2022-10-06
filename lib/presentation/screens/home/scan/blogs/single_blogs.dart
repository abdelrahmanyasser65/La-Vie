import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/scan/cubit.dart';
import 'package:lavie/bussiness_logic/scan/state.dart';
import 'package:sizer/sizer.dart';

class SingleBlogScreen extends StatelessWidget {
  const SingleBlogScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit,ScanState>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=BlocProvider.of<ScanCubit>(context);
      var model=cubit.oneBlog!.first;
      return
        Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cubit.oneBlog!.first.imageUrl.isEmpty?
              "https://lavie.orangedigitalcenteregypt.com/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png":
              "https://lavie.orangedigitalcenteregypt.com${model.imageUrl}",
              height: 50.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, left: 20, right: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    model.name,
                    style:const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      model.description,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
    );
  }
}
