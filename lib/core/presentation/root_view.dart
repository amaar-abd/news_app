import 'package:flutter/material.dart';

import 'package:news_app/core/presentation/root_view_body.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RootViewBody());
  }
}
