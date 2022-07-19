import 'package:flutter/material.dart';

import '../config.dart';
import '../widgets.dart';

class ServicesPage extends StatefulWidget {
  final String textService1 =
      "Os fios de polidioxanona (PDO) são sintéticos, monofilamentares e biodegradáveis. "
      "São utilizados há mais de trinta anos em cirurgia plástica, cardíaca, ginecológica e urológica. "
      "Devido seu alto desempenho regenerador, com estímulo a indução de colágeno, "
      "esse material começo a ser utilizado em procedimentos estéticos,"
      " se mostrando seguro e eficaz. "
      "Seus resultados são bastante satisfatórios, abrangendo desde o efeito de sustentação (lifting), "
      "mas também a melhora da textura e elasticidade da pele. "
      "Podemos utilizar os fios de PDO em qualquer parte do nossa face e/ou corpo, "
      "mas as mais requisitadas são as regiões de olheiras, testa, lábios e pescoço.";
  final String textService2 =
      "Vamos falar de bioestimuladores? O colágeno tipo 1 é o responsável pela firmeza e elasticidade da pele,"
      " mas a partir dos 30 anos  o nosso organismo desacelera muito a sua produção. "
      "Nesse momento, começamos a perceber uma aparência de derretimento da pele, "
      "principalmente na região temporal e do bigode chinês (fica bem marcadinho)."
      " A alternativa para desacelerar esse derretimento é a injeção de substâncias na pele que visam estimular o próprio corpo para voltar a produzir colágeno."
      " Os nomes comerciais dessas substâncias são Sculptra, "
      "Elleva, Ellanse, radiesse, entre outros. Todos eles atuam na bioestimulação do colágeno, "
      "contudo com características específicas e com tempo de ação e duração diferentes."
      " Os casos mais indicados para o uso de bioestimuladores são: pele do rosto fina e sem elasticidade, "
      "sulcos e marcas de expressão facial, "
      "perda de volume na face; perda de espessura dérmica, como também a perda de contorno da face."
      " Para maiores informações, é importante agendar uma consulta.";

