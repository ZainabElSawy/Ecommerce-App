class SettingsModel {
  int? settingsId;
  String? settingsTitlehome;
  String? settingsBodyhome;

  SettingsModel(
      {this.settingsId, this.settingsTitlehome, this.settingsBodyhome});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    settingsId = int.parse(json['settings_id'].toString());
    settingsTitlehome = json['settings_titlehome'];
    settingsBodyhome = json['settings_bodyhome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['settings_id'] = settingsId;
    data['settings_titlehome'] = settingsTitlehome;
    data['settings_bodyhome'] = settingsBodyhome;
    return data;
  }
}
