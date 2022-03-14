import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/models/staking_params.dart';
import 'package:validator_widget/utils/responsive.dart';
import 'package:validator_widget/models/dummy_peggo_info.dart';
import 'package:validator_widget/screens/peggo/components/peggo_info_widget.dart';


class PeggoInfo extends StatelessWidget {
  const PeggoInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
             SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: InformationCard(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: const InformationCard(),
          desktop: InformationCard(
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dummyPeggoDataList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          PeggoInfoWidget(peggoData: stakingParamDataList[index]),
          // PeggoInfoWidget(peggoData: dummyPeggoDataList[index]),
    );
  }
}
