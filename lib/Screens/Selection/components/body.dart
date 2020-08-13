import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mockup/Screens/Home/home_screen.dart';
import 'package:mockup/components/rounded_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'background.dart';

enum requestAs { tenant, owner }

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //
  final _formKey = GlobalKey<FormState>();
  requestAs _character = requestAs.owner;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: EdgeInsets.all(4),
              children: <Widget>[
                Center(
                  child: Text(
                    "Select your property",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(18)),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select your State ",
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["Gujarat", "Maharastra"],
                  label: "Your State *",
                  showClearButton: true,
                  onChanged: print,
                  selectedItem: "Gujarat",
                  // selectedItem: _selectedSState,
                  maxHeight: getProportionateScreenHeight(140.0),
                ),
                Divider(),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select your City ",
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["Surat", "Ahmedabad", "Vapi", "Valsad", "Navsari"],
                  label: "Your City *",
                  showClearButton: true,
                  onChanged: print,
                  selectedItem: "Surat",
                ),
                Divider(),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select your Society ",
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: [
                    "Demo Society 1",
                    "Demo Society 2",
                    "Demo Society 3",
                    "Demo Society 4"
                  ],
                  label: "Your Society *",
                  showClearButton: true,
                  onChanged: print,
                  // selectedItem: "Demo Society 1",
                ),
                Divider(),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select your Society Wing",
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: [
                    "A",
                    "B",
                    "C",
                    "D",
                    "E",
                  ],
                  // label: "Your Society Wing *",
                  showClearButton: true,
                  onChanged: print,
                  // selectedItem: "A",
                ),
                Divider(),
                DropdownSearch<String>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select your Property",
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: [
                    "101",
                    "102",
                    "103",
                    "104",
                  ],
                  label: "Your Society Property *",
                  showClearButton: true,
                  onChanged: print,
                  // selectedItem: "102",
                ),
                Divider(),
                ListTile(
                  title: const Text('Request as Owner'),
                  leading: Radio(
                    value: requestAs.owner,
                    groupValue: _character,
                    onChanged: (requestAs value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Request as Tanent'),
                  leading: Radio(
                    value: requestAs.tenant,
                    groupValue: _character,
                    onChanged: (requestAs value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                Divider(),
                RoundedButton(
                  text: "REQUEST ACCESS",
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
