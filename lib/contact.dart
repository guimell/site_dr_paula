import 'package:flutter/material.dart';
import 'widgets.dart';
import 'config.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: SiteConfig.getAppBar(context, "Contato"),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: SiteConfig.screenHeight * 0.8,
              width: SiteConfig.screenHeight * 0.8,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color:
                    MediaQuery.platformBrightnessOf(context) == Brightness.light
                        ? Colors.white
                        : Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Contato",
                          style: TextStyle(
                              fontSize: 20,
                              color: MediaQuery.platformBrightnessOf(context) ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                      const MyTextField(
                        labelText: 'Nome :',
                      ),
                      const MyTextField(
                        labelText: 'Sobrenome :',
                      ),
                      const MyTextField(
                        labelText: 'Nome da empresa :',
                      ),
                      const MyTextField(
                        labelText: "CNPJ",
                      ),
                      const MyTextField(
                        labelText: 'E-mail corporativo :',
                      ),
                      const MyTextField(
                        labelText: 'Quantidade de funcionarios :',
                      ),
                      const MyTextField(
                        labelText: 'Cidade e estado da empresa :',
                      ),
                      const MyTextField(
                        labelText: 'Mensagem :',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Enviar"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
