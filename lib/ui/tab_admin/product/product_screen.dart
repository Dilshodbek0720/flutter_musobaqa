import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/product_model/product_model.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_musobaqa/ui/tab_admin/product/add_product/add_product_screen.dart';
import 'package:flutter_musobaqa/ui/tab_admin/product/update_product/update_product_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductAdminScreen extends StatefulWidget {
  const ProductAdminScreen({super.key});

  @override
  State<ProductAdminScreen> createState() => _ProductAdminScreenState();
}

class _ProductAdminScreenState extends State<ProductAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProductScreen()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductProvider>().getProducts(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
              children: List.generate(
                snapshot.data!.length,
                    (index) {
                  ProductModel productModel = snapshot.data![index];
                  return ListTile(
                      onLongPress: () {

                      },
                      leading: Image.network(productModel.productImages[0]),
                      title: Text(productModel.productName),
                      subtitle: Text(productModel.description),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProductScreen(productModel: productModel)));
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
                                        context.read<ProductProvider>().deleteProduct(
                                          context: context,
                                          productId: productModel.productId,
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
                : Center(child: Text("Empty!",style: TextStyle(fontSize: 50.sp,fontWeight: FontWeight.w700),));
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