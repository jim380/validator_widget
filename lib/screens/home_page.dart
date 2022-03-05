import 'package:flutter/material.dart';
import '../staking_params_client.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StakingParamsClient _stakingParamsClient = StakingParamsClient();
  final _client = http.Client();

  String? _unbondingTime;
  int? _maxValidators;
  int? _maxEntries;
  int? _historicalEntries;
  String? _bondDenom;
  String? _requestType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validator Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _requestType != null
                ? Center(
                    child: Text(
                      _requestType!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(height: 16),
            _unbondingTime != null
                ? Text('Unbonding time: $_unbondingTime')
                : Container(),
            const SizedBox(height: 8),
            _maxValidators != null
                ? Text('Max validators: $_maxValidators')
                : Container(),
            const SizedBox(height: 8),
            _unbondingTime != null
                ? Text('Max entries: $_maxEntries')
                : Container(),
            const SizedBox(height: 8),
            _unbondingTime != null
                ? Text('Historical entries: $_historicalEntries')
                : Container(),
            const SizedBox(height: 8),
            _unbondingTime != null
                ? Text('Bond denom: $_bondDenom')
                : Container(),
            const SizedBox(height: 8),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final params =
                        await _stakingParamsClient.fetchStakingParams(_client);
                    setState(() {
                      _requestType = 'Staking Params';
                      _bondDenom = params.params!.bondDenom;
                      _unbondingTime = params.params!.unbondingTime;
                      _maxValidators =
                          int.tryParse(params.params!.maxValidators.toString());
                    });
                    _maxEntries =
                        int.tryParse(params.params!.maxEntries.toString());
                    _historicalEntries = int.tryParse(
                        params.params!.historicalEntries.toString());
                  },
                  child: const Text('GET'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
