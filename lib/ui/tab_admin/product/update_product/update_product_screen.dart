import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/data/models/product_model/product_model.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../auth/widgets/global_button.dart';
import '../../../auth/widgets/global_text_fields.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Product",
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
                    Text("Product Name",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.white),),
                    SizedBox(height: 30.h,),
                    GlobalTextField(
                        icon: Icon(Icons.drive_file_rename_outline),
                        hintText: widget.productModel.productName,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: context.read<ProductProvider>().productName),
                    SizedBox(height: 60.h,),
                    Text("Description",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.white),),
                    SizedBox(height: 30.h,),
                    GlobalTextField(
                        icon: Icon(Icons.description),
                        hintText: widget.productModel.description,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.start,
                        controller: context.read<ProductProvider>().description),
                    SizedBox(height: 60.h,),
                    GlobalButton(title: "Save", onTap: (){
                      context.read<ProductProvider>().updateProduct(
                        context: context,
                        productModel: ProductModel(
                          productId: widget.productModel.productId,
                          productName: context.read<ProductProvider>().productName.text,
                          description: context.read<ProductProvider>().description.text,
                          productImages: ["imageUrl"],
                          createdAt: DateTime.now().toString(),
                          count: 0,
                          price: 0,
                          categoryId: '',
                          currency: "euro"
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
