import 'category.dart';
import 'item.dart';
import 'setting.dart';

class HomeModel {
	String? status;
	List<Setting>? settings;
	List<Category>? categories;
	List<Item>? items;

	HomeModel({this.status, this.settings, this.categories, this.items});

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				status: json['status'] as String?,
				settings: (json['settings'] as List<dynamic>?)
						?.map((e) => Setting.fromJson(e as Map<String, dynamic>))
						.toList(),
				categories: (json['categories'] as List<dynamic>?)
						?.map((e) => Category.fromJson(e as Map<String, dynamic>))
						.toList(),
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'settings': settings?.map((e) => e.toJson()).toList(),
				'categories': categories?.map((e) => e.toJson()).toList(),
				'items': items?.map((e) => e.toJson()).toList(),
			};
}
