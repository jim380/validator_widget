// To parse this JSON data, do
//
//     final stakingParams = stakingParamsFromJson(jsonString);

import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:validator_widget/constants/constants.dart';

StakingParams? stakingParams;
class StakingParamsInfo {
  IconData? icon;
  String? title;
  String? change;
  String? value;
  int? percentage;
  Color? color;
  List<Color>? colors;
  List<FlSpot>? spots;

  StakingParamsInfo({
    this.icon,
    this.title,
    this.change,
    this.value,
    this.percentage,
    this.color,
    this.colors,
    this.spots,
  });

  StakingParamsInfo.fromJson(Map<String, dynamic> json) {
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

List<StakingParamsInfo> stakingParamDataList =
    stakingParamData.map((item) => StakingParamsInfo.fromJson(item)).toList();

var stakingParamData = [
  {
    "title": "Bonded Denom",
    "value": stakingParams!.params!.bondDenom,
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
    "title": "Historical Entries",
    "value": stakingParams!.params!.historicalEntries,
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
    "title": "Max Validators",
    "value": stakingParams!.params!.maxValidators,
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
    "title": "Mex Entries",
    "value": stakingParams!.params!.maxEntries,
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
    "title": "Unbonding Time",
    "value": stakingParams!.params!.unbondingTime,
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

StakingParams stakingParamsFromJson(String str) =>
    StakingParams.fromJson(json.decode(str));

String stakingParamsToJson(StakingParams data) => json.encode(data.toJson());

class StakingParams {
  Params? params;

  StakingParams({
    this.params,
  });

  factory StakingParams.fromJson(Map<String, dynamic> json) => StakingParams(
        params: Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "params": params!.toJson(),
      };
}

class Params {
  Params({
    this.unbondingTime,
    this.maxValidators,
    this.maxEntries,
    this.historicalEntries,
    this.bondDenom,
  });

  String? unbondingTime;
  int? maxValidators;
  int? maxEntries;
  int? historicalEntries;
  String? bondDenom;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        unbondingTime: json["unbonding_time"],
        maxValidators: json["max_validators"],
        maxEntries: json["max_entries"],
        historicalEntries: json["historical_entries"],
        bondDenom: json["bond_denom"],
      );

  Map<String, dynamic> toJson() => {
        "unbonding_time": unbondingTime,
        "max_validators": maxValidators,
        "max_entries": maxEntries,
        "historical_entries": historicalEntries,
        "bond_denom": bondDenom,
      };
}
