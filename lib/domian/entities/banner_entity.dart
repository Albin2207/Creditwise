import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String bannerImage;
  final int sortOrder;
  final int status;

  const BannerEntity({
    required this.id,
    required this.bannerImage,
    required this.sortOrder,
    required this.status,
  });

  @override
  List<Object> get props => [id, bannerImage, sortOrder, status];
}