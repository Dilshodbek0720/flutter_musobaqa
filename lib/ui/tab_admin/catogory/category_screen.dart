import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/category_model/category_model.dart';
import 'package:flutter_musobaqa/providers/category_provider.dart';
import 'package:flutter_musobaqa/ui/tab_admin/catogory/add_category/add_category_screen.dart';
import 'package:flutter_musobaqa/ui/tab_admin/catogory/update/update_category_screen.dart';
import 'package:provider/provider.dart';


class CategoryAdminScreen extends StatefulWidget {
  const CategoryAdminScreen({super.key});

  @override
  State<CategoryAdminScreen> createState() => _CategoryAdminScreenState();
}

class _CategoryAdminScreenState extends State<CategoryAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCategoryScreen()));
            },
            icon: const Icon(Icons.add),
          )
        ],
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
                  return ListTile(
                      onLongPress: () {

                      },
                      title: Text(categoryModel.categoryName),
                      subtitle: Text(categoryModel.description),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateCategoryScreen(categoryModel: categoryModel)));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  content:const Padding(
                                    padding:  EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Delete Category",
                                      style:
                                      TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  actions: [
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        context.read<CategoryProvider>().deleteCategory(
                                          context: context,
                                          categoryId: categoryModel.categoryId,
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      isDefaultAction: true,
                                      child: const Text("ok"),
                                    ),
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      isDefaultAction: true,
                                      child: const Text("cancel"),
                                    ),

                                  ],
                                ),
                              );
                            }, icon: const Icon(Icons.delete))
                          ],
                        ),
                      )
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