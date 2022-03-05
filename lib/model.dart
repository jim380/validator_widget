const keySyncing = "syncing";

class Syncing {
  bool? status;

  Syncing();

  Syncing.fromJson(Map<String, dynamic> json) {
    status = json[keySyncing];
  }

  Map<String, dynamic> toJson() {
    return {
      keySyncing: status,
    };
  }
}
