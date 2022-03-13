import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/screens/dashboard/components/header.dart';
import 'package:validator_widget/utils/responsive.dart';
import 'package:validator_widget/screens/dashboard/components/recent_activities.dart';
import 'package:validator_widget/screens/dashboard/components/balance_detail.dart';
import 'package:validator_widget/screens/dashboard/components/my_info.dart';
import 'package:validator_widget/models/pages.dart';
import 'package:validator_widget/models/models.dart';
class DashboardScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.dashboardPath,
      key: ValueKey(Pages.dashboardPath),
      child: const DashboardScreen(),
    );
  }

  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // call funcstions in router.dart to update AppStateManager
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

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
