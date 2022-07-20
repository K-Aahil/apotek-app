import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/invoice_screens.dart';

class TransactionScreens extends StatefulWidget {
  const TransactionScreens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TransactionScreens();
  }
}

class _TransactionScreens extends State<TransactionScreens> {
  Map<String, dynamic> drugs = {};
  List<String> types = [], drugsList = [];

  @override
  void initState() {
    _getDrugs().then((value) {
      setState(() {
        drugs = value;
        for (String s in drugs.keys) {
          drugsList.add(s);
        }
      });
    });
    _getDrugsType().then((value) {
      setState(() {
        types = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                    'Tambah',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Nama Pasien',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          TextFormField(
            autofocus: true,
            obscureText: false,
            readOnly: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    const drugsType = ["aaa", 'bbb'];
                    Map<String, bool> yes = {};
                    return StatefulBuilder(builder: (context, setState) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: Container()),
                              Container(
                                  color: Colors.white,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: ListView(
                                      children: drugsType.map((String key) {
                                        return CheckboxListTile(
                                          title: Text(key),
                                          value: yes[key] ?? false,
                                          onChanged: (bool? value) {
                                            print('${key}: ${value}');
                                            setState(() {
                                              yes[key] = value ?? false;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            },
            decoration: const InputDecoration(
              hintText: 'Masukkan Nama Pasien',
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
          //On the left side of the screen under SECURITY, click on Network Access.
          // Click the green Add IP Address button.
          // In the modal, click the ALLOW ACCESS FROM ANYWHERE button. You should see 0.0. 0.0/0 in the Access List Entry field.
          // Click the green Confirm button.

          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Pilih Nama Obat',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Pilih Obat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          TextFormField(
            obscureText: false,
            readOnly: true,
            onTap: () {
              //if(drugsList.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    List<String> selectedDrugs = [];
                    return FutureBuilder<Map<String, dynamic>>(
                        future: _getDrugs(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> data = snapshot.data!;
                            List<String> listData = [];
                            data.forEach((key, value) {
                              listData.add(key);
                            });
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Expanded(child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )),

                                      Container(
                                          color: Colors.white,
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  style: TextStyle(
                                                      backgroundColor: Colors.white
                                                  ),

                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: listData.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      Map<String, dynamic> drug =
                                                          data[listData[index]];
                                                      String name =
                                                          drug['name'] ?? "";
                                                      return CheckboxListTile(
                                                        title: Text(name),
                                                        value: selectedDrugs
                                                            .contains(name),
                                                        onChanged: (bool? value) {
                                                          print('${name}: ${value}');
                                                          setState(() {
                                                            if ((value ?? false)) {
                                                              selectedDrugs.add(name);
                                                            } else {
                                                              selectedDrugs
                                                                  .remove(name);
                                                            }
                                                          });
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            });
                          }
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            Navigator.pop(context);
                          }
                          return Container();
                        });
                  });
              //  }
            },
            decoration: const InputDecoration(
              hintText: '[Obat 1, Obat 2, Obat 3]',
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
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Pilih Jenis Obat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          TextFormField(
            obscureText: false,
            readOnly: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return FutureBuilder<List<String>>(
                        future: _getDrugsType(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<String> listData = snapshot.data!;

                            return StatefulBuilder(
                                builder: (context, setState) {
                                  return Scaffold(
                                    backgroundColor: Colors.transparent,
                                    body: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Expanded(child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          )),

                                          Container(
                                              color: Colors.white,
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.5,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      style: TextStyle(
                                                          backgroundColor: Colors.white
                                                      ),

                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        itemCount: listData.length,
                                                        itemBuilder:
                                                            (BuildContext context,
                                                            int index) {
                                                          String name = listData[index];
                                                          return MaterialButton(onPressed: (){

                                                          }, child:Text(name),);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            Navigator.pop(context);
                          }
                          return Container();
                        });
                  });
            },
            decoration: const InputDecoration(
              hintText: '[Tablet, Syrup]',
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
          Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Subtotal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp. 10.000',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InvoiceScreens(),
                  ),
                ),
                color: Colors.green,
                child: const Text(
                  "Tambah",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<Map<String, dynamic>> _getDrugs() async {
    Map<String, dynamic> a = await getAPI("drugs");
    Map<String, dynamic> drugsLocal = {};
    if (a['drugs'] != null) {
      for (Map<String, dynamic> drug in a['drugs']) {
        drugsLocal[drug['name']] = drug;
        drugsList = [];
        for (String s in drugsLocal.keys) {
          drugsList.add(s);
        }
        drugs = drugsLocal;

      }
      return drugsLocal;
    }
    return {};
  }

  Future<List<String>> _getDrugsType() async {
    Map<String, dynamic> a = await getAPI("drugsType");
    if (a['drugsType'] != null) {
      List<String> aaaaaa = [];
      for(String a in  a['drugsType']){
        aaaaaa.add(a);
      }
      return aaaaaa;
    }
    return [];
  }

  Future<List<String>> _getDrugsList() async {
    Map<String, dynamic> drugsData = await _getDrugs();

    List<String> drugs = [];
    for (String key in drugsData.keys) {
      drugs.add(key);
    }
    return drugs;
  }
}
