import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/category_model/category_model.dart';
import 'package:flutter_musobaqa/providers/category_provider.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_button.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_text_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class UpdateCategoryScreen extends StatefulWidget {
  const UpdateCategoryScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Category ",
          style: TextStyle(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Text("Category Name",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.white),),
                    SizedBox(height: 30.h,),
                    GlobalTextField(
                      icon: Icon(Icons.drive_file_rename_outline),
                        hintText: widget.categoryModel.categoryName,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.start,
                        controller: context.read<CategoryProvider>().categoryName),
                    SizedBox(height: 60.h,),
                    Text("Description",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.white),),
                    SizedBox(height: 30.h,),
                    GlobalTextField(
                        icon: Icon(Icons.description),
                        hintText: widget.categoryModel.description,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.start,
                        controller: context.read<CategoryProvider>().description),
                    SizedBox(height: 60.h,),
                    GlobalButton(title: "Save", onTap: (){
                      context.read<CategoryProvider>().updateCategory(
                        context: context,
                        categoryModel: CategoryModel(
                          categoryId: widget.categoryModel.categoryId,
                          categoryName: context.read<CategoryProvider>().categoryName.text,
                          description: context.read<CategoryProvider>().description.text,
                          imageUrl: "imageUrl",
                          createdAt: DateTime.now().toString(),
                        ),
                      );
                      Navigator.pop(context);
                    })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
