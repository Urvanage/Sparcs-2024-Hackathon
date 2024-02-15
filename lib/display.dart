import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'dart:math' as math;

import 'package:front/detailstore.dart';
import 'package:front/tagandelse.dart';

double degress = 345;
double radians = degress * math.pi / 180;

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _selectedIndex = 0;
  String? dropdownValue;

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
                    fontWeight: FontWeight.bold, // '대전'에만 bold 스타일 적용
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
            const Column(
              children: [
                StoreWidget(),
                StoreWidget(),
                StoreWidget(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      children: [Icon(Icons.store), Text("가게")],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TagandRecomm(isValid: false)));
                      },
                      child: Transform.translate(
                        offset: const Offset(20, -10),
                        child: Container(
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            children: [
                              Icon(Icons.brush, color: Colors.white),
                              Text(
                                "후기",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "작성하기",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Column(
                      children: [Icon(Icons.person), Text("마이페이지")],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailStore()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage("assets/background.jpeg"),
              fit: BoxFit.cover,
            ),
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
              const Positioned(
                bottom: 20,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("뒤집어진 뚝배기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("6,000원",
                              style: TextStyle(
                                color: Color.fromRGBO(208, 232, 51, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("김치찌개",
                              style: TextStyle(
                                color: Color.fromRGBO(222, 222, 227, 1),
                                fontSize: 13,
                              )),
                          SizedBox(
                            width: 110,
                          ),
                          Icon(
                            Icons.room,
                            color: Color.fromRGBO(184, 184, 190, 1),
                            size: 15,
                          ),
                          SizedBox(width: 1),
                          Text("500m",
                              style: TextStyle(
                                color: Color.fromRGBO(184, 184, 190, 1),
                                fontSize: 12,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(184, 184, 190, 1),
                            size: 15,
                          ),
                          SizedBox(width: 1),
                          Text("4.6",
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
