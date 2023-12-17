import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_project/json_parse/pojo_class.dart';

class MainScreenJsonParse extends StatefulWidget {
  const MainScreenJsonParse({super.key});

  @override
  State<MainScreenJsonParse> createState() => _MainScreenJsonParseState();
}

class _MainScreenJsonParseState extends State<MainScreenJsonParse> {



  PojoClass? allProduct;

  //api part
  Future<void> getDataFormApi() async {
    Uri url=Uri.parse("https://a311.yeapps.com/acme_api_702f//api_client/client_list?cid=ACME&user_id=21429&user_pass=1234");
    http.Response response=await http.get(url);
    print(response.statusCode);
    if(response.statusCode==200){
      allProduct=PojoClass.fromJson(jsonDecode(response.body));
      print(response.body);
      setState(() {

      });

    }

  }

  @override
  void initState() {

    super.initState();
    getDataFormApi();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parse all data"),
      ),
      body: ListView.builder(
          itemCount: allProduct?.clientList?.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                SizedBox(height: 10,),
                Text(allProduct?.clientList?[index].clientName ?? ""),

                Text(allProduct?.clientList?[index].clientId ?? ""),
                Text(allProduct?.clientList?[index].marketName ?? ""),
                Text(allProduct?.clientList?[index].areaId ?? ""),


              ],
            );
          }),
    );
  }
}