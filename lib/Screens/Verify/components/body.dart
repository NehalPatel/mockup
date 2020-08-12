import 'package:flutter/material.dart';
import 'package:mockup/Screens/Home/home_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String string = '';
  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';
  bool verify = false;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Verify Your Mobile Number",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(18)),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: '4 digit code sent to ',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: kTextColor),
                  ),
                  TextSpan(
                    text: '+91 955 881 5342',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _inputFields(code1),
                  _inputFields(code2),
                  _inputFields(code3),
                  _inputFields(code4),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 0),
                  child: OutlineButton(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    textColor: Colors.red,
                    color: Colors.red,
                    borderSide: BorderSide(color: Colors.red),
                    child: Text(
                      'Resend',
                      style: TextStyle(),
                    ),
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: verify ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        if (!verify) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.check),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('1'),
                      _createCalcButton('2'),
                      _createCalcButton('3'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('4'),
                      _createCalcButton('5'),
                      _createCalcButton('6'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('7'),
                      _createCalcButton('8'),
                      _createCalcButton('9'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton(''),
                      _createCalcButton('0'),
                      InkWell(
                        borderRadius: BorderRadius.circular(45),
                        onTap: () {
                          deleteCode();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(shape: BoxShape.circle),
                          width: 50,
                          height: 50,
                          child: Icon(Icons.backspace),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 85,
      child: Text(
        s,
        style: TextStyle(fontSize: 28),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _createCalcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          updateCode(value);
        },
        child: Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(shape: BoxShape.circle),
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  void updateCode(String value) {
    switch (string.length) {
      case 0:
        {
          setState(() {
            code1 = value;
          });
          break;
        }
      case 1:
        {
          setState(() {
            code2 = value;
          });
          break;
        }
      case 2:
        {
          setState(() {
            code3 = value;
          });
          break;
        }
      case 3:
        {
          setState(() {
            code4 = value;
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string += value;
    print(string);
    if (string.length > 3) {
      setState(() {
        verify = true;
      });
      return;
    } else {
      return;
    }
  }

  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          setState(() {
            code1 = '';
          });
          break;
        }
      case 2:
        {
          setState(() {
            code2 = '';
          });
          break;
        }
      case 3:
        {
          setState(() {
            code3 = '';
          });
          break;
        }
      case 4:
        {
          setState(() {
            code4 = '';
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string = string.substring(0, string.length - 1);
    if (string.length < 4) {
      setState(() {
        verify = false;
      });
    }
    print(string);
  }
}
