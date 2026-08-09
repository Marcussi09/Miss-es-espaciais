import 'package:flutter/material.dart';
import '../widgets/card_missao.dart';
import 'tela_astronauta.dart';

class TelaMissao extends StatefulWidget {
  const TelaMissao({super.key});

  @override
  State<TelaMissao> createState() => _TelaMissaoState();
}

class _TelaMissaoState extends State<TelaMissao> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _planetaController = TextEditingController();

  int _energia = 50;
  String _tipoMissao = 'Exploração';

  @override
  void dispose() {
    _nomeController.dispose();
    _planetaController.dispose();
    super.dispose();
  }

  void _aumentarEnergia() {
    setState(() {
      if (_energia < 100) {
        _energia += 10;
        if (_energia > 100) {
          _energia = 100;
        }
      }
    });
  }

  void _diminuirEnergia() {
    setState(() {
      if (_energia > 0) {
        _energia -= 10;
        if (_energia < 0) {
          _energia = 0;
        }
      }
    });
  }

  void _visualizarMissao() {
    if (_nomeController.text.isEmpty || _planetaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha o nome e o planeta de destino')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaAstronauta(
          nome: _nomeController.text,
          planeta: _planetaController.text,
          energia: _energia,
          tipoMissao: _tipoMissao,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Central de Missões'),
        leading: const Icon(Icons.rocket_launch),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do astronauta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _planetaController,
              decoration: const InputDecoration(
                labelText: 'Planeta de destino',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _tipoMissao,
              decoration: const InputDecoration(
                labelText: 'Tipo de missão',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Exploração', child: Text('Exploração')),
                DropdownMenuItem(value: 'Resgate', child: Text('Resgate')),
                DropdownMenuItem(value: 'Pesquisa científica', child: Text('Pesquisa científica')),
              ],
              onChanged: (valor) {
                setState(() {
                  _tipoMissao = valor!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Energia atual: $_energia',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _aumentarEnergia,
                    child: const Text('Aumentar energia'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _diminuirEnergia,
                    child: const Text('Diminuir energia'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Etapas da missão',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const CardMissao(
              icone: Icons.rocket_launch,
              titulo: 'Preparação',
              descricao: 'Verifique todos os equipamentos da nave.',
            ),
            const CardMissao(
              icone: Icons.public,
              titulo: 'Viagem espacial',
              descricao: 'A nave viaja pelo espaço até o planeta de destino.',
            ),
            const CardMissao(
              icone: Icons.terrain,
              titulo: 'Exploração do planeta',
              descricao: 'O astronauta explora o planeta e coleta dados.',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _visualizarMissao,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Visualizar missão'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
