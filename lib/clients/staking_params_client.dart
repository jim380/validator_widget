import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/staking_params.dart';

class StakingParamsClient {
  static const baseURL = "http://66.206.5.194:1317";
  static const endpoint = baseURL + "/cosmos/staking/v1beta1/params";

  Future<StakingParams> fetchStakingParams(http.Client client) async {
    final url = Uri.parse(endpoint);
    final response = await client.get(url, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });

    if (response.statusCode == 200) {
      return StakingParams.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response body');
    }
  }
}
