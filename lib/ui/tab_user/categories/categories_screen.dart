import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/providers/category_provider.dart';
import 'package:flutter_musobaqa/ui/tab_user/categories/category_deteil_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model/category_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  CategoryModel categoryModel = snapshot.data![index];
                  return Container(
                    margin: EdgeInsets.all(20.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue.withOpacity(0.5)
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetailScreen(categoryModel: categoryModel)));
                      },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(categoryModel.imageUrl,height: 60)),
                        title: Text(categoryModel.categoryName),
                        subtitle: Text(categoryModel.description),
                    ),
                  );
                },
              ),
            )
                : const Center(child: Text("Empty!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
