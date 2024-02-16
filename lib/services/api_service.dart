import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:front/models/store_model.dart';

class ApiService {
  static const String baseUrl = "http://13.209.192.146:3000/store-info";

  static Future<List<StoreModel>> getStoreInfos() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // JSON 응답을 파싱하여 리스트로 변환
      final data = jsonDecode(response.body);
      final List<dynamic> storesData = data['store-info'];

      // StoreModel 리스트로 변환
      List<StoreModel> stores = storesData.map((storeData) {
        return StoreModel(
          storeName: storeData['storeName'],
          reviewCount: storeData['reviewCount'],
          workingTime: storeData['workingTime'],
          callNumber: storeData['callNumber'],
          address: storeData['address'],
          introduction: storeData['introduction'],
          mainFood: storeData['mainFood'],
          price: storeData['price'],
          recommend: storeData['recommend'],
          latitude: double.parse(storeData['latitude'] ?? '0.0'),
          longitude: double.parse(storeData['longitude'] ?? '0.0'),
          picture: storeData['picture'] ?? 'assets/background.jpeg',
        );
      }).toList();

      return stores;
    } else {
      // 오류 처리
      throw Exception('Failed to load store infos');
    }
  }
}
