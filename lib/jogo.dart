import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage('images/padrao.png'); // (escolha do app)
  var _mensagem = 'Escolha uma opção abaixo:';

  _opcaoSelecionada(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    // Exibição da imagem escolhida pelo app
    switch( escolhaApp ) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage('images/papel.png');
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }
    _validarGanhador(escolhaUsuario, escolhaApp);
  }

  _validarGanhador(String escolhaUsuario, String escolhaApp) {
    if (
      (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
      (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
      (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
    ) {
      setState(() {
        _mensagem = 'Você PERDEU! >:)';
      });
    } else if (
      (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
      (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
      (escolhaApp == 'papel' && escolhaUsuario == 'pedra')
    ) {
      setState(() {
        _mensagem = 'Você VENCEU! >:|';
      });
    } else {
      _mensagem = 'Empatamos! ;)';
    }
  }

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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Image(image: _imagemApp,),
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('images/tesoura.png', height: 100),
              ),
              /*

              Image.asset('images/papel.png'),
              Image.asset('images/tesoura.png'),
              */
            ],
          )
        ],
    )

    );
    }
}
