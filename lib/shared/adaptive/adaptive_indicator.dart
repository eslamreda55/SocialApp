import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIndictor extends StatelessWidget {

  String os='';

  AdaptiveIndictor({
    @required this.os
  });

  @override
  Widget build(BuildContext context) 
  {
    if(os == 'android')
    return CircularProgressIndicator();


    return CupertinoActivityIndicator();
  }
}