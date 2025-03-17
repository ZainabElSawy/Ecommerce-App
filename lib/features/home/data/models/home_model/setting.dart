class Setting {
	int? settingsId;
	String? settingsTitlehome;
	String? settingsBodyhome;

	Setting({this.settingsId, this.settingsTitlehome, this.settingsBodyhome});

	factory Setting.fromJson(Map<String, dynamic> json) => Setting(
				settingsId: json['settings_id'] as int?,
				settingsTitlehome: json['settings_titlehome'] as String?,
				settingsBodyhome: json['settings_bodyhome'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'settings_id': settingsId,
				'settings_titlehome': settingsTitlehome,
				'settings_bodyhome': settingsBodyhome,
			};
}
