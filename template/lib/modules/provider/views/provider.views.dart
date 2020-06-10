import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';
import 'package:template/modules/provider/views/content.views.dart';

class ProviderView extends StatelessWidget {
  const ProviderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderController>.value(
      value: ProviderController(),
      child: ContentProvider()
    );
  }
}
