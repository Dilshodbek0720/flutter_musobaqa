import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/product_model/product_model.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_musobaqa/ui/tab_user/products/product_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
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
                  return Container(
                    margin: EdgeInsets.all(20.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.5)
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productModel: productModel)));
                      },
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(productModel.productImages.first,height: 60)),
                      title: Text(productModel.productName,style: TextStyle(color: Colors.white),),
                      subtitle: Text(productModel.description,style: TextStyle(color: Colors.white),),
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
