import 'package:flutter/material.dart';

import 'widgets.dart';
import 'config.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final myControllerName = TextEditingController();
  final myControllerSobreName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerMensagem = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerName.dispose();
    myControllerSobreName.dispose();
    myControllerEmail.dispose();
    myControllerMensagem.dispose();

    super.dispose();
  }

  void trySendEmail() {
    try {
      SiteConfig.sendEmail(
        name: myControllerName.text,
        email: myControllerEmail.text,
        subject: myControllerSobreName.text,
        message: myControllerMensagem.text,
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
      floatingActionButton: SiteConfig.getFAB(),
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
                    color:
                        const Color.fromARGB(255, 175, 127, 75).withAlpha(200),
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
                        MyTextField(
                          labelText: 'Nome :',
                          myController: myControllerName,
                        ),
                        MyTextField(
                          labelText: 'Sobrenome :',
                          myController: myControllerSobreName,
                        ),
                        MyTextField(
                          labelText: 'E-mail :',
                          myController: myControllerEmail,
                        ),
                        MyTextField(
                          labelText: 'Mensagem :',
                          myController: myControllerMensagem,
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
