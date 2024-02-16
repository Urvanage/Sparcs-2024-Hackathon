import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'dart:math' as math;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/widgets.dart';
import 'package:front/verifyreceipt.dart';
import 'package:front/tagbubble.dart';

class DetailStore extends StatefulWidget {
  final bool isWritten;

  final String storeName, introduction, address, recommend, picture, callNumber, workingTime, reviewCount, mainFood, price;
  final double latitude, longitude;

  const DetailStore({
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
    required this.isWritten,
    super.key,
  });

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  final GlobalKey _globalKey = GlobalKey();

  void scrollToWidget() {
    if (widget.isWritten && _globalKey.currentContext != null) {
      Scrollable.ensureVisible(
        _globalKey.currentContext!,
      );
    }
  }

  List<String> good = ["재료가 신선해요", "매장이 깨끗해요", "음식이 맛있어요"];
  List<String> bad = ["음식이 늦게 나와요", "주차가 불편해요", "매장이 시끄러워요"];
  String? selectedValue;
  List<String> items2 = ["최신순", "추천순"];

  List<String> review1 = ["매장이 깨끗해요", "음식이 맛있어요", "음식이 늦게 나와요"];

  // late double percent;
  // late DecorationImage image;
  // _DetailStoreState() {
  //   if (widget.picture == 'assets/background.jpeg') {
  //     image = DecorationImage(
  //       image: AssetImage(widget.picture),
  //       fit: BoxFit.cover,
  //     );
  //   } else {
  //     image = DecorationImage(
  //       image: AssetImage(widget.picture),
  //       //image: NetworkImage(widget.picture!),
  //       fit: BoxFit.cover,
  //     );
  //   }

