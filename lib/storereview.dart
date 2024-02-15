import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:front/detailstore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class StoreReview extends StatefulWidget {
  bool isValid;
  StoreReview({required this.isValid, super.key});

  @override
  State<StoreReview> createState() => _StoreReviewState();
}

class _StoreReviewState extends State<StoreReview> {
  final picker = ImagePicker();
  XFile? image;
  List<XFile?> multiImage = [];
  List<XFile?> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                  "리뷰 작성하기",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              images = await picker.pickMultiImage();
              setState(() {
                images.addAll(multiImage);
              });
            },
            child: Transform.translate(
              offset: const Offset(-100, 0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [4, 4],
                color: const Color.fromRGBO(88, 192, 108, 1),
                strokeWidth: 2,
                child: Card(
                  color: const Color.fromRGBO(238, 248, 240, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
                    width: 140,
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: Color.fromRGBO(88, 192, 108, 1),
                        ),
                        Text(
                          "사진 추가하기",
                          style: TextStyle(
                            color: Color.fromRGBO(88, 192, 108, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                maxLength: 300,
                maxLines: 8,
                style: const TextStyle(
                  decorationThickness: 0,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: InputBorder.none,
                  hintText: '리뷰를 작성해보세요. (300자 이내)\n명예훼손, 욕설 및 비방 표현은 쓰지 말아주세요.',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailStore()));
                  },
                  child: Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(88, 192, 108, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "작성 완료",
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
