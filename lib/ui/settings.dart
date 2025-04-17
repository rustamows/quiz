import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 32),
          Align(alignment: Alignment.topLeft,
            child: Text(
              '   Setting',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 34),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),child: Padding(padding: EdgeInsets.all(10),child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Share this app'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],),
            ),),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),child: Padding(padding: EdgeInsets.all(10),child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rate us'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],),
            ),),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffEEEEEE)),
            ),child: Padding(padding: EdgeInsets.all(10),child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Leave feedback'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],),
            ),),
          ),
          InkWell(
            onTap: () async{
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              //  sharedPreferences.clear();
              sharedPreferences.remove('histories');
            },
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffEEEEEE)),
              ),child: Padding(padding: EdgeInsets.all(10),child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Clear history'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ],),
              ),),
            ),
          ),
          SizedBox(height: 350,),
          Text('v1.0.0')
        ],
      ),
    );
  }
}
