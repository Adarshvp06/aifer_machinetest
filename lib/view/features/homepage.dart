import 'package:aifer_machinetest/constants/error_image.dart';
import 'package:aifer_machinetest/view/features/image_screen.dart';
import 'package:aifer_machinetest/view_model/list_photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ListPhotoProvider>(context, listen: false).fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Consumer<ListPhotoProvider>(
          builder: (BuildContext context, photoprovider, Widget? child) {
            if (photoprovider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }

            if (photoprovider.listphotos.isEmpty) {
              return const Center(
                child: Text("No data Found"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MasonryGridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    itemCount: photoprovider.listphotos.length,
                    itemBuilder: (context, index) {
                      final photo = photoprovider.listphotos[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageScreen(
                                  imageurl:

                                      //  im using small instead of full because my external is not supporting full images

                                      photo.urls?.small ?? ErrorImage.imageurl,
                                ),
                              ));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                photo.urls != null
                                    ? photo.urls!.small ?? ''
                                    : ErrorImage.imageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                maxLines: 2,
                                photo.altDescription ?? "No description",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }
          },
        )));
  }
}
