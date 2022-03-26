import 'package:cred/core/AppConstants.dart';
import 'package:cred/core/BottomBarClipper.dart';
import 'package:cred/core/Extensions.dart';
import 'package:cred/data/fakedata/AllFakeDataFile.dart';
import 'package:flutter/material.dart';

class CentralPage extends StatelessWidget {
  const CentralPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _recommendedTextStyle = TextStyle(
        color: HexColor.fromHex(TextBlack),
        fontSize: 16,
        fontWeight: FontWeight.bold);

    Widget _tile(String title) {
      return Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.wallet_giftcard_outlined,
                  color: Colors.orange.shade500,
                  size: 100.0,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
      );
    }

    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Stack(children: <Widget>[
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 12.0),
                child: Column(
                  children: [
                    Text(
                      "Recommended Coupons",
                      style: _recommendedTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    //Expanded(
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      primary: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                      children: List.generate(2, (index) {
                        return _tile(bottomSheetRecommendedList[index % 5]);
                      }),
                      //),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Coupon of the Day",
                      style: _recommendedTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      primary: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                      children: List.generate(2, (index) {
                        return _tile(bottomSheetRecommendedList[index % 5]);
                      }),
                      //),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: BottomSheetCalcelClipper(),
                    child: Container(
                      height: 100,
                      color: HexColor.fromHex(DarkBackground),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/images/icon_cancel3.png",
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
