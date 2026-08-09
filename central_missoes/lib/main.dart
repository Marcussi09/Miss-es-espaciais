import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/tela_missao.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Central de Missões',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TelaMissao(),
    );
  }
}
