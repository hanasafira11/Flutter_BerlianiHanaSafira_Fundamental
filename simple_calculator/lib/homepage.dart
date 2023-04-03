import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double angkaHasil = 0;
  var txtAngka1 = TextEditingController();
  var txtAngka2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          SizedBox(height: 57),
          isiAngka('Angka Pertama', txtAngka1),
          SizedBox(height: 36),
          isiAngka('Angka Kedua', txtAngka2),
          SizedBox(height: 50),
          hasil(),
          SizedBox(height: 57),
          Row(
            children: [
              tombolKiri(penjumlahan, '+'),
              SizedBox(width: 42),
              tombolKanan(pengurangan, '-'),
            ],
          ),
          SizedBox(height: 36),
          Row(
            children: [
              tombolKiri(perkalian, 'X'),
              SizedBox(width: 42),
              tombolKanan(pembagian, ':'),
            ],
          ),
        ],
      ),
    ));
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
        child: Container(
          height: 80,
          color: Color(0xFFFF7A00),
          child: Container(
            margin: EdgeInsets.only(top: 28, bottom: 28, left: 42),
            child: Text('Calculator',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF))),
          ),
        ),
        preferredSize: Size.fromHeight(80));
  }

  Widget isiAngka(String hurufKu, TextEditingController controller) {
    return Container(
      height: 70,
      width: 317,
      margin: EdgeInsets.only(left: 36, right: 36),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hurufKu,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.black, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: Colors.black, width: 3))),
      ),
    );
  }

  Widget hasil() {
    return Container(
      height: 116,
      width: 317,
      margin: EdgeInsets.only(left: 36, right: 36),
      color: Color(0xFFFFE7D1),
      child: Center(child: Text('$angkaHasil', style: TextStyle(fontSize: 40))),
    );
  }

  Widget tombolKiri(VoidCallback pasDitekan, String simbol) {
    return Container(
      width: 120,
      height: 80,
      margin: EdgeInsets.only(left: 54),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            textStyle: TextStyle(
              fontSize: 40,
            ),
          ),
          onPressed: pasDitekan,
          child: Center(child: Text(simbol))),
    );
  }

  Widget tombolKanan(VoidCallback pasDitekan, String simbol) {
    return Container(
      width: 120,
      height: 80,
      margin: EdgeInsets.only(right: 54),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            textStyle: TextStyle(
              fontSize: 40,
            ),
          ),
          onPressed: pasDitekan,
          child: Center(child: Text(simbol))),
    );
  }

  void penjumlahan() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) + double.parse(txtAngka2.text);
    });
  }

  void pengurangan() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) - double.parse(txtAngka2.text);
    });
  }

  void perkalian() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) * double.parse(txtAngka2.text);
    });
  }

  void pembagian() {
    setState(() {
      angkaHasil = double.parse(txtAngka1.text) / double.parse(txtAngka2.text);
    });
  }
}
