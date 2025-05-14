import 'package:flutter/material.dart';
import '../widgets/receipt_item_card.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  List<Map<String, dynamic>> receiptItems = [
    {'name': 'Americano', 'subTitle': 'เข้มข้น หอมกรุ่น', 'price': 50, 'quantity': 1},
    {'name': 'Latte', 'subTitle': 'นุ่มละมุน หวานมัน', 'price': 60, 'quantity': 1},
    {'name': 'Mocha', 'subTitle': 'ช็อกโกแลตผสมกาแฟ', 'price': 70, 'quantity': 1},
  ];

  int getTotalPrice() {
    return receiptItems.fold(0, (sum, item) {
      final price = item['price'] ?? 0;
      final quantity = item['quantity'] ?? 0;
      return sum + (price as int) * (quantity as int);
    });
  }

  int getDiscount() {
    int total = getTotalPrice();
    return total >= 150 ? 10 : 0;
  }

  int getFinalPrice() {
    return getTotalPrice() - getDiscount();
  }

  Widget buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 🔶 พื้นหลัง
        Positioned(
          top: 0, // ล้นออกมาได้เหมือน absolute
          child: Container(
            height: 220,
            width: 1000,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(252, 77, 32, 1),
            ),
          ),
        ),
        Container(
          height: 137,
          decoration: const BoxDecoration(
            color: Color(0xFF5D2B1A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),

        // 🔙 Back + Title (จัด Row ปกติ)
        Positioned(
          top: 40,
          left: 16,
          child: Row(
            children: const [
              Icon(Icons.arrow_back, color: Colors.orangeAccent, size: 24),
              SizedBox(width: 12),
              Text(
                "THANK YOU FOR\nTHE ORDER!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(252, 77, 32, 1),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 152,
          left: 16,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF5D2B1A),
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Column(
              children: [
                Text(
                  'TRACK YOUR ORDER',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(252, 77, 32, 1),
                  ),
                ),
              ],
            )
          ),
        ),
        Positioned(
          top: -28,
          right: -40,
          child: Image.asset(
            'assets/smoke.png',
            height: 200,
          ),
        ),
        Positioned(
          top: 60,
          right: 20,
          child: Image.asset(
            'assets/pink_coffee_cup.png',
            height: 180,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF2E9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order: XXXXXXXXXXXX",
                  style: TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(72, 38, 29, 1),
                  )
                ),
                Text(
                  "DD / MM / YY",
                  style: TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(72, 38, 29, 1),
                  )
                ),
              ],
            )
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color.fromRGBO(72, 38, 29, 1),
              thickness: 3,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PURCHASE CONFIRMATION DETAILS",
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(72, 38, 29, 1),
                  )
                ),
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: receiptItems.length + 1,
              itemBuilder: (context, index) {
                if (index < receiptItems.length) {
                  final item = receiptItems[index];
                  return ReceiptItemCard(
                    title: item['name'],
                    subTitle: item['subTitle'] ?? '',
                    price: item['price'].toString(),
                    quantity: item['quantity'],
                  );
                }
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF5D2B1A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87,
                            blurRadius: 10,
                            offset: Offset(8, 10),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 16, 40, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "CART",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${getTotalPrice()} BAHT",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "DISCOUNT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "-${getDiscount()} BAHT",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "TOTAL",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${getFinalPrice()} BAHT",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}
