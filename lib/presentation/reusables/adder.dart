import 'package:flutter/material.dart';

class Adder extends StatefulWidget {
  final double width;
  final double height;
  final int initialValue;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  Adder({
    required Key key,
    required this.width,
    required this.height,
    required this.initialValue,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  _AdderState createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  // Getter for the counter value
  int get counter => _counter;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    widget.onIncrement();
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
    widget.onDecrement();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: _decrementCounter,
              icon: Icon(Icons.remove),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 20.0),
            ),
            IconButton(
              onPressed: _incrementCounter,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
