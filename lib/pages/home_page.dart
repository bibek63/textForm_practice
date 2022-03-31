import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController textFormField = TextEditingController();
  String textFormFieldText = "";
  String? passwordError = null;
  String passwordNamed = "";
  bool isHidden = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Naam",
                    hintText: "Jalebi bahi",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: address,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(185, 156, 247, 190),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green,
                    )),
                    labelText: "Thegana",
                    hintText: "Tero Thau Bhan",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    errorText: passwordError,
                    fillColor: Color.fromARGB(185, 156, 247, 190),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green,
                    )),
                    labelText: "Password",
                    hintText: "Seccu password deu",
                    prefixIcon: IconButton(
                      onPressed: () => setState(() {
                        if (isHidden == false) {
                          isHidden = true;
                        } else {
                          isHidden = false;
                        }
                      }),
                      icon: Icon(
                          isHidden ? Icons.visibility : Icons.visibility_off),
                      color: Colors.pinkAccent,
                    ),
                  ),
                  obscureText: isHidden,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null || value.length < 3) {
                      textFormFieldText = "";
                      return "Enter atleast xcfvsx3 digits data";
                    } else {
                      textFormFieldText = textFormField.text;
                      return null;
                    }
                  },
                  controller: textFormField,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(185, 156, 247, 190),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green,
                    )),
                    labelText: "Bibek",
                    hintText: "Tero Thau Bhan",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _formkey.currentState?.validate();
                      if (password.text.length < 8) {
                        passwordError = "8 ota chac hal jatha";
                        password.text = "";
                        return;
                      } else {
                        passwordError = null;
                        passwordNamed = password.text;
                      }
                    });
                  },
                  child: Text("Press Me!!!")),
              Text(
                  "Your name is ${name.text}, your address is ${address.text} and your password is $passwordNamed....buhahah hacker also $textFormFieldText"),
            ]),
          ),
        ),
      ),
    );
  }
}
