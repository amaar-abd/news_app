import 'package:flutter/material.dart';
import 'package:news_app/features/saved/presentation/widgets/saved_view_body.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SavedViewBody() ));
}}