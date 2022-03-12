import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/screens/dashboard/components/header.dart';
import 'package:validator_widget/utils/responsive.dart';
import 'package:validator_widget/screens/dashboard/components/recent_activities.dart';
import 'package:validator_widget/screens/dashboard/components/balance_detail.dart';
import 'package:validator_widget/screens/dashboard/components/my_info.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyInfo(),
                      const SizedBox(height: defaultPadding),
                      const RecentActivities(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const BalanceDetail(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
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
