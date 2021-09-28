import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lamp App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lâmpada 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String _luzLigada;
  late String _sensorLigado;
  late bool _sensorAtivo;
  late bool _active;

  @override
  void initState() {
    _active = false;
    _sensorAtivo = true;
    _luzLigada = 'DESLIGADA';
    _sensorLigado = 'LIGADO';
  }

  void _sensorClicked() {
    setState(() {
      _active = true;
      _sensorAtivo = false;
      _luzLigada = 'LIGADA';
      _sensorLigado = 'DESLIGADO';
    });
  }

  void _sensorDesligado() {
    setState(() {
      _active = false;
      _sensorAtivo = true;
      _luzLigada = 'DESLIGADA';
      _sensorLigado = 'LIGADO';
    });
  }


  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Card(
                elevation: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('LIGUE/DESLIGUE A LÂMPADA'),
                    ElevatedButton(
                        style: style,
                        onPressed: _sensorClicked,
                        child: const Text('ON',
                        )
                    ),


                    ElevatedButton(
                      style: style,
                      onPressed: _sensorDesligado,
                      child: const Text('OFF'
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Lâmpada do Quarto',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('$_luzLigada'),
                      leading: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.blue[500],
                      ),
                    ),
                        Divider(),
                        ListTile(
                          title: const Text('Sensor de Presença:',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          subtitle: Text('$_sensorLigado'),
                          leading: Icon(
                            Icons.social_distance_rounded,
                            color: Colors.blue[500],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}