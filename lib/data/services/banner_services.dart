import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/api_endpoints.dart';
import '../models/banner_models.dart';


abstract class BannerRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final http.Client client;

  BannerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await client.get(
        Uri.parse(ApiEndpoints.bannerListUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['success'] == true && jsonData['data'] != null) {
          final List<dynamic> bannersJson = jsonData['data'];
          return bannersJson
              .map((bannerJson) => BannerModel.fromJson(bannerJson))
              .toList();
        } else {
          throw Exception('Failed to parse banner data');
        }
      } else {
        throw Exception('Failed to load banners: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching banners: $e');
    }
  }
}