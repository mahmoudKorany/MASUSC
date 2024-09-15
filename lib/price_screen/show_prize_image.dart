import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shimmer/shimmer.dart';

class ShowPrizeScreen extends StatelessWidget {
  const ShowPrizeScreen({super.key,required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0.0),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
      ),
      body: InteractiveViewer(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, string) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[700]!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}