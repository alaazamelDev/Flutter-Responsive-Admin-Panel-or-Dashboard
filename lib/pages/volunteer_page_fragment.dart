import 'package:admin/config/constants.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VolunteerPageFragment extends StatelessWidget {
  const VolunteerPageFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const CustomAppBar(
            leading: LeadingIcon(
              isHidden: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  BigButton(
                    title: tr('volunteers'),
                    icon: Icons.group_outlined,
                    onPressed: () async {},
                  ),
                  const SizedBox(height: defaultPadding * 0.75),
                  BigButton(
                    title: tr('charity_activities'),
                    icon: Icons.work_outline_rounded,
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
