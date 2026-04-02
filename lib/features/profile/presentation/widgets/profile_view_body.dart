import 'package:flutter/material.dart';
import 'package:news_app/features/profile/presentation/widgets/activities_row.dart';
import 'package:news_app/features/profile/presentation/widgets/custom_account_card.dart';
import 'package:news_app/features/profile/presentation/widgets/logout_botton.dart';
import 'package:news_app/features/profile/presentation/widgets/profile_appbar.dart';
import 'package:news_app/features/profile/presentation/widgets/top_info_profile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          ProfileAppbar(),
          SizedBox(height: 25),
          TopInfoProfile(),
          SizedBox(height: 15),
          ActivitiesRow(),
          SizedBox(height: 30),
          CustomAccountCard(),
          Spacer(),
          LogoutBotton(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
