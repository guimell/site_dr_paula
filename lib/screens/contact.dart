import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../google.dart';
import '../widgets.dart';

class ContactPage extends StatefulWidget {
  final Widget clinicMap1 = Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.only(top: 8),
    child: const GoogleMaps([-12.97906405448506, -38.46079686531542]),
  );
  final Widget clinicLink1 = Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextButton(
      onPressed: () {
        Uri uri = Uri.parse(
          "https://www.google.com.br/maps/place/Cl%C3%ADnica+Odontol%C3%B3gica+Cores/@-12.9790901,-38.4607998,17z/data=!3m1!4b1!4m5!3m4!1s0x7161b193cc176a7:0x15d266c0b7fc1f58!8m2!3d-12.9790901!4d-38.4607998",
        );
        tryLaunchUri(uri);
      },
      child: Text(
        'Avenida Tancredo Neves, 620, SL 324 MUNDO PLAZA Caminho das Arvores - Salvador - BA',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: SiteConfig.getTextSize(),
        ),
      ),
    ),
  );

  final Widget clinicMap2 = Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.only(top: 8),
    child: const GoogleMaps([-13.002766607398238, -38.50198503547772]),
  );
  final Widget clinicLink2 = Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextButton(
      onPressed: () {
        Uri uri = Uri.parse(
          "https://www.google.com.br/maps/place/Cliortho+Odontologia+Est%C3%A9tica+e+Digital/@-13.0027839,-38.5061044,17z/data=!4m9!1m2!2m1!1sCIS+Prof.+Fernando+Filgueiras+-+Rua+Eduardo+Jos%C3%A9+dos+Santos,+Av.+Anita+Garibaldi,+147+-+sala+703,+Salvador+-+BA,+41940-455!3m5!1s0x716052c81ddac79:0x4da84e2160b383e2!8m2!3d-13.0027841!4d-38.5019846!15sCntDSVMgUHJvZi4gRmVybmFuZG8gRmlsZ3VlaXJhcyAtIFJ1YSBFZHVhcmRvIEpvc8OpIGRvcyBTYW50b3MsIEF2LiBBbml0YSBHYXJpYmFsZGksIDE0NyAtIHNhbGEgNzAzLCBTYWx2YWRvciAtIEJBLCA0MTk0MC00NTWSAQ1kZW50YWxfY2xpbmlj",
        );
        tryLaunchUri(uri);
      },
      child: Text(
        "CIS Prof. Fernando Filgueiras - Rua Eduardo José dos Santos, Av. Anita Garibaldi, 147 - sala 703, Salvador - BA ",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: SiteConfig.getTextSize(),
        ),
      ),
    ),
  );

  ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final myControllerName = TextEditingController();
  final myControllerSobreName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerMensagem = TextEditingController();
  final myController = TextEditingController();

  bool local = false;

  final scrollController = ScrollController();

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

  Future<void> tryLaunchUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerName.dispose();
    myControllerSobreName.dispose();
    myControllerEmail.dispose();
    myControllerMensagem.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 30;
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;

    Widget rightContact = Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        width: SiteConfig.screenSize.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Contato",
                style: TextStyle(
                  fontSize: SiteConfig.getTitleSize(),
                  fontWeight: FontWeight.bold,
                  color: SiteConfig.lightColors.primary,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'Nome :',
                myController: myControllerName,
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'E-mail:',
                myController: myControllerEmail,
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'Numero de telefone :',
                myController: myControllerName,
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'Nome da empresa  :',
                myController: myControllerName,
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'CNPJ :',
                myController: myControllerName,
              ),
            ),
            Flexible(
              flex: 1,
              child: MyTextField(
                labelText: 'Quantida de funcionarios: ',
                myController: myControllerName,
              ),
            ),
            Flexible(
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
                    child: const Text("Enviar"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget leftContact = Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: SiteConfig.lightColors.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Informações de Contato",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SiteConfig.getHeadingSize(),
                fontWeight: FontWeight.bold,
                color: SiteConfig.lightColors.primary,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.phone,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      String phone = "5571981618308";
                      String text = Uri.encodeFull("Ola P2P!");
                      Uri uri = Uri.parse("https://wa.me/$phone?text=$text");
                      tryLaunchUri(uri);
                    },
                    child: Text(
                      "+55 71-98161-8308",
                      style: TextStyle(
                        fontSize: SiteConfig.getTextSize(),
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.email,
                    size: iconSize,
                    color: SiteConfig.lightColors.background,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      "p2psaudeeseg@gmail.com",
                      style: TextStyle(
                        fontSize: SiteConfig.getTextSize(),
                        color: SiteConfig.lightColors.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Siga nossas redes sociais",
                    style: TextStyle(
                        fontSize: SiteConfig.getTextSize(),
                        color: SiteConfig.lightColors.background),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                    color: SiteConfig.lightColors.background,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Uri uri = Uri.parse(
                        "https://www.instagram.com/drapaulabrasil/",
                      );
                      tryLaunchUri(uri);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
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
          controller: scrollController,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    height: SiteConfig.smallScreen
                        ? SiteConfig.screenSize.height * 0.7 * 2
                        : SiteConfig.screenSize.height * 0.8,
                    width: SiteConfig.screenSize.width * 0.9,
                    child: SiteConfig.smallScreen
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              rightContact,
                              leftContact,
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
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