  //   // 위에서 이미 null일 경우 처리하였으므로 널 체크 연산자 사용 필요 없음
  //   int recommendCount = int.tryParse(widget.recommend ?? '') ?? 0;
  //   int totalCount = int.tryParse(widget.reviewCount ?? '') ?? 1;
  //   percent = (recommendCount / totalCount) * 100;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Transform.translate(
                offset: const Offset(-12, 0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 25,
                ),
              ),
            ],
          ),
          Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    right: 15,
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 248, 240, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 17,
                                color: Color.fromRGBO(88, 192, 108, 1),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -1),
                                child: const Text(
                                  "추천",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(88, 192, 108, 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "81%",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(88, 192, 108, 1),
                                ),
                              )
                            ],
                          ),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.storeName,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                const Text(
                  "한식",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.introduction,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.room, color: Colors.grey[600], size: 16),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  widget.address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                const Icon(
                  size: 16,
                  Icons.map_outlined,
                  color: Colors.grey,
                ),
                const Text(
                  "지도보기",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(242, 242, 246, 1),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "영업 시간",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(widget.workingTime,
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(242, 242, 246, 1),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "전화번호",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(widget.callNumber,
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 246, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "리뷰",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(widget.reviewCount,
                        style: const TextStyle(
                          fontSize: 13,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            thickness: 8,
            color: Colors.grey[200],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "메뉴",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "1",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(204, 241, 201, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -5),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/다운로드.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.mainFood,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(-160, -40),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipPath(
                        clipper: StarClipper(12),
                        child: Container(
                          height: 50,
                          color: Colors.black,
                          child: const Center(
                              child: Text(
                            "WIN !",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: const Text(
                      "VS",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const Text(
                      "주변시세보다",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const Text(
                      "2,500원",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 169, 52, 1)),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: const Text(
                      "저렴해요",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                width: 120,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 242, 246, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -5),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              "주변시세",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.mainFood,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text("${(int.parse(widget.price.replaceAll('원', '')) + 2500).toString()}원",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "짬뽕",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "6,500원",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "주변시세 9,000원",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 169, 52, 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          "탕수육",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "10,500원",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "주변시세 9,000원",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromRGBO(81, 169, 52, 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: Center(child: Text("더보기"))),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 10,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            key: _globalKey,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "리뷰",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.reviewCount,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Center(
            child: Text(
              "추천을 50개 이상 받으면 지자체에 착한가격업소로 신청할 수 있어요",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(88, 192, 108, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Transform.translate(
                        offset: const Offset(20, 12),
                        child: const Text(
                          "추천해요  81%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "19% 별로에요",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(
              0.2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                ClipOval(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(85, 164, 219, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 7.0,
                  runSpacing: 5.0,
                  children: good.map((tagName) {
                    return tagbubble(
                      back: const Color.fromRGBO(232, 245, 254, 1),
                      text: const Color.fromRGBO(85, 164, 219, 1),
                      tagName: tagName,
                      tagCount: 62, // Assuming a constant tag count for all items
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                ClipOval(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(221, 116, 105, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 7.0,
                  runSpacing: 5.0,
                  children: bad.map((tagName) {
                    return tagbubble(
                      back: const Color.fromRGBO(249, 238, 237, 1),
                      text: const Color.fromRGBO(221, 116, 105, 1),
                      tagName: tagName,
                      tagCount: 62, // Assuming a constant tag count for all items
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShowImage(
                    myImage: AssetImage('assets/food1.jpeg'),
                  ),
                  SizedBox(width: 8),
                  ShowImage(
                    myImage: AssetImage('assets/food2.jpeg'),
                  ),
                  SizedBox(width: 8),
                  ShowImage(
                    myImage: AssetImage('assets/food3.jpeg'),
                  ),
                  SizedBox(width: 8),
                  ShowImage(
                    myImage: AssetImage('assets/food1.jpeg'),
                  ),
                  SizedBox(width: 8),
                  ShowImage(
                    myImage: AssetImage('assets/food1.jpeg'),
                  ),
                  SizedBox(width: 8),
                  ShowImage(
                    myImage: AssetImage('assets/food1.jpeg'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 50,
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
          const ReviewWidget(
            authorName: '탱쓰',
            date: '어제',
            isValid: true,
            reviewText: '유성 맛집 인정입니다. 진짜 최고의 맛이고 오늘은 12시 넘어서 갔는데 사람이 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다',
            reviewTags: ['재료가 신선해요', '매장이 깨끗해요', '음식이 늦게 나와요'],
          ),
          const ReviewWidget(
            authorName: '쓰탱',
            date: '1년전',
            isValid: false,
            reviewText: '유성 맛집 인정입니다. 진짜 최고의 맛이고 오늘은 12시 넘어서 갔는데 사람이 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다 냠냠냠 진짜 맛있다',
            reviewTags: ['주차가 불편해요', '매장이 시끄러워요', '음식이 늦게 나와요'],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 22,
                        color: Color.fromRGBO(218, 99, 87, 1),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "찜하기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 248, 240, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.border_color,
                        size: 22,
                        color: Color.fromRGBO(88, 192, 108, 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifyReceipt()));
                        },
                        child: const Text(
                          "리뷰 작성하기",
                          style: TextStyle(
                            color: Color.fromRGBO(88, 192, 108, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final ImageProvider myImage;

  const ShowImage({
    required this.myImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: myImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String authorName;
  final String date;
  final String reviewText;
  final bool isValid;
  final List<String> reviewTags;

  const ReviewWidget({
    super.key,
    required this.authorName,
    required this.isValid,
    required this.date,
    required this.reviewText,
    required this.reviewTags,
  });

  @override
  Widget build(BuildContext context) {
    List<String> good = ["재료가 신선해요", "매장이 깨끗해요", "음식이 맛있어요"];

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(202, 175, 238, 1),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              authorName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            if (isValid)
                              const SizedBox(
                                width: 10,
                              ),
                            if (isValid)
                              const Icon(
                                Icons.check_circle,
                                size: 15,
                                color: Color.fromRGBO(88, 192, 108, 1),
                              ),
                            if (isValid)
                              const Text(
                                "인증리뷰",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(88, 192, 108, 1),
                                ),
                              ),
                            const Spacer(),
                            Text(
                              date,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                strutStyle: const StrutStyle(fontSize: 16),
                                text: TextSpan(
                                  text: reviewText,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/food1.jpeg'),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/food2.jpeg'),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/food3.jpeg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 7.0,
                runSpacing: 5.0,
                children: reviewTags.map((tagName) {
                  Color backColor = good.contains(tagName) ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(249, 238, 237, 1);
                  Color textColor = good.contains(tagName) ? const Color.fromRGBO(85, 164, 219, 1) : const Color.fromRGBO(221, 116, 105, 1);
                  return tagbubble(
                    back: backColor,
                    text: textColor,
                    tagName: tagName,
                    tagCount: 0, // Assuming a constant tag count for all items
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Clip widget in star shape
class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  /// The number of points of the star
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    double width = size.width;

    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 2;

    double degreesPerStep = _degToRad(360 / numberOfPoints) as double;

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * math.pi;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth + bigRadius * math.cos(step), halfWidth + bigRadius * math.sin(step));
      path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep), halfWidth + radius * math.sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }
}
