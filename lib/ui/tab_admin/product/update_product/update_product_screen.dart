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
      body: ListView(
        children: [
          SizedBox(height: 28.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Product Name",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          GlobalTextField(
            hintText: "Product Name",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
            controller: context.read<ProductProvider>().productName,
            icon: Icon(Icons.drive_file_rename_outline),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Description",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GlobalTextField(
            hintText: "Description",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            controller: context.read<ProductProvider>().description,
            icon: Icon(Icons.description),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Price",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GlobalTextField(
            hintText: "Price",
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            controller: context.read<ProductProvider>().price,
            icon: Icon(Icons.price_check),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Count",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GlobalTextField(
            hintText: "Count",
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            controller: context.read<ProductProvider>().count,
            icon: Icon(Icons.price_check),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              "Currency",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GlobalTextField(
            hintText: "Currency",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.start,
            controller: context.read<ProductProvider>().currency,
            icon: Icon(Icons.currency_exchange),
          ),
          SizedBox(height: 30.h,),
          GlobalButton(title: "Save", onTap: (){
            context.read<ProductProvider>().updateProduct(
              context: context,
              productModel: ProductModel(
                productId: widget.productModel.productId,
                productName: context.read<ProductProvider>().productName.text.isNotEmpty ?context.read<ProductProvider>().productName.text :widget.productModel.productName,
                description: context.read<ProductProvider>().description.text.isNotEmpty? context.read<ProductProvider>().description.text :widget.productModel.description,
                productImages: [widget.productModel.productImages[0]],
                createdAt: DateTime.now().toString(),
                count: context.read<ProductProvider>().count.text.isNotEmpty? int.parse(context.read<ProductProvider>().count.text) : widget.productModel.count,
                price: context.read<ProductProvider>().price.text.isNotEmpty? int.parse(context.read<ProductProvider>().price.text) : widget.productModel.price,
                categoryId: widget.productModel.categoryId,
                currency: context.read<ProductProvider>().currency.text.isNotEmpty?  context.read<ProductProvider>().currency.text : widget.productModel.currency
              ),
            );
            Navigator.pop(context);
          }),
          SizedBox(height: 30.h,)
        ],
      ),
    );
  }
}
