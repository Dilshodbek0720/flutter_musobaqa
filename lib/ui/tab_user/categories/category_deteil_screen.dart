import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/category_model/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Category detail screen"),
      ),
      body: Column(
       children: [
         Expanded(child: ListView(
           children: [
             SizedBox(height: 30.h,),
             Center(
               child: ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                   child: Image.network(widget.categoryModel.imageUrl,height: MediaQuery.of(context).size.height*.5,)),
             ),
             SizedBox(height: 30.h,),
             Center(child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Category name  ",style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
                 Text(widget.categoryModel.categoryName,style: TextStyle(fontSize: 24.spMin,fontWeight: FontWeight.w700),),
               ],
             ),),
             SizedBox(height: 30.h,),
             Center(child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Description  ",style: TextStyle(fontSize: 18.spMin,fontWeight: FontWeight.w500),),
                 Text(widget.categoryModel.description,style: TextStyle(fontSize: 18.spMin,fontWeight: FontWeight.w500),),
               ],
             ),),
             SizedBox(height: 30.h,),
             Center(child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Created at",style: TextStyle(fontSize: 16.spMin,fontWeight: FontWeight.w300),),
                 Text(widget.categoryModel.createdAt,style: TextStyle(fontSize: 16.spMin,fontWeight: FontWeight.w300),),
               ],
             ),)
           ],
         ))
       ],
      ),
    );
  }
}
