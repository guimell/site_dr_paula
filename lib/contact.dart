import 'package:flutter/material.dart';

import 'widgets.dart';
import 'config.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  void trySendEmail() {
    try {
      SiteConfig.sendEmail(
        name: 'my name',
        email: 'guimell11@hotmail.com',
        subject: 'my subject',
        message: 'my message',
      ).then((bool success) {
        if (success) {
          SiteConfig.showSnackBar(
            context,
            "sucess!",
          );
        } else {
          SiteConfig.showSnackBar(
            context,
            "FAIL",
          );
        }
      });
    } catch (e) {
      print(e);
      SiteConfig.showSnackBar(
        context,
        "FAIL",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Contato"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: SiteConfig.screenHeight * 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: MediaQuery.platformBrightnessOf(context) ==
                            Brightness.light
                        ? Colors.white
                        : const Color.fromARGB(255, 175, 127, 75).withAlpha(25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Contato",
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    MediaQuery.platformBrightnessOf(context) ==
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
                                  onPressed: () async {
                                    trySendEmail();
                                  },
                                  child: const Text("Enviar"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SiteConfig.getFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
