import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/screens/transaction_screens.dart';

import 'welcome/sign_up_screen.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

const serverURL = "https://plucky-mulberry-caterpillar.glitch.me/";
String? token;
Future<Map<String, dynamic>> getAPI(String path) async{
  Uri url = Uri.parse(serverURL+path);
  Map<String, String> header = {};
  if(token != null){
    header['Authorization'] = token!;
  }

  var response = await http.get(url, headers: header);
  return json.decode(response.body);
}

Future<Map<String, dynamic>> postAPI(String path, Map<String, dynamic> data) async{
  Uri url = Uri.parse(serverURL+path);
  Map<String, String> header = {};
  if(token != null){
    header['Authorization'] = token!;
  }
  var response = await http.post(url, body: data, headers: header);
  return json.decode(response.body);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: ''),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController usernameController, passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 100, 30, 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'assets/puskesmas.svg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    color: Colors.green,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 33, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Hi,',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                      child: Row (
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'Selamat Datang!',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            'Isi data pribadi anda',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],

                //  aku adalah akan ei efoaohf dfeao kkan jjw
                //  kenapa sih pada berisik bangsat aing lieu yeuh babo g
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Stack(
                  children: [
                    TextFormField(
                      autofocus: true,
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment(1, 0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: MaterialButton(
                      onPressed: () async{
                        Map<String, dynamic> data = {
                          "username": usernameController.text,
                          "password": passwordController.text
                        };
                        try {
                          var result = await postAPI("login", data);
                          if(result['token'] != null){
                            token = result['token'];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionScreens(),
                                ));
                          }
                        }catch(e){
                          print(e);
                        }
                      },
                      color: Colors.grey[300],
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 17, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: MaterialButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                      color: Colors.green,
                      child: const Text(
                        "Daftar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
// This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
