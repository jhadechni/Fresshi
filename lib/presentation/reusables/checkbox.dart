import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette.dart';

class FavoriteCheckbox extends StatefulWidget {
  final bool initialValue;
  final VoidCallback onChecked;
  final VoidCallback onUnchecked;
  final String labelText;

  FavoriteCheckbox({
    required this.initialValue,
    required this.onChecked,
    required this.onUnchecked,
    required this.labelText,
  });

  @override
  _FavoriteCheckboxState createState() => _FavoriteCheckboxState();
}

class _FavoriteCheckboxState extends State<FavoriteCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  // Getter for the checkbox state
  bool get isChecked => _isChecked;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    if (_isChecked) {
      widget.onChecked();
    } else {
      widget.onUnchecked();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            _toggleCheckbox();
          },
        ),
        Text(
          widget.labelText,
          style: const TextStyle(fontSize: 16.0,color: ColorPalette.secondaryTextColor),
        ),
      ],
    );
  }
}
