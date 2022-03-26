import 'package:cred/models/CreditCardModel.dart';
import 'package:cred/models/HomeAdvModel.dart';

List<HomeAdvModel> homeAdvList = [
  HomeAdvModel(0, false),
  HomeAdvModel(1, false),
  HomeAdvModel(2, false),
  HomeAdvModel(3, false),
  HomeAdvModel(4, false),
  HomeAdvModel(5, false),
  HomeAdvModel(6, false),
  HomeAdvModel(7, false),
];

List<CreditCardModel> cards = [
  CreditCardModel(0, "ICICI PLATINUM", "4334 8397 XXXX 8321", "HARSHAL PATEL", "₹10000", "DUE IN 10 DAYS", false, "assets/images/bg_card_white_gray.png", "assets/images/visa.png", "assets/images/icici2.png"),
  CreditCardModel(1, "AXIS LIFESTYLE", "4326 7283 XXXX 4839", "NEHA VERMA", "₹5000", "DUE IN 12 DAYS", false, "assets/images/bg_card_dark.png", "assets/images/mastercardd.png", "assets/images/axis.png"),
];

List<String> bottomSheetRecommendedList = [
  "MCD",
  "Dominos",
  "Ebay",
  "BOAT",
  "Amazon"
];