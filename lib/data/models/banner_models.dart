import '../../domian/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.bannerImage,
    required super.sortOrder,
    required super.status,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      bannerImage: json['banner_image'] as String,
      sortOrder: json['sort_order'] as int,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'banner_image': bannerImage,
      'sort_order': sortOrder,
      'status': status,
    };
  }
}
