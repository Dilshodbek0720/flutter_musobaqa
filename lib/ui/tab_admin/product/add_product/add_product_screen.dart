import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_musobaqa/data/models/product_model/product_model.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_button.dart';
import 'package:flutter_musobaqa/ui/auth/widgets/global_text_fields.dart';
import 'package:flutter_musobaqa/ui/tab_admin/catogory/widgets/utils.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddProductScreen> {
  String? _imageUrl;

  File? image;


  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> _uploadImage() async {
    String? downloadUrl = await uploadImageToFirebase(image);
    setState(() {
      _imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product ",
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
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 150.w,
                  child: TextButton(
                    onPressed: () async {
                      await pickImage();
                    },
                    child: Text(
                      "Image",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                if (image != null)
                  Image.file(
                    File(
                      image!.path,
                    ),
                    height: 100.h,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          GlobalButton(
              title: "Save",
              onTap: ()async {
                await _uploadImage();
                context.read<ProductProvider>().addProduct(
                  context: context,
                  productModel: ProductModel(
                    productId: "",
                    productName: context
                        .read<ProductProvider>()
                        .productName
                        .text,
                    description: context
                        .read<ProductProvider>()
                        .description
                        .text,
                     productImages: [_imageUrl!],
                    createdAt: DateTime.now().toString(),
                    count: int.parse(context.read<ProductProvider>().count.text),
                    price: int.parse(context.read<ProductProvider>().price.text),
                    categoryId: "",
                    currency: context.read<ProductProvider>().currency.text
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
