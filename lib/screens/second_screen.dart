import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int? _activeMeterIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount:  2,
          itemBuilder: (BuildContext context, int i) {
            return Card(
              margin:
              const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: new ExpansionPanelList(
                expansionCallback: (int index, bool status) {
                  setState(() {
                    _activeMeterIndex = _activeMeterIndex == i ? null : i;
                  });
                },
                children: [
                  new ExpansionPanel(
                    isExpanded: _activeMeterIndex == i,
                    headerBuilder: (BuildContext context,
                        bool isExpanded) =>
                    new Container(
                        padding:
                        const EdgeInsets.only(left: 15.0),
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'list-$i',
                        )),
                    body: new Container(child: new Text('content-$i'),),),
                ],
              ),
            );
          }),
    );
  }
}
