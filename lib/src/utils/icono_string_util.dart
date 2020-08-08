import 'package:flutter/material.dart';

final _icons = <String , IconData>{

  'list1' : Icons.list,
  'list2' : Icons.list,
  'list3' : Icons.list,
  'list4' : Icons.list,
  'list5' : Icons.list,
  'list6' : Icons.list,
  'list7' : Icons.list,
};




Icon getIcon( String nombreIcono ){

  return Icon( _icons[nombreIcono], color: Colors.blue );

}