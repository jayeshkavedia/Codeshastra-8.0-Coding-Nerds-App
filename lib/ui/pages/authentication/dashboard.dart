import 'package:flutter/material.dart';
import 'package:cred/ui/pages/dashboard/DashboardController.dart';
import 'package:get/get.dart';
import 'package:cred/ui/pages/home/HomePage.dart';
import 'package:cred/ui/pages/cards/CardsPage.dart';
import 'package:cred/ui/pages/club/ClubPage.dart';
import 'package:cred/ui/pages/money/MoneyPage.dart';
import 'package:cred/core/Extensions.dart';
import 'package:cred/core/AppConstants.dart';
import 'package:cred/ui/pages/centraltab/CentralPage.dart';
import 'package:cred/core/BottomBarClipper.dart';
import 'package:sms/generated/i18n.dart';
import 'package:sms/sms.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  SmsQuery query = SmsQuery();
  List  allmessages;

  @override
  void initState() {
    getAllMessages();
    super.initState();
  }

  void getAllMessages(){
    Future.delayed(Duration.zero,() async {
      List<SmsMessage> messages = await query.querySms( //querySms is from sms package
        kinds: [SmsQueryKind.Inbox,],
        //filter Inbox, sent or draft messages
        count: 20, //number of sms to read
      );

      setState(() {
        print(messages);
        allmessages = getData(messages);
        print(allmessages);
        print(allmessages.length);//update UI
      });

    });
  }

  List getData(messages){
    List l = [];
    for(var message in messages){
      l.add(message.body);
    }
    return l;
  }

  final double _bottomBarHeight = 80;

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();

    _onBottomTabPressed(int indexToMoveTo) {
      dashboardController.changeTabIndex(indexToMoveTo);
    }

    final _bottomTabScreensList = [
      HomePage(),
      CardsPage(),
      Container(),
      MoneyPage(),
      ClubPage()
    ];

    void _showBottomSheet() { showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        backgroundColor: HexColor.fromHex(BottomSheetBackground),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        builder: (BuildContext context) {
          return CentralPage();
        });
    }

    Widget _getBottomBarRow() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: Image.asset("assets/images/icon_options.png",), onPressed: () { _onBottomTabPressed(0); }),
          IconButton(icon: Image.asset("assets/images/icon_cc.png"), onPressed: () { _onBottomTabPressed(1); }),
          IconButton(icon: Image.asset("assets/images/icon_cred_golden.png"), onPressed: () { _showBottomSheet(); }),
          IconButton(icon: Image.asset("assets/images/bank_colored.png"), onPressed: () { _onBottomTabPressed(3); }),
          IconButton(icon: Image.asset("assets/images/icon_club.png"), onPressed: () { _onBottomTabPressed(4); }),
        ],
      );
    }

    return Obx(() => Scaffold(
      backgroundColor: HexColor.fromHex(DarkBackground),
      body: IndexedStack(
        index: dashboardController.currentTabIndex.value,
        children: _bottomTabScreensList,
      ),
      bottomNavigationBar: BottomAppBar(
        color: HexColor.fromHex(DarkBackground),
        child: ClipPath(
          clipper: BottomBarClipper(),
          child: Stack(
            children: [
              CustomPaint(
                painter: BottomBarBorderPainter(),
                child: Container(
                  height: _bottomBarHeight,
                ),
              ),
              Positioned.fill(
                top: 28,
                child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: _getBottomBarRow()
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}