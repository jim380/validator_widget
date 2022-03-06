import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/screens/dashboard/components/header.dart';
import 'package:validator_widget/utils/responsive.dart';
import 'package:validator_widget/screens/dashboard/components/recent_activities.dart';
import 'package:validator_widget/screens/dashboard/components/balance_detail.dart';
import 'package:validator_widget/screens/dashboard/components/my_info.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyInfo(),
                      SizedBox(height: defaultPadding),
                      RecentActivities(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) BalanceDetail(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: BalanceDetail(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}