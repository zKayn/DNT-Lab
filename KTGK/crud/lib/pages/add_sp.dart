import 'package:crud/service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddSp extends StatefulWidget {
  const AddSp({super.key});

  @override
  State<AddSp> createState() => _AddSpState();
}

class _AddSpState extends State<AddSp> {
  TextEditingController tencontroller = new TextEditingController();
  TextEditingController giacontroller = new TextEditingController();
  TextEditingController loaicontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(
                  width: 110.0,
                ),
                Text(
                  "Thêm Sản Phẩm",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Tên Sản Phẩm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: tencontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Nhập tên sản phẩm"),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Giá Sản Phẩm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: giacontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Nhập giá sản phẩm"),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Loại Sản Phẩm",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: loaicontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Nhập loại sản phẩm"),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () async {
                if (tencontroller.text != "" &&
                    giacontroller.text != "" &&
                    loaicontroller.text != "") {
                  String addID = randomAlphaNumeric(10);
                  Map<String, dynamic> spInfoMap = {
                    "Tên": tencontroller.text,
                    "Giá": giacontroller.text,
                    "Loại": loaicontroller.text,
                    "Absent": false,
                    "Present": false,
                  };
                  await DatabaseMethods().AddSp(spInfoMap, addID).then((value) {
                    tencontroller.text = "";
                    giacontroller.text = "";
                    loaicontroller.text = "";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Thêm thành công",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )));
                  });
                }
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Thêm Sản Phẩm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
