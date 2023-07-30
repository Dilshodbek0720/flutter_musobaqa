import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_musobaqa/data/models/product_model/product_model.dart';
import 'package:flutter_musobaqa/providers/product_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../auth/widgets/global_button.dart';
import '../../../auth/widgets/global_text_fields.dart';
import '../../catogory/widgets/utils.dart';


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
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30.h,
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
                      height: 60.h,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 30.h,
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
                      height: 60.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 180,
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
                    SizedBox(
                      height: 60.h,
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
