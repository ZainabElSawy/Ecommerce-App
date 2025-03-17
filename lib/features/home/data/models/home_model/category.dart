class Category {
	int? categoriesId;
	String? categoriesName;
	String? categoriesNameAr;
	String? categoriesImage;
	String? categoriesDatetime;

	Category({
		this.categoriesId, 
		this.categoriesName, 
		this.categoriesNameAr, 
		this.categoriesImage, 
		this.categoriesDatetime, 
	});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
				categoriesId: json['categories_id'] as int?,
				categoriesName: json['categories_name'] as String?,
				categoriesNameAr: json['categories_name_ar'] as String?,
				categoriesImage: json['categories_image'] as String?,
				categoriesDatetime: json['categories_datetime'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'categories_id': categoriesId,
				'categories_name': categoriesName,
				'categories_name_ar': categoriesNameAr,
				'categories_image': categoriesImage,
				'categories_datetime': categoriesDatetime,
			};
}
