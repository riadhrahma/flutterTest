import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertest/view/widget/Item.dart';
import 'package:fluttertest/view_model/api/data.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: allData.core
                .map((e) => CachedNetworkImage(
                      imageUrl: e.image,
                    ))
                .toList(),
          ),
        ),
        PageView(
          children: allData.core
              .map((e) => Item(
                    cardModel: e,
                  ))
              .toList(),
          scrollDirection: Axis.vertical,
        ),
      ],
    );
  }
}
