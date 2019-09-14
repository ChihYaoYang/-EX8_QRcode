import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _leitura = "Faça a leitura";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leitura QRCode"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              _read();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(_leitura),
      ),
    );
  }

  Future<String> _read() async {
    String futureString = await new QRCodeReader().scan();
    setState(() {
      _leitura = futureString.toString();
    });
  }
}
