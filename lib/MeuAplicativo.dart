import 'package:flutter/material.dart';
import 'package:study/components/preferencia_tema.dart';
import 'services/auth_check.dart';


class MeuAplicativo extends StatefulWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  _MeuAplicativoState createState() => _MeuAplicativoState();
}

class _MeuAplicativoState extends State<MeuAplicativo>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    PreferenciaTema.setTema();
    super.initState();
  }

   @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    PreferenciaTema.setTema();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PreferenciaTema.tema,
      builder: (BuildContext context, Brightness tema, _) => MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: "Study",
        theme: ThemeData(
          brightness: tema,
           primaryColor: Colors.blue[800],
        ),
        home: AuthCheck(),
      ),
    );
  }
}
