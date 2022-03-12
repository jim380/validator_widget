import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';
import 'package:validator_widget/models/dummy_peggo_info.dart';

class PeggoInfoWidget extends StatefulWidget {
  const PeggoInfoWidget({
    Key? key,
    required this.peggoData,
  }) : super(key: key);
  final DummyPeggoInfo peggoData;

  @override
  _PeggoInfoWidgetState createState() => _PeggoInfoWidgetState();
}

int _value = 1;

class _PeggoInfoWidgetState extends State<PeggoInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.peggoData.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  widget.peggoData.icon,
                  color: widget.peggoData.color,
                  size: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: DropdownButton(
                  icon: const Icon(Icons.more_vert, size: 18),
                  underline: const SizedBox(),
                  style: Theme.of(context).textTheme.button,
                  value: _value,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Daily"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Weekly"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Monthly"),
                      value: 3,
                    ),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.peggoData.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              LineChartWidget(
                  colors: widget.peggoData.colors,
                  spotsData: widget.peggoData.spots,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ProgressLine(
            color: widget.peggoData.color!,
            percentage: widget.peggoData.percentage!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.peggoData.volumeData}",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                widget.peggoData.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.colors,
    required this.spotsData,
  }) : super(key: key);
  final List<Color>? colors;
  final List<FlSpot>? spotsData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 30,
          child: LineChart(
            LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      spots: spotsData,
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      colors: colors,
                      barWidth: 3),
                ],
                lineTouchData: LineTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                axisTitleData: FlAxisTitleData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false)),
          ),
        ),
      ],
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
