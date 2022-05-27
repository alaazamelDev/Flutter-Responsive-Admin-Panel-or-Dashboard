import 'package:admin/constants.dart';
import 'package:admin/reusable_widgets/details_info_card.dart';
import 'package:admin/screens/main/components/chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DonationDetails extends StatelessWidget {
  DonationDetails({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> detailsItem = [
    {
      'title': tr('medical'),
      'svgSrc': "assets/icons/health.svg",
      'leading': Text('amount').plural(0.2),
      'donators': 1328,
      'cardColor': Color(0xFFEE2727),
    },
    {
      'title': tr('educational'),
      'svgSrc': "assets/icons/education.svg",
      'leading': Text('amount').plural(15.3),
      'donators': 1328,
      'cardColor': Color(0xFFFFCF26),
    },
    {
      'title': tr('entertainment'),
      'svgSrc': "assets/icons/entertainment.svg",
      'leading': Text('amount').plural(5.7),
      'donators': 1328,
      'cardColor': Color(0xFF26E5FF),
    },
    {
      'title': tr('other'),
      'svgSrc': "assets/icons/other.svg",
      'leading': Text('amount').plural(1.3),
      'donators': 1328,
      'cardColor': primaryColor,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('donation_details'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          for (int index = 0; index < detailsItem.length; index++)
            DetailsInfoCard(
              title: detailsItem[index]['title'],
              svgSrc: detailsItem[index]['svgSrc'],
              leading: detailsItem[index]['leading'],
              subtitle: Text(
                'donator'.plural(detailsItem[index]['donators']),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.black45),
              ),
              cardColor: detailsItem[index]['cardColor'],
            ),
        ],
      ),
    );
  }
}