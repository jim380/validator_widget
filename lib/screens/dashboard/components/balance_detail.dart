import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'chart.dart';
import 'balance_info_card.dart';

class BalanceDetail extends StatelessWidget {
  const BalanceDetail({
    Key? key,
  }) : super(key: key);

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
            "My Account",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          MyInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Delegated",
            amount: "93,000 UMEE",
            percentage: 93,
          ),
          MyInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Available",
            amount: "1,000 UMEE",
            percentage: 1,
          ),
          MyInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Rewards",
            amount: "2,000 UMEE",
            percentage: 2,
          ),
          MyInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Commission",
            amount: "4,000 UMEE",
            percentage: 4,
          ),
        ],
      ),
    );
  }
}
