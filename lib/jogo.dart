import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JokenPo',
          style: TextStyle(
              color: Colors.white),
          ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            'Escolha do app',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ),
          GestureDetector(
            onTap: (){ print('Imagem clicada!'); } ,
            onDoubleTap: () { print('Dois cliques na imagem!'); } ,
            child: Image.asset('images/padrao.png'),
          ),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha uma opção abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            children: [
              Image.asset('images/pedra.png'),
              Image.asset('images/papel.png'),
              Image.asset('images/tesoura.png'),
            ],
          )
        ],
    )

    );
    }
}
