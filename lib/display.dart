import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:math' as math;

import 'package:front/detailstore.dart';
import 'package:front/helpers/my_flutter_app_icons.dart';
import 'package:front/tagandelse.dart';

import 'package:front/services/api_service.dart';
import 'package:front/models/store_model.dart';

double degress = 345;
double radians = degress * math.pi / 180;

double centerX = 36.3256;
double centerY = 127.4650;

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _selectedIndex = 0;
  String? dropdownValue;

  final Future<List<StoreModel>> storeModels = ApiService.getStoreInfos();

  final List<String> items = [
    '전체',
    '음식점',
    '세탁',
    '미용',
  ];

  final List<String> items2 = [
    '추천순',
    '가까운순',
    '어쩌구순',
  ];

  String? selectedValue;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "대전",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(71, 97, 198, 1),
                    fontWeight: FontWeight.w900, // '대전'에만 bold 스타일 적용
                  ),
                ),
                Text(
                  "의 착한가격업소",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(size: 30, Icons.map_outlined, color: Colors.black),
                SizedBox(width: 3),
                Icon(
                  size: 30,
                  Icons.search,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(70, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.room,
                        size: 18,
                        color: Colors.black,
                      ),
                      Text(
                        "동구 정동",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        '업종 선택',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        // padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 80,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        '정렬 기준',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 11,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items2
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        // padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 70,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: storeModels,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // 데이터가 있다면 정상적으로 처리
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        for (var store in snapshot.data!)
                          StoreWidget(
                            storeName: store.storeName,
                            mainFood: store.mainFood,
                            price: store.price,
                            picture: store.picture,
                            latitude: store.latitude,
                            longitude: store.longitude,
                            reviewCount: store.reviewCount,
                            workingTime: store.workingTime,
                            callNumber: store.callNumber,
                            address: store.address,
                            introduction: store.introduction,
                            recommend: store.recommend,
                          )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "가게"),
          BottomNavigationBarItem(icon: Icon(Icons.brush), label: "리뷰 작성하기"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "마이페이지"),
        ]),
      ),
    );
  }
}

class StoreWidget extends StatelessWidget {
  final String storeName, price, mainFood, picture, reviewCount, workingTime, callNumber, address, introduction, recommend;
  final double latitude, longitude;
  int dist = 0;

  StoreWidget({
    required this.storeName,
    required this.price,
    required this.mainFood,
    required this.latitude,
    required this.longitude,
    required this.picture,
    required this.reviewCount,
    required this.workingTime,
    required this.callNumber,
    required this.address,
    required this.introduction,
    required this.recommend,
    super.key,
  });

  void someMethod() {
    final x = centerX - latitude;
    final realX = ((x < 0) ? x * (-1) : x) * 10000;
    final y = centerY - longitude;
    final realY = ((y < 0) ? y * (-1) : y) * 10000;

    dist = math.sqrt(math.pow(realX * 11, 2) + math.pow(realY * 9, 2)).toInt();
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage image;
    if (picture == 'assets/background.jpeg') {
      image = DecorationImage(
        image: AssetImage(picture),
        fit: BoxFit.cover,
      );
    } else {
      image = DecorationImage(
        image: AssetImage(picture),
        //image: NetworkImage(picture),
        fit: BoxFit.cover,
      );
    }

    someMethod();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailStore(
                  storeName: storeName,
                  price: price,
                  mainFood: mainFood,
                  latitude: latitude,
                  longitude: longitude,
                  picture: picture,
                  reviewCount: reviewCount,
                  workingTime: workingTime,
                  callNumber: callNumber,
                  address: address,
                  introduction: introduction,
                  recommend: recommend,
                  isWritten: false,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
            image: image,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 15,
                child: Transform.rotate(
                  angle: radians,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(168, 174, 250, 1),
                    ),
                    width: 110,
                    height: 150,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text("\n탱쓰\n\n유성 맛집 인정입니다. 진짜 최고의 맛이고, 오늘은 12시 넘어서 갔는데 사람이...",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100, // 이미지의 아래 부분을 어둡게 할 높이
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(storeName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(price,
                              style: const TextStyle(
                                color: Color.fromRGBO(139, 237, 175, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(mainFood,
                              style: const TextStyle(
                                color: Color.fromRGBO(222, 222, 227, 1),
                                fontSize: 13,
                              )),
                          const SizedBox(
                            width: 100,
                          ),
                          const Icon(
                            Icons.room,
                            color: Color.fromRGBO(184, 184, 190, 1),
                            size: 15,
                          ),
                          const SizedBox(width: 1),
                          Text('${dist}m',
                              style: const TextStyle(
                                color: Color.fromRGBO(184, 184, 190, 1),
                                fontSize: 12,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.star,
                            color: Color.fromRGBO(184, 184, 190, 1),
                            size: 15,
                          ),
                          const SizedBox(width: 1),
                          const Text("4.6",
                              style: TextStyle(
                                color: Color.fromRGBO(184, 184, 190, 1),
                                fontSize: 12,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
