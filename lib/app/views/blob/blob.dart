import 'dart:async';

import 'package:dk_app_flutter/app/modules/wheelOfLife/controllers/wheel_of_life_controller.dart';
import 'package:dk_app_flutter/app/views/blob/animated_blob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/generator.dart';
import 'src/model.dart';

class Blob extends StatefulWidget {
  final double size;
  final bool debug;
  final BlobStyles? styles;
  final BlobController? controller;
  final Widget? child;
  final int? edgesCount;
  final int? minGrowth;
  final List<String>? id;
  final Duration? duration;
  final bool loop;
  final bool isAnimated;
  final List<double> score;

  WheelOfLifeController wheelController = Get.find<WheelOfLifeController>();

  static int count = 0;

  Blob.normal({
    required this.size,
    this.edgesCount = BlobConfig.edgesCount,
    this.minGrowth = BlobConfig.minGrowth,
    this.debug = false,
    this.styles,
    this.controller,
    this.child,
    this.score = const [],
  })  : loop = false,
        id = null,
        duration = Duration(
          milliseconds: BlobConfig.animDurationMs,
        ),
        isAnimated = true;

  @override
  _BlobState createState() => _BlobState();

  BlobData _randomBlobData() {
    String? randomID = (id == null || id!.isEmpty) ? null : _randomID();
    return BlobGenerator(
            edgesCount: edgesCount,
            minGrowth: minGrowth,
            size: Size(size, size),
            id: randomID,
            score: wheelController.currentSocre.value)
        .generate();
  }

  String _randomID() {
    Blob.count++;
    if (id!.length == 1) return id![0];
    return id![Blob.count % id!.length];
  }
}

class _BlobState extends State<Blob> {
  BlobData? blobData;
  BlobData? fromBlobData;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _updateBlob();
    if (widget.loop) {
      timer = Timer.periodic(
        Duration(milliseconds: widget.duration!.inMilliseconds),
        (_) => _updateBlob(),
      );
    } else if (widget.controller != null) {
      widget.controller!.onChange(_updateBlob);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBlob(
      fromBlobData: fromBlobData,
      toBlobData: blobData!,
      size: widget.size,
      styles: widget.styles,
      debug: widget.debug,
      duration: widget.duration,
      child: widget.child,
    );
  }

  BlobData _updateBlob() {
    print('_updateBlob');
    if (widget.isAnimated) {
      fromBlobData = blobData;
    }
    blobData = widget._randomBlobData();
    setState(() {});
    return blobData!;
  }

  @override
  void dispose() {
    if (timer != null) timer!.cancel();
    if (widget.controller != null) widget.controller!.dispose();
    super.dispose();
  }
}
