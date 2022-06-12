import 'package:flutter/material.dart';

class ResColors {
  static var primaryColor = HexColor('#1E3697');
  static var tabActiveColor = HexColor('#CE863A');
  static var tabInActiveColor = HexColor('#275F38');
  static var inputGrayColor = HexColor('#707070');
  static var successColor = HexColor('#28A745');
  static var errorColor = HexColor('#F44336');
  static var lineColor = HexColor('#E0E0E0');
  static var overlayColor = HexColor('#FF56303030');
  static var bgNotificationColor = HexColor('#FFB152');
  static var whiteColor = HexColor('#FFFFFF');
  static var blackTextColor = HexColor('#0B2520');
  static var borderPink = HexColor('#ffa412');
  static var dotListHome = HexColor('#00b495');
  static var statusContainer = HexColor('#F5F5F5');
  static var textStatusContainer = HexColor('#86A39A');
  static var textItemsProfile = HexColor('#090A0A');
  static var deepcryan = HexColor('#17483E');
  static var orange = HexColor('#F08C31');
  static var dividerColor = HexColor('#275F38');
  static var borderImageHistory = HexColor('#FFF1E0');
  static var textAuthen = HexColor('#EF413D');
  static var bgImage = HexColor('#CACCCC');
  static var textOrangeColor = HexColor('#DE761C');
  static var disableText = HexColor('#8694A3');
  static var borderHistory = HexColor('#E6E7E8');
  static var deepGreen = HexColor('#005E52');
  static var variant3 = HexColor('#FFF1E0');
  static var textErrorTextField = HexColor('#706D6D');
  static var textError = HexColor('#E30606');
  static var containerIceColor = HexColor('#FFF4CF');
  static var bgAccuracyColor = HexColor('#BA1222');
  static var textColorGreen = HexColor('#00B495');
  static var textBalance = HexColor('#F8E5D4');
  static var bgColorICDone = HexColor('#377C4C');
  static var blackTextTitle = HexColor('#464646');
  static var blackTextIntro = HexColor('#989898');
  static var borderTextField = HexColor('#E1E1E1');
  static var iconHeart = HexColor('#FA5F33');
  static var iconStep = HexColor('#9098FF');
  static var iconEnergy = HexColor('#48C691');
  static var colorDrawSurf = HexColor('#1F319D');

  //fixed
  static var appbarColorLinearOrange = HexColor('#EE8022');
  static var appbarColorLinearWhite = HexColor('#F4AB57');
  static var pacificBlue = HexColor('#0086CB');
  static var bgGreyOpa = HexColor('  #00000080');
  static var grey9A = HexColor('#9A9A9A');
  static var redHeartColor = HexColor('#FA5F33');
  static var greenEnergyColor = HexColor('#48C691');
  static var purpleStep = HexColor('#9098FF');
  static var backgroundColor = HexColor('#9098FF');
}

// Parse hex to color.
class HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(value) : super(_getColorFromHex(value));
}
