import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../config.dart';
import '../widgets.dart';

class ServicesPage extends StatefulWidget {
  final String textService1 =
      "PCMSO - Programa de Controle Médico de Saúde Ocupacional O PCMSO é um documento elaborador por médico do trabalho,"
      " obrigatório para empresas com 1 ou mais funcionários, com o objetivo de proteger e preservar a saúde de seus empregados."
      " Conforme NR 7, são diretrizes do PCMSO:\n\n"
      "a) rastrear e detectar precocemente os agravos à saúde relacionados ao trabalho;\n"
      "b) detectar possíveis exposições excessivas a agentes nocivos ocupacionais;\n"
      "c) definir a aptidão de cada empregado para exercer suas funções ou tarefas determinadas;\n"
      "d) subsidiar a implantação e o monitoramento da eficácia das medidas de prevenção adotadas na organização;\n"
      "e) subsidiar análises epidemiológicas e estatísticas sobre os agravos à saúde e sua relação com os riscos ocupacionais;\n"
      "f) subsidiar decisões sobre o afastamento de empregados de situações de trabalho que possam comprometer sua saúde;\n"
      "g) subsidiar a emissão de notificações de agravos relacionados ao trabalho, de acordo com a regulamentação pertinente;\n"
      "h) subsidiar o encaminhamento de empregados à Previdência Social;\n"
      "i) acompanhar de forma diferenciada o empregado cujo estado de saúde possa ser especialmente afetado pelos riscos ocupacionais;\n"
      "j) subsidiar a Previdência Social nas ações de reabilitação profissional;\n"
      "k) subsidiar ações de readaptação profissional;\n"
      "l) controlar da imunização ativa dos empregados, relacionada a riscos ocupacionais, sempre que houver recomendação do Ministério da Saúde.\n\n"
      "A P2P elabora seu PCMSO contemplando todos os itens acima e te orienta em como executá-lo.\n";
  final String textService2 =
      "O PGR  é um documento obrigatório para toda empresa com 1 ou mais funcionários, devendo ser revisado bianualmente, e mantido arquivado por no mínimo 20 anos."
      "Conforme NR 1,  a organização deve:\n\n"
      "a) evitar os riscos ocupacionais que possam ser originados no trabalho;\n"
      "b) identificar os perigos e possíveis lesões ou agravos à saúde;\n"
      "c) avaliar os riscos ocupacionais indicando o nível de risco;\n"
      "d) classificar os riscos ocupacionais para determinar a necessidade de adoção de medidas de prevenção;\n"
      "e) implementar medidas de prevenção;\n"
      "f) acompanhar o controle dos riscos ocupacionais.\n\n  "
      "A P2P elabora seu PGR contemplando todos os itens acima e te orienta em como executá-lo.";
  final String textService3 =
      "Indicado para as microempresas e empresas de pequeno porte, graus de risco 1 e 2, trata-se de uma versão simplificada do PGR, onde realizamos o levantamento preliminar de perigos a que dos trabalhadores estão expostos no ambiente de trabalho.\n\n"
      "Caso não identifiquemos exposições ocupacionais a agentes físicos, químicos e biológicos, a empresa fica dispensada da elaboração do PGR.\n\n"
      "A P2P elabora seu Levantamento preliminar de Riscos Ocupacionais para a sua Declaração de ausência de riscos ou, se necessário, continua a análise para o PGR. ";
  final String textService4 =
      "A empresa deve realizar a AEP para identificar as situações de trabalho que,"
      " em decorrência da natureza e conteúdo das atividades requeridas,"
      " demandam adaptação às características psicofisiológicas dos trabalhadores,"
      " a fim de subsidiar a implementação das medidas de prevenção e adequações necessárias.\n\n"
      "A P2P elabora sua AEP, entre em contato conosco.";
  final String textService5 =
      "Quando a AEP identifica riscos ergonômicos, se faz necessário aprofundar a análise com AET. deve abordar as condições de trabalho,"
      " conforme estabelecido nesta NR, incluindo as seguintes etapas:\n\n"
      "a) análise da demanda;\n"
      "b) análise do funcionamento da organização, dos processos, das situações de trabalho e da atividade;\n"
      "c) descrição e justificativa para definição de métodos, técnicas e ferramentas adequados para a análise e sua aplicação;\n"
      "d) estabelecimento de diagnóstico;\n"
      "e) recomendações para as situações de trabalho analisadas;\n"
      "f) restituição dos resultados, validação e revisão das intervenções efetuadas, quando necessária, com a participação dos trabalhadores.\n\n"
      "A P2P elabora sua AET contemplando todos os itens acima e te orienta em como executá-lo. ";
  final String textService6 =
      "O LTCAT é um documento estabelecido pelo INSS (Instituto Nacional do Seguro Social), "
      "com o objetivo de avaliar se o trabalhador tem direito a aposentadoria especial por ter exposição a agentes nocivos à saúde.\n\n"
      "Ele é obrigatório para todas as empresas que tem 1 ou mais funcionários,"
      "e é utilizado para o preenchimento do PPP (Perfil Profissiográfico Previdenciário)"
      " que a partir de janeiro/23 será eletrônico, enviado pelo eSocial.\n\n"
      "Deve ser expedido por médico do trabalho ou engenheiro de segurança do trabalho nos termos da legislação trabalhista. ";
  final String textService7 =
      "Todas as empresas precisam informar para o governos os eventos de saúde e segurança dos seus trabalhadores: S-2210, S-2220 e S-2240."
      "Nós preenchemos e enviamos para o eSocial todos esses eventos, seguindo as tabelas e lay-outs definidos pelo governo."
      "No S-2210 enviaremos as informações das comunicações de acidente de trabalho.\n\n"
      "No S-2220 enviaremos as informações dos atestados de saúde ocupacional, sejam eles admissional, demissional, periódico, mudança de função ou retorno ao trabalho."
      "No S-2240 enviaremos as informações de agentes nocivos que o trabalhador estão expostos, com base na avaliação do LTCAT. ";
  final String textService8 =
      "Fazemos acompanhamento de validades dos programas da empresa e dos Atestados de saúde ocupacional dos trabalhadores, além de assessoria para cumprimento do plano de ações, Relatório analítico dos indicadores de saúde, apoio na escolha das clínicas de saúde ocupacional, entre outros…";
  final String textService9 =
      "Fazemos a análise do FAP ( Fator Acidentário Previdenciário) da sua empresa e contestação dos elementos inconsistentes;\n"
      "Gestão dos afastamentos previdenciários a fim de reduzir os afastamentos e contestar benefícios acidentários concedidos indevidamente;\n"
      "Gestão do absenteísmo médico, a fim de reduzir as ausências dos trabalhadores por motivo de doença, através da análise das principais causas de falta e de ações de saúde para reduzir o adoecimento dos colaboradores e encaminhamento ao INSS dos colaboradores que faltarem ao trabalho por mais de 15 dias pela mesma doença.";
  final String textService10 = "NR-6 (Equipamentos de proteção individual),\n"
      "NR 12 (Trabalho com máquinas e equipamentos),\n"
      "NR-17 (Ergonomia)\n"
      "NR-20 (Inflamáveis e combustíveis),\n"
      "NR-33 (Trabalho em espaço confinado),\n"
      "NR-35 (Trabalho em Altura) e outros temas de saúde, segurança e meio ambiente.\n";
  final String textService11 = "Laudo de insalubridade\n"
      "Laudo de periculosidade\n"
      "Ordem de serviço\n"
      "PCA - Programa de Conservação Auditiva\n"
      "PGRS - Programa de Gerenciamento de Resíduos Sólidos\n"
      "Plano de emergência\n"
      "PPR - Programa de Proteção Respiratória\n"
      "Procedimentos Operacionais\n";
  final String textService12 = "Assistencia técnica judicial\n"
      "Monitoramentos ambientais\n"
      "Formação e Treinamento de Brigada de Incêndio\n"
      "Formação e Treinamento de CIPA\n";

