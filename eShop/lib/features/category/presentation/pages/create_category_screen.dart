import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/utils.dart';
class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});
  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}
class _CreateCategoryState extends State<CreateCategory> {
  List<File> images = [];
  Future<void> selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(),
            SizedBox(height: 40),
            GestureDetector(
              onTap: pickImages,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 40),
            DElevatedButton(onPressed: () {}, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}