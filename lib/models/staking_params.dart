// To parse this JSON data, do
//
//     final stakingParams = stakingParamsFromJson(jsonString);

import 'dart:convert';

StakingParams stakingParamsFromJson(String str) =>
    StakingParams.fromJson(json.decode(str));

String stakingParamsToJson(StakingParams data) => json.encode(data.toJson());

class StakingParams {
  StakingParams({
    this.params,
  });

  Params? params;

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