  final int? index;
  const ServicesPage({Key? key, this.index}) : super(key: key);

  @override
  State<ServicesPage> createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
  final double containerW = SiteConfig.screenSize.width * 0.5;

  // positioned list
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  Future<void> scrollCallback() async {
    if (widget.index != null) {
      int ct = 0;
      while (!itemScrollController.isAttached) {
        ct++;
        await Future.delayed(const Duration(milliseconds: 10));
        if (ct > 50) {
          break;
        }
      }
      if (ct <= 50) {
        itemScrollController.scrollTo(
          index: widget.index!,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 750),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SiteConfig.screenSize = MediaQuery.of(context).size;
    SiteConfig.smallScreen =
        SiteConfig.screenSize.width < SiteConfig.screenSize.height;

    List<Widget> titleChildren = [
      // Expanded(
      //   flex: 5,
      //   child: Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: Text(
      //       "SERVIÇOS",
      //       textAlign: TextAlign.end,
      //       style: TextStyle(
      //         fontSize: SiteConfig.getTitleSize(),
      //         fontWeight: FontWeight.bold,
      //         color: SiteConfig.lightColors.primary,
      //       ),
      //     ),
      //   ),
      // ),
      // Expanded(
      //   flex: SiteConfig.smallScreen ? 10 : 8,
      //   child: Padding(
      //     padding: EdgeInsets.all(SiteConfig.smallScreen ? 10 : 20),
      //     child: Image.asset(
      //       "assets/images/serviços/serviço.jpg",
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      // ),
      Image.asset(
        "assets/images/serviços/ImagemServiço.png",
        fit: BoxFit.fitWidth,
      )
    ];

    List<Widget> children = [
      SizedBox(
        child: SiteConfig.smallScreen
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: titleChildren,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: titleChildren,
              ),
      ),
      ServiceContainer(
        title: "PCMSO - Programa de Controle Médico de Saúde Ocupacional",
        text: widget.textService1,
      ),
      ServiceContainer(
        title: "PGR - Programa de Gerenciamento de Riscos",
        text: widget.textService2,
      ),
      ServiceContainer(
        title: "Levantamento preliminar de riscos ocupacionais ",
        text: widget.textService3,
      ),
      ServiceContainer(
        title: "AEP -  Avaliação Ergonômica Preliminar",
        text: widget.textService4,
      ),
      ServiceContainer(
        title: "AET - Análise Ergonômica do Trabalho",
        text: widget.textService5,
      ),
      ServiceContainer(
        title: "LTCAT - Laudo Técnico das Condições do Ambiente de Trabalho",
        text: widget.textService6,
      ),
      ServiceContainer(
        title: "Esocial",
        text: widget.textService7,
      ),
      ServiceContainer(
        title: "Gestão dos programas de saúde e segurança do trabalho:",
        text: widget.textService8,
      ),
      ServiceContainer(
        title: "Assessoria previdenciária: ",
        text: widget.textService9,
      ),
      ServiceContainer(
        title: "Treinamentos: ",
        text: widget.textService10,
      ),
      ServiceContainer(
        title: "Outros documentos técnicos:",
        text: widget.textService11,
      ),
      ServiceContainer(
        title: "Outros serviços:",
        text: widget.textService12,
      ),
      SiteConfig.getFooter(),
    ];

    final positionedList = ScrollablePositionedList.builder(
      itemCount: children.length, // 8 services + heading + footer
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
    );

    scrollCallback();
    return Scaffold(
      appBar: SiteConfig.getAppBar(context, "Serviços"),
      floatingActionButton: SiteConfig.getFAB(),
      body: positionedList,
    );
  }
}
