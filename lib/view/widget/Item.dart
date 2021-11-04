import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertest/model/card.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final CardModel cardModel;
  const Item({Key key, this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      placeholder: (context, url) => Center(child: Text('loading...')),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      fit: BoxFit.cover,
      imageUrl: cardModel.image,
      alignment: Alignment.center,
    );
    final title = Text(
      cardModel.title,
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontWeight: FontWeight.bold),
    );

    final content =
        Text(cardModel.content, style: Theme.of(context).textTheme.subtitle2);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: title,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: content,
            )
          ],
        ),
      ),
    );
  }
}
