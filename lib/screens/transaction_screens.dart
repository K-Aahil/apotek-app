import 'package:flutter/material.dart';
import 'package:untitled/screens/invoice_screens.dart';

class TransactionScreens extends StatelessWidget {
  const TransactionScreens({Key? key}) : super(key: key);

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
            decoration: const InputDecoration(
              hintText: '[Onat 1, Obat 2, Obat 3]',
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
}
