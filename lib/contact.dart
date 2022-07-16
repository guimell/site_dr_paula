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
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          "Contato",
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                      // MyTextField(
                      //   labelText: 'Mensagem :',
                      //   myController: myControllerMensagem,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          maxLines: 10,
                          controller: myControllerMensagem,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'Mensagem :',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                const SizedBox(height: 50),
                SiteConfig.getFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
