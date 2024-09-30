import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final double width;
  final double height;
  final List<String> predictions;
  final Function(String) onSearch;

  const CustomSearchBar({
    required this.width,
    required this.height,
    required this.predictions,
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController _controller = TextEditingController();
  List<String> filteredPredictions = [];
  bool showPredictions = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      filteredPredictions = widget.predictions
          .where((prediction) =>
              prediction.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
      showPredictions = _controller.text.isNotEmpty;
    });
  }

  void _hidePredictions() {
    setState(() {
      showPredictions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the predictions list when tapping outside the search bar
        FocusScope.of(context).unfocus();
        _hidePredictions();
      },
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FocusScope(
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          _hidePredictions();
                        }
                      },
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                        ),
                        onSubmitted: (value) {
                          widget.onSearch(value);
                          _hidePredictions();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey[600]),
                    onPressed: () {
                      widget.onSearch(_controller.text);
                      _hidePredictions();
                    },
                  ),
                ),
              ],
            ),
          ),
          if (showPredictions && filteredPredictions.isNotEmpty)
            SizedBox(
              width: widget.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredPredictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredPredictions[index]),
                    onTap: () {
                      _controller.text = filteredPredictions[index];
                      widget.onSearch(filteredPredictions[0]);
                      _hidePredictions();
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
