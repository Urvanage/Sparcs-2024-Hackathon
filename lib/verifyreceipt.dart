import 'package:flutter/material.dart';
import 'package:front/tagandelse.dart';

class VerifyReceipt extends StatelessWidget {
  const VerifyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Center(
            child: Text(
              "리뷰 작성하기",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(160, -35),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "영수증을 인증",
                style: TextStyle(
                  color: Color.fromRGBO(88, 192, 108, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              Text(
                "하고",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              )
            ],
          ),
          const Center(
            child: Text(
              "더욱 신뢰가는 리뷰를 남겨주세요",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: AssetImage('assets/receipt.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(88, 192, 108, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.border_color,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "영수증 인증하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TagandRecomm(isValid: true)));
            },
            child: Center(
              child: Text(
                "건너뛰기",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
