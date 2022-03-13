import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';

class DummyPeggoInfo {
  IconData? icon;
  String? title;
  String? change;
  String? value;
  int? percentage;
  Color? color;
  List<Color>? colors;
  List<FlSpot>? spots;

  DummyPeggoInfo({
    this.icon,
    this.title,
    this.change,
    this.value,
    this.percentage,
    this.color,
    this.colors,
    this.spots,
  });

  DummyPeggoInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    icon = json['icon'];
    change = json['change'];
    color = json['color'];
    percentage = json['percentage'];
    colors = json['colors'];
    spots = json['spots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['icon'] = icon;
    data['change'] = change;
    data['color'] = color;
    data['percentage'] = percentage;
    data['colors'] = colors;
    data['spots'] = spots;
    return data;
  }
}

List<DummyPeggoInfo> dummyPeggoDataList =
    dummyPeggoData.map((item) => DummyPeggoInfo.fromJson(item)).toList();

var dummyPeggoData = [
  {
    "title": "Bridge Status",
    "value": "active",
    "icon": Icons.verified_user,
    "change": "",
    "color": primaryColor,
    "percentage": 35,
    "colors": [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ],
    "spots":const [
       FlSpot(
        1,
        2,
      ),
       FlSpot(
        2,
        1.0,
      ),
       FlSpot(
        3,
        1.8,
      ),
       FlSpot(
        4,
        1.5,
      ),
       FlSpot(
        5,
        1.0,
      ),
       FlSpot(
        6,
        2.2,
      ),
       FlSpot(
        7,
        1.8,
      ),
       FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Event Nonce",
    "value": "1328",
    "icon": Icons.message,
    "change": "+ 5%",
    "color": const Color(0xFFFFA113),
    "percentage": 35,
    "colors": const [Color(0xfff12711), Color(0xfff5af19)],
    "spots": const [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        4,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        3,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Active Validators",
    "value": "100",
    "icon": Icons.comment,
    "change": "+ 8%",
    "color": const Color(0xFFA4CDFF),
    "percentage": 10,
    "colors": const [Color(0xff2980B9), Color(0xff6DD5FA)],
    "spots": const [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        5,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        6,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1,
      )
    ]
  },
  {
    "title": "Orchestrator Status",
    "value": "active",
    "icon": Icons.monitor_heart,
    "change": "",
    "color": const Color(0xFFd50000),
    "percentage": 10,
    "colors": const [Color(0xff93291E), Color(0xffED213A)],
    "spots": const [
      FlSpot(
        1,
        3,
      ),
      FlSpot(
        2,
        4,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  },
  {
    "title": "Reward",
    "value": "538.22",
    "icon": Icons.ring_volume,
    "change": "- 5%",
    "color": const Color(0xFF00F260),
    "percentage": 78,
    "colors": const[Color(0xff0575E6), Color(0xff00F260)],
    "spots": const [
      FlSpot(
        1,
        1.3,
      ),
      FlSpot(
        2,
        1.0,
      ),
      FlSpot(
        3,
        1.8,
      ),
      FlSpot(
        4,
        1.5,
      ),
      FlSpot(
        5,
        1.0,
      ),
      FlSpot(
        6,
        2.2,
      ),
      FlSpot(
        7,
        1.8,
      ),
      FlSpot(
        8,
        1.5,
      )
    ]
  }
];