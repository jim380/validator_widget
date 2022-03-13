
import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/screens/dashboard/components/header.dart';
import 'package:validator_widget/screens/peggo/components/peggo_info_card.dart';
import 'package:validator_widget/models/pages.dart';
class PeggoScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.peggoPath,
      key: ValueKey(Pages.peggoPath),
      child: const PeggoScreen(),
    );
  }

  const PeggoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PeggoScreen> createState() => _PeggoScreenState();
}

class _PeggoScreenState extends State<PeggoScreen> {
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // call funcstions in router.dart to update AppStateManager
    // Provider.of<AppStateManager>(context, listen: false).goToPeggo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: const [
               Header(),
               SizedBox(height: defaultPadding),
               PeggoInfo(),
               SizedBox(height: defaultPadding),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       flex: 5,
              //       child: Column(
              //         children: [
              //           RecentUsers(),
              //           const SizedBox(height: defaultPadding),
              //           RecentDiscussions(),
              //           if (Responsive.isMobile(context))
              //           const SizedBox(height: defaultPadding),
              //           if (Responsive.isMobile(context)) UserDetailsWidget(),
              //         ],
              //       ),
              //     ),
              //     if (!Responsive.isMobile(context))
              //       const SizedBox(width: defaultPadding),
              //     if (!Responsive.isMobile(context))
              //       Expanded(
              //         flex: 2,
              //         child: UserDetailsWidget(),
              //       ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}