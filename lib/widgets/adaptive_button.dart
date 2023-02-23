import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback handler ;


  const AdaptiveButton( this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return  Platform.isIOS ? CupertinoButton(
                  child: Text(text,  style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.bold)),
                  onPressed: handler,
                ):
                TextButton(
                  style: TextButton.styleFrom(
                    // foregroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed: handler,
                  child: Text(text , style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.bold),
                    )
                    );
  }
}