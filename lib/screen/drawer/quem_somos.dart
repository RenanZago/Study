import 'package:flutter/material.dart';

class Creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        title: Text(
          "Quem somos?",
          style: TextStyle(
            fontFamily: "Quando",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Esse aplicativo trata-se de um Trabalho de Conclusão de Curso realizado em 2021, por quatro alunos cursantes do Ensino Técnico de Desenvolvimento de Sistemas Integrado ao Médio, na Etec Elias Nechar Catanduva.\n\nTais alunos são:\nAna Flávia Andrade,\nAna Laura Denadai,\nRaphael Henrique Romera,\nRenan Alves Zago.\n\nA Ideia da criação do Study surgiu da necessidade de unir o útil ao agradável, conciliando os estudos à praticidade e portabilidade de um smartphone.\n\nEsperamos que você, ao utilizar nosso app, possa encontrar um ambiente acolhedor para estudar, realizar anotações, revisar conteúdos e muito mais.\n\nAgradecemos imensamente a todos que possibilitaram, apesar das dificuldades, nossa trajetória até aqui, e principalmente aos mestres, sem eles não seria possível.\n\nDe estudantes, para estudantes.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
          child: ListTile(
            title: Text("\nDúvidas, sugestões? Mande um e-mail para o Feliqin!\n\nfeliqinstudy@gmail.com\n"),
            
          ),
          elevation: 8,
          shadowColor: Colors.blue.shade800,
          margin: EdgeInsets.all(20),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue.shade800, width: 1)
          ),
        )
                      ],
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
