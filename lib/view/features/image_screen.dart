
import 'dart:io';
import 'package:aifer_machinetest/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageScreen extends StatelessWidget {
  ImageScreen({super.key, required this.imageurl});
  final String? imageurl;

  Future<void> downloadImage(BuildContext context) async {
    try {
  
      if (await Permission.storage.request().isGranted) {

        final data = await getExternalStorageDirectory();
        if (data != null) {
          final filename = imageurl!.split('/').last;
          final filepath = '${data.path}/$filename';

          final response = await http.get(Uri.parse(imageurl!));
          if (response.statusCode == 200) {
            final file = File(filepath);
            await file.writeAsBytes(response.bodyBytes);

            CustomSnackbar.showSnackBar(
                context, "Image downloaded to $filepath");
          } else {
            throw Exception("Failed to download image");
          }
        }
      } else {
     CustomSnackbar.showSnackBar(context, "Storage permission is not allowed");
      }
    } catch (e) {
     CustomSnackbar.showSnackBar(context, "Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageurl.toString()),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {downloadImage(context);} ,
        child: const Icon(Icons.download),
      ),
    );
  }
}
