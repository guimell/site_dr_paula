import 'package:flutter/material.dart';

import '../config.dart';
import '../google.dart';
import '../widgets.dart';

class ContactPage extends StatefulWidget {
  final GoogleMaps clinica1 = const GoogleMaps(
    [-12.97906405448506, -38.46079686531542],
  );
  final GoogleMaps clinica2 = const GoogleMaps(
    [-13.002766607398238, -38.50198503547772],
  );
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final myControllerName = TextEditingController();
  final myControllerSobreName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerMensagem = TextEditingController();

  bool local = false;

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
            true,
          );
        } else {
          SiteConfig.showSnackBar(
            context,
            "FAIL",
            false,
          );
        }
      });
    } catch (e) {
      SiteConfig.showSnackBar(
        context,
        "FAIL",
        false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;
    Widget containerField = Expanded(
      child: Container(
        width: SiteConfig.screenSize.width / 2,
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
    );
    Widget leftContact = Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: SiteConfig.lightColors.primary.withAlpha(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Informações de contato"),
            Text("Subtitle"),
            Text("719999-9999"),
            Text("exemplo@gmail.com"),
            Text("Rua praia de ...."),
            Text("Footer icons here")
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Contato"),
      floatingActionButton: SiteConfig.getFAB(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(30),
                    height: SiteConfig.smallScreen
                        ? SiteConfig.screenSize.height * 0.8 * 2
                        : SiteConfig.screenSize.height * 0.8,
                    width: SiteConfig.screenSize.width,
                    child: SiteConfig.smallScreen
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              leftContact,
                              containerField,
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              leftContact,
                              containerField,
                            ],
                          ),
                  ),
                ],
              ),
              SiteConfig.smallScreen
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(8),
                          color: SiteConfig.lightColors.primary.withAlpha(25),
                          child: widget.clinica1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(8),
                          color: SiteConfig.lightColors.primary.withAlpha(25),
                          child: widget.clinica2,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(8),
                            color: SiteConfig.lightColors.primary.withAlpha(25),
                            child: widget.clinica1,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(8),
                            color: SiteConfig.lightColors.primary.withAlpha(25),
                            child: widget.clinica2,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 50),
              SiteConfig.getFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
