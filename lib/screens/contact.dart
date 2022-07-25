import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static Future<void> tryLaunchUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    double contactSize = 20;
    double iconSize = 30;
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;
    Widget rightContact = Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        width: SiteConfig.screenSize.width,
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
            Expanded(
              flex: 1,
              child: MyTextField(
                labelText: 'Nome :',
                myController: myControllerName,
              ),
            ),
            Expanded(
              flex: 1,
              child: MyTextField(
                labelText: 'Sobrenome :',
                myController: myControllerSobreName,
              ),
            ),
            Expanded(
              flex: 1,
              child: MyTextField(
                labelText: 'E-mail :',
                myController: myControllerEmail,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
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
      flex: 1,
      child: Container(
        width: SiteConfig.screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: SiteConfig.lightColors.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Informações de contato :",
              style: TextStyle(
                fontSize: 30,
                color: SiteConfig.lightColors.background,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                  Expanded(
                    child: Text(
                      " +55 71 98807-8855",
                      style: TextStyle(
                        fontSize: contactSize,
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                  Expanded(
                    child: Text(
                      " prcbrasil@gmail.com",
                      style: TextStyle(
                        fontSize: contactSize,
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                  Expanded(
                    child: Text(
                      "Avenida Tancredo Neves, 620, SL 324 MUNDO PLAZA Caminho das Arvores - Salvador - BA",
                      style: TextStyle(
                        fontSize: contactSize,
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                  Expanded(
                    child: Text(
                      "CIS Prof. Fernando Filgueiras - Rua Eduardo José dos Santos, Av. Anita Garibaldi, 147 - sala 703, Salvador - BA, ",
                      style: TextStyle(
                        fontSize: contactSize,
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    color: SiteConfig.lightColors.background,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Uri uri = Uri.parse(
                          "https://www.instagram.com/drapaulabrasil/");
                      tryLaunchUri(uri);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: SiteConfig.lightColors.background,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Uri uri = Uri.parse("https://www.facebook.com/prbrasil");
                      tryLaunchUri(uri);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: SiteConfig.lightColors.background,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Uri uri = Uri.parse("https://www.twitter.com");
                      tryLaunchUri(uri);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.twitter,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
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
                    margin: const EdgeInsets.all(30),
                    height: SiteConfig.smallScreen
                        ? SiteConfig.screenSize.height * 0.7 * 2
                        : SiteConfig.screenSize.height * 0.7,
                    width: SiteConfig.screenSize.width * 0.8,
                    child: SiteConfig.smallScreen
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              leftContact,
                              rightContact,
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              leftContact,
                              rightContact,
                            ],
                          ),
                  ),
                ],
              ),
              Container(
                color: SiteConfig.lightColors.primary.withAlpha(25),
                child: SiteConfig.smallScreen
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Avenida Tancredo Neves, 620, SL 324 MUNDO PLAZA Caminho das Arvores - Salvador - BA',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(8),
                            child: widget.clinica1,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'CIS Prof. Fernando Filgueiras - Rua Eduardo José dos Santos, Av. Anita Garibaldi, 147 - sala 703, Salvador - BA, ',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(8),
                            child: widget.clinica2,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Avenida Tancredo Neves, 620, SL 324 MUNDO PLAZA Caminho das Arvores - Salvador - BA",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.all(8),
                                    child: widget.clinica1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "CIS Prof. Fernando Filgueiras - Rua Eduardo José dos Santos, Av. Anita Garibaldi, 147 - sala 703, Salvador - BA, ",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.all(8),
                                    child: widget.clinica2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
