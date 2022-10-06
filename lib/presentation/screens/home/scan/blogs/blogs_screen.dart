import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/bussiness_logic/scan/cubit.dart';
import 'package:lavie/bussiness_logic/scan/state.dart';
import 'package:lavie/presentation/screens/home/scan/blogs/single_blogs.dart';
import 'package:lavie/presentation/widgets/blogs_items.dart';
import 'package:lavie/presentation/widgets/default_text.dart';
import 'package:lavie/presentation/widgets/navigetor.dart';
import 'package:sizer/sizer.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit,ScanState>(
    listener: (context,state){},
    builder: (context,state){
      var cubit=BlocProvider.of<ScanCubit>(context);
      var model=cubit.blogsModel!.data.plants;
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 7.h,
                  left: 5.w,right: 5.w
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,size: 4.h,),
                  ),
                  SizedBox(width: 25.w,),
                  DefaultText(
                    text: "Blogs",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            cubit.blogsModel==null?
                const Center(
                  child: CircularProgressIndicator(),
                ):
               SizedBox(
                 height: 87.h,
                 child: ListView.separated(
                   physics:const BouncingScrollPhysics(),
                     itemBuilder: (context,index){
                       return InkWell(
                           onTap: (){
                             cubit.getOneBlog(model[index].plantId);
                             NavigetorApp.navigatorTo(context,
                                const SingleBlogScreen(
                              ));
                           },
                           child: BlogsItems(index: index,model: model,));
                     },
                     separatorBuilder: (context,index){
                       return SizedBox(height: 3.h,);
                     },
                     itemCount: model.length),
               )
          ],
        ),
      );
    },
    );
  }
}
//'https://lavie.orangedigitalcenteregypt.com/uploads/51416d55-189c-46bc-9e34-296195d18a94.png'