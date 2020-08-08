import 'package:componentes/src/pages/ApiFivePage.dart';
import 'package:componentes/src/pages/ApiSevenPage.dart';
import 'package:componentes/src/pages/ApiSixPage.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/ApiOnePage.dart';
import 'package:componentes/src/pages/ApiTwoPage.dart';
import 'package:componentes/src/pages/ApiThreePage.dart';
import 'package:componentes/src/pages/ApiFourPage.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
    '/'        : (BuildContext context) => HomePage(),
    '1.- Api'  : (BuildContext context) => ApiOnePage(),
    '2.- Api'  : (BuildContext context) => ApiTwoPage(),
    '3.- Api'  : (BuildContext context) => ApiThreePage(),
    '4.- Api'  : (BuildContext context) => ApiFourPage(),
    '5.- Api'  : (BuildContext context) => ApiFivePage(),
    '6.- Api'  : (BuildContext context) => ApiSixPage(),
    '7.- Api'  : (BuildContext context) => ApiSevenPage(),
  };

}
