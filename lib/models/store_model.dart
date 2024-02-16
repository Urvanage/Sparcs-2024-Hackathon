class StoreModel {
  final String storeName, reviewCount, workingTime, callNumber, address, introduction, mainFood, price, recommend, picture;
  final double latitude, longitude;

  StoreModel({
    required this.storeName,
    required this.reviewCount,
    required this.workingTime,
    required this.callNumber,
    required this.address,
    required this.introduction,
    required this.mainFood,
    required this.price,
    required this.recommend,
    required this.picture,
    required this.latitude,
    required this.longitude,
  });
}
