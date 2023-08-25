import 'package:flutter/material.dart';

class LargePhoto extends StatelessWidget {
  const LargePhoto({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
        url,
      ),
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }
}