  final String textService3 = "Você conhece a sequência de Fibonacci? "
      "É uma sucessão de números que aparece codificada em muitos fenômenos da natureza. "
      "Descrita no final do século 12 pelo matemático italiano Leonardo Fibonacci, ela é infinita e começa com 0 e 1."
      " Os números seguintes são sempre a soma dos dois números anteriores."
      "São exemplos de imagens que trazem essa sequência: o casco do caracol,"
      " o miolo do girassol, as pirâmides do Egito, entre outros."
      " Reparou que são imagens que atraem sua visão e interesse? "
      "As imagens mais atraentes e harmoniosas, tem por base a sequência de Fibonacci."
      " Por isso, a harmonização orofacial também se baseiam nos fundamentos dessa sequência. "
      "Quando avaliamos a face de um paciente, todo processo é planejado e calculado. "
      "As formas não são dadas de forma aleatória.";
  final String textService4 =
      "Uma pele bem preparada recebe e responde melhor a qualquer tipo de procedimento de harmonização orofacial."
      " Por isso, indico para os meus pacientes a realização peeling como elemento importante no planejamento do tratamento que iremos realizar."
      " O peeling mantém a pele jovem, saudável, ajuda a amenizar as cicatrizes e manchas de acne, cravos, espinhas, "
      "linhas de expressão, reduz a aparência dos poros dilatados, "
      "além de promover o rejuvenescimento facial e previnir o envelhecimento precoce, "
      "pois aumenta a atividade dos fibroblastos e consequentemente, a produção de colágeno.";
  final String textService5 =
      "Por que indicar microagulhamento para nossos pacientes?"
      "Primeiramente porque ele favorece à renovação celular, com estímulo à produção de colágeno. Traduzindo isso em resultados, observamos:"
      "1- Redução de poros dilatados;"
      "2- Resultados maravilhosos para cicatrizes de acne;"
      "3- Rejuvenescimento facial com diminuição das linhas de expressão;"
      "3- Melhora na textura e viço da pele;"
      "4- Clareamento da pele;"
      "5- Crescimento capilar (em regiões como a sobrancelhas, é observado o aumento de fios, melhorando a possibilidade de favorecer seu desing )."
      "Por que prefiro a caneta elétrica (derma Pen) em vez do rolo(derma roller)? "
      "Porque ao trabalhar com a dermapen é possível realizar uma profundidade de microagulhamento específico para cada área da pele,"
      " com a  calibração na própria caneta e assim, obter resultados de forma mais direcionada.";
  final String textService6 =
      "Você sabia que existe dois tipos de rugas? Rugas estáticas e rugas dinâmicas. "
      " RUGAS ESTÁTICAS: elas são consequência da movimentação muscular aos longo dos anos. "
      "É aquela ruga marcada. Ainda que seja submetida a aplicação de toxina botulínica, "
      "ela não some. Fica um pouco mais discreta em alguns casos, mas continua ali. "
      "RUGAS DINÂMICAS: são aquelas rugas que aparecem quando fazemos as expressões de susto, "
      "medo, raiva, nojo e outros, sendo desfeitas logo após passar o sentimento. "
      "A aplicação de toxina botulínica evita que as rugas dinâmicas(sentimentos) se transformem em rugas estáticas(marcadas),"
      " deixando a expressão facial sem as temidas marcas em testa, glabela e canto dos olhos. Além disso, a toxina, "
      "por favorecer o relaxamento e vascularização muscular, torna a face mais suave e rejuvenescida. "
      "Você possui rugas estáticas e ficou preocupado? Saiba que existem tratamentos para eliminá-las, "
      "como por exemplo, o preenchimento com ácido hialurônico, os fios de pdo, entre outros. Constitui um processo com resultados mais delicados,"
      " mas é possível recuperar tal dano a pele. Cabe salientar que cada procedimento clínico tem indicação conforme consulta prévia. "
      "Gostaria de saber mais um pouco? Que tal agendar uma consulta?";
  final String textService7 =
      "A medida que envelhecemos, perdemos bastante gordura facial e, consequentemente, "
      "ocorre a ptose(queda) de algumas estruturas que estavam suportadas por tais gorduras. "
      "Algumas pacientes descrevem tal evento como derretimento da pele. Muitas delas falam: Dra, estou derretendo! "
      "É nessa hora que os preenchedores de ácido hialurônico assumem um importante papel na restruturação da face."
      "Aí surge a explicação: quando realizamos preenchimento facial,"
      " a deposição de material segue a lógica de devolver a estrutura adiposa perdida ao longo dos anos."
      " Por isso, ao preencher, ficamos com a aparência mais jovem e descansada. "
      "Cabe salientar que o ácido hialurônico está disponível para uso em diversas apresentações comerciais, "
      "sendo elas na forma líquida ou  em diferentes densidades. Sua aplicação pode ser voltada para nutrição, sustenção,"
      " lifting e também para melhor aparência dos tecidos. Cada indicação clínica é específica e deve ser orientada e aplicada por profissional habilitado.";
  final String textService8 =
      "A bichectomia tem sido um assunto muito polêmico nos últimos tempos, por isso, "
      "resolvi criar essa sequência de tópicos para trazer clareza e objetividade sobre o assunto.\n "
      "1- Na bichectomia retiramos as bolas de bichat\n "
      "2-Para que serve a bola de bichat? Ela é muito útil para as crianças,"
      " nos primeiros anos de vida, auxiliando na sucção.\n"
      "3- Qual a sua função na vida adulta? Nenhuma.\n"
      "4- Com o passar dos anos, os tecidos tendem a despencar, seguindo a lei da gravidade."
      " Nesta mesma lei, as bolas de bichat despencam tb, favorecendo para uma aparência de buldogue.\n"
      "5- Nem todo formato de rosto fica bem após realizar este procedimento,"
      "por isso é preciso uma avaliação criteriosa com um profissional qualificado. \n "
      "6- O rosto fica lindo, mais magrinho… Muitas celebridades já realizaram e seus resultados ficaram muito bom.\n "
      "7- Porém, caso o seu perfil facial não tenha indicação para tal procedimento,"
      " não o realize mesmo que seja algo que desperte grandemente seu interesse.\n "
      "8- Busque por profissionais que saibam valorizar seus traços, sua beleza, seus pontos fortes."
      " Harmonizar é acima de tudo, trazer sintonia para face, com cuidado e delicadeza.\n";

  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
  final double containerW = SiteConfig.screenWidth * 0.5;
  @override
  Widget build(BuildContext context) {
    SiteConfig.screenHeight = MediaQuery.of(context).size.height;
    SiteConfig.screenWidth = MediaQuery.of(context).size.width;

    bool smallScreen = SiteConfig.screenHeight > SiteConfig.screenWidth;

    List<Widget> children = [
      SizedBox(
        height: SiteConfig.screenHeight / 2,
        width: SiteConfig.screenWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/nope/service_temp.png",
                opacity: const AlwaysStoppedAnimation<double>(100),
                fit: BoxFit.fitWidth,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "What We Can Provide For You",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      MyContainerService("FIOS DE PDO ", widget.textService1),
      MyContainerService("Bioestimuladores ", widget.textService2),
      MyContainerService(
        "Já ouviu falar sobre a sequência de Fibonacci ?",
        widget.textService3,
      ),
      MyContainerService(
        "Peeling ",
        widget.textService4,
      ),
      MyContainerService(
        "Microagulhamento",
        widget.textService5,
      ),
      MyContainerService(
        "O Botox e sua ação nas rugas",
        widget.textService6,
      ),
      MyContainerService(
        "Preenchimento com ácido hialurônico ",
        widget.textService7,
      ),
      MyContainerService(
        "Bichectomia ",
        widget.textService8,
      ),
    ];

    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Services"),
      floatingActionButton: SiteConfig.getFAB(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: true
                  ? children + [SiteConfig.getFooter()]
                  : [
                      SiteConfig.getHeader(context, "Services"),
                      children[0],
                      Row(children: [children[1], children[2]]),
                      Row(children: [children[3], children[4]]),
                      Row(children: [children[5], children[6]]),
                      Row(children: [children[7], children[8]]),
                      SiteConfig.getFooter(),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}