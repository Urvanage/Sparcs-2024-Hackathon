import 'package:flutter/material.dart';
import 'package:front/tagbubble.dart';
import 'package:front/storereview.dart';

class TagandRecomm extends StatefulWidget {
  bool isValid;

  TagandRecomm({required this.isValid, Key? key}) : super(key: key);

  @override
  State<TagandRecomm> createState() => _TagandRecommState();
}

class _TagandRecommState extends State<TagandRecomm> {
  bool _isRecommended = false;
  final bool _isTagSelected = false;
  List<Map<String, List<String>>> good = [
    {
      'taste': ["음식이 맛있어요", "양이 많아요", "양이 적당해요", "가성비가 좋아요", "재료가 신선해요", "매콤해요", "메뉴가 다양해요", "지역 특색을 살린 메뉴가 있어요", "비건용 메뉴가 있어요"]
    },
    {
      'service': ["음식이 빨리 나와요", "친절해요", "배달이 빨라요", "다음에 또 올래요"]
    },
    {
      'facility': ["교통이 편리해요", "매장이 깨끗해요", "매장이 넓어요", "주차가 편해요"]
    },
    {
      'atmosphere': ["연인과 함께 오기 좋아요", "가족과 함께 오기 좋아요", "친구와 함께 오기 좋아요", "혼밥하기 좋아요", "아늑해요", "매장이 조용해요", "사람이 많아요"]
    },
  ];

  List<Map<String, List<String>>> bad = [
    {
      'taste': ["간이 세요", "간이 약해요", "양이 적어요", "향신료가 강해요"]
    },
    {
      'service': ["음식이 늦게 나와요", "불친절해요", "배달이 느려요"]
    },
    {
      'facility': ["매장이 더러워요", "교통이 불편해요", "주차가 불편해요", "매장이 좁아요"]
    },
    {
      'atmosphere': ["매장이 시끄러워요", "사람이 적어요"]
    },
  ];

  List<String> taste = ["음식이 맛있어요", "양이 많아요", "양이 적당해요", "양이 적어요", "가성비가 좋아요", "재료가 신선해요", "매콤해요", "간이 세요", "간이 약해요", "향신료가 강해요", "메뉴가 다양해요", "지역 특색을 살린 메뉴가 있어요", "비건용 메뉴가 있어요"];
  List<String> service = ["음식이 빨리 나와요", "음식이 늦게 나와요", "친절해요", "불친절해요", "배달이 빨라요", "배달이 느려요", "다음에 또 올래요"];
  List<String> facility = ["매장이 깨끗해요", "매장이 더러워요", "교통이 편리해요", "교통이 불편해요", "주차가 편해요", "주차가 불편해요", "매장이 넓어요", "매장이 좁아요"];
  List<String> atmosphere = ["연인과 함께 오기 좋아요", "가족과 함께 오기 좋아요", "친구와 함께 오기 좋아요", "혼밥하기 좋아요", "아늑해요", "매장이 시끄러워요", "매장이 조용해요", "사람이 많아요", "사람이 적어요"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "2024. 02. 15(목)",
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "12:32",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                if (widget.isValid)
                  const Icon(
                    Icons.check_circle,
                    size: 15,
                    color: Color.fromRGBO(88, 192, 108, 1),
                  ),
                if (widget.isValid)
                  const SizedBox(
                    width: 3,
                  ),
                if (widget.isValid)
                  const Text(
                    "인증완료",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(88, 192, 108, 1),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/background.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Transform.translate(
                  offset: const Offset(0, -8),
                  child: const Column(
                    children: [
                      Text(
                        "뒤집어진 뚝배기",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "짜장면 2, 탕수육 1",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero, // Set this
                    padding: EdgeInsets.zero,

                    backgroundColor: const Color.fromRGBO(242, 242, 246, 1),
                    elevation: 0, // Setting elevation to 0 to remove shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      "정보 수정",
                      style: TextStyle(
                        color: Color.fromRGBO(148, 148, 153, 1),
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              thickness: 12,
              color: Color.fromRGBO(242, 242, 246, 1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  "추천",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "*필수",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(88, 192, 108, 1),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "추천하는 사람이 많을수록 가게가 상단에 표시돼요",
                  style: TextStyle(
                    color: Color.fromRGBO(148, 148, 153, 1),
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isRecommended = true;
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _isRecommended ? const Color.fromRGBO(78, 159, 217, 1) : const Color.fromRGBO(232, 245, 254, 1),
                    ),
                    child: Center(
                      child: Text(
                        "추천해요",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: _isRecommended ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(78, 159, 217, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isRecommended = false;
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _isRecommended ? const Color.fromRGBO(249, 238, 237, 1) : const Color.fromRGBO(218, 99, 87, 1),
                    ),
                    child: Center(
                      child: Text(
                        "추천안해요",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: _isRecommended ? const Color.fromRGBO(218, 99, 87, 1) : const Color.fromRGBO(249, 238, 237, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              thickness: 10,
              color: Color.fromRGBO(242, 242, 246, 1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  "태그",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "*필수",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(88, 192, 108, 1),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "방문객들을 위해 자세한 평가를 남겨주세요(1~6개)",
                  style: TextStyle(
                    color: Color.fromRGBO(148, 148, 153, 1),
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  "🍜 음식/맛",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: taste.map((tagName) {
                  Color backColor = good.any((map) => map['taste'] != null && map['taste']!.contains(tagName)) ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(249, 238, 237, 1);
                  Color textColor = good.any((map) => map['taste'] != null && map['taste']!.contains(tagName)) ? const Color.fromRGBO(85, 164, 219, 1) : const Color.fromRGBO(221, 116, 105, 1);
                  return Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: tagbubble(
                      back: backColor,
                      text: textColor,
                      tagName: tagName,
                      tagCount: 0, // Assuming a constant tag count for all items
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  "💁🏻 서비스",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: service.map((tagName) {
                  Color backColor = good.any((map) => map['service'] != null && map['service']!.contains(tagName)) ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(249, 238, 237, 1);
                  Color textColor = good.any((map) => map['service'] != null && map['service']!.contains(tagName)) ? const Color.fromRGBO(85, 164, 219, 1) : const Color.fromRGBO(221, 116, 105, 1);
                  return Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: GestureDetector(
                      onTap: () {
                        // 태그를 눌렀을 때 수행할 작업
                        setState(() {
                          // backColor와 textColor를 서로 바꾸는 예시
                          Color temp = backColor;
                          backColor = textColor;
                          textColor = temp;
                        });
                      },
                      child: tagbubble(
                        back: backColor,
                        text: textColor,
                        tagName: tagName,
                        tagCount: 0, // Assuming a constant tag count for all items
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  "🏡 시설",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: facility.map((tagName) {
                  Color backColor = good.any((map) => map['facility'] != null && map['facility']!.contains(tagName)) ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(249, 238, 237, 1);
                  Color textColor = good.any((map) => map['facility'] != null && map['facility']!.contains(tagName)) ? const Color.fromRGBO(85, 164, 219, 1) : const Color.fromRGBO(221, 116, 105, 1);
                  return Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: tagbubble(
                      back: backColor,
                      text: textColor,
                      tagName: tagName,
                      tagCount: 0, // Assuming a constant tag count for all items
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(
                  "🛋 분위기",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: atmosphere.map((tagName) {
                  Color backColor = good.any((map) => map['atmosphere'] != null && map['atmosphere']!.contains(tagName)) ? const Color.fromRGBO(232, 245, 254, 1) : const Color.fromRGBO(249, 238, 237, 1);
                  Color textColor = good.any((map) => map['atmosphere'] != null && map['atmosphere']!.contains(tagName)) ? const Color.fromRGBO(85, 164, 219, 1) : const Color.fromRGBO(221, 116, 105, 1);
                  return Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: tagbubble(
                      back: backColor,
                      text: textColor,
                      tagName: tagName,
                      tagCount: 0, // Assuming a constant tag count for all items
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "이전",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoreReview(
                              isValid: true,
                            )));
                  },
                  child: Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _isTagSelected ? const Color.fromRGBO(88, 192, 108, 1) : const Color.fromRGBO(197, 235, 203, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "다음",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
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

//Color.fromRGBO(88, 192, 108, 1),