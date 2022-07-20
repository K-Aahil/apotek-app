import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/transaction_screens.dart';
class SignUpScreen extends StatefulWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}
class _SignUpScreen extends State<SignUpScreen> {
  late TextEditingController namaLengkapController, usernameController, alamatController, passwordController, passwordConfirmController;

  @override
  void initState() {
    namaLengkapController = TextEditingController();
    usernameController  = TextEditingController();
    alamatController  = TextEditingController();
    passwordController  = TextEditingController();
    passwordConfirmController  = TextEditingController();
    super.initState();


  }
  Map<String, String> errorMessages = {};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          'Silahkan isi data pribadi anda!',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  autofocus: true,
                  obscureText: false,
                  controller: namaLengkapController,
                  decoration:  InputDecoration(
                    hintText: 'Nama Lengkap',
                    errorText: errorMessages['namaLengkap'],
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
                TextFormField(
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
                TextFormField(
                  autofocus: true,
                  obscureText: false,
                  controller: alamatController,
                  decoration: const InputDecoration(
                    hintText: 'Alamat',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 21),
                  child: Stack(
                    children: [
                      TextFormField(
                        autofocus: true,
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Kata Sandi',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 21),
                  child: Stack(
                    children: [
                      TextFormField(
                        autofocus: true,
                        obscureText: true,
                        controller: passwordConfirmController,
                        decoration: const InputDecoration(
                          hintText: 'Konfirmasi Kata Sandi',
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: MaterialButton(
                      onPressed: () async {
                        if(namaLengkapController.text.isEmpty){
                          setState(() {
                            errorMessages['namaLengkap'] = "Mohon Diisi";
                          });
                          return;
                        }
                        if(passwordController.text != passwordConfirmController.text){
                          setState(() {
                            errorMessages['passwordController'] = "Tidak sama";
                          });
                          return;
                        }

                        Map<String, dynamic> signUpData = {};
                        signUpData['namaLengkap'] = namaLengkapController.text;
                        signUpData['username'] = usernameController.text;
                        signUpData['alamat'] = alamatController.text;
                        signUpData['password'] = passwordController.text;
                        try {
                          Map<String, dynamic> res = await postAPI("register",
                              signUpData);
                          print(res);
                          if(res['token'] != null){
                            token = res['token'];
                            Navigator.pop(context);
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
                      color: Colors.green,
                      child: const Text(
                        "Daftar",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
