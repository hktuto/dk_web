import 'package:blobs/src/config.dart';
import 'package:blobs/src/painter/tools.dart';
import 'package:blobs/src/services/blob_generator.dart';
import 'package:flutter/material.dart';

class BlobClipper extends CustomClipper<Path> {
  final String? id;
  final int edgesCount;
  final int minGrowth;
  BlobClipper({
    this.id,
    this.edgesCount = BlobConfig.edgesCount,
    this.minGrowth = BlobConfig.minGrowth,
  });

  @override
  Path getClip(Size size) {
    var blobData = BlobGenerator(
      id: id,
      edgesCount: edgesCount,
      minGrowth: minGrowth,
      size: size,
      score:[]
    ).generate();
    return connectPoints(blobData.curves!);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
