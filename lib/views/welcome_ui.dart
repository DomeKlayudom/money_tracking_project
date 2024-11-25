import 'package:flutter/material.dart';
import 'package:money_tracking_project/views/login_ui.dart';

class WelcomeUi extends StatefulWidget {
  const WelcomeUi({super.key});

  @override
  State<WelcomeUi> createState() => _WelcomeUiState();
}

class _WelcomeUiState extends State<WelcomeUi> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 248, 247, 1),
      body: Stack(
        children: [
          // รูปภาพ
          Positioned(
            top: screenHeight * 0.1, // Adjust the top margin
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/Man.png',
              ),
            ),
          ),
          // ข้อความและปุ่ม
          Positioned(
            bottom: screenHeight * 0.05, // Adjust the bottom margin
            left: screenWidth * 0.05, // Add left padding for better alignment
            right: screenWidth * 0.05, // Add right padding for better alignment
            child: Column(
              children: [
                Text(
                  "บันทึก\nรายรับรายจ่าย",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: const Color.fromRGBO(67, 136, 131, 1),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    //กดเพื่อไปหน้า login
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginUi()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(105, 174, 169, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: screenHeight * 0.02,
                    ),
                    elevation: 0, // Remove the default elevation
                  ).copyWith(
                    shadowColor: WidgetStateProperty.all(Colors.black),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 30, // ระยะเงา
                          spreadRadius: 5,
                          // ระยะห่างของเงา
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "เริ่มใช้งานแอปพลิเคชัน",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "ยังไม่ได้ลงทะเบียน? ลงทะเบียน",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
