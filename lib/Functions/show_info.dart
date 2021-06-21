import 'package:flutter/material.dart';

void showInfo(BuildContext context, Map data) {
  showDialog(
      context: context,
      builder: (context) {
        List<Widget> children = [];
        data.forEach((key, value) {
          children.add(Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: key,
                        style: TextStyle(color: Theme.of(context).accentColor)),
                    TextSpan(text: ' : '),
                    TextSpan(text: value.toString()),
                  ],
                ),
              )));
        });
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).backgroundColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          child: ListView(
            children: children,
          ),
        );
      });
}
