import 'package:flutter/material.dart';

class TelaAstronauta extends StatelessWidget {
  final String nome;
  final String planeta;
  final int energia;
  final String tipoMissao;

  const TelaAstronauta({
    super.key,
    required this.nome,
    required this.planeta,
    required this.energia,
    required this.tipoMissao,
  });

  String _situacaoMissao() {
    if (energia >= 70) {
      return 'Missão pronta para iniciar';
    } else if (energia >= 40) {
      return 'Missão precisa de preparação';
    } else {
      return 'Energia insuficiente para a missão';
    }
  }

  IconData _iconeTipoMissao() {
    if (tipoMissao == 'Resgate') {
      return Icons.favorite;
    } else if (tipoMissao == 'Pesquisa científica') {
      return Icons.science;
    } else {
      return Icons.explore;
    }
  }

  Color _corTipoMissao() {
    if (tipoMissao == 'Resgate') {
      return Colors.red;
    } else if (tipoMissao == 'Pesquisa científica') {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha do Astronauta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              nome,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.public),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Planeta de destino: $planeta',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Energia: $energia',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_iconeTipoMissao(), color: _corTipoMissao()),
                const SizedBox(width: 6),
                Text(
                  'Tipo de missão: $tipoMissao',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                _situacaoMissao(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
