import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette_util.dart';
import 'package:fresshi/app/util/currency_formatter_util.dart';

class ProductCard extends StatefulWidget {
  final String productImage;
  final String productName;
  final double currentPrice;
  final double originalPrice;
  final double weight;
  final double unitPrice;
  final double width;
  final double height;
  final String? tag; // Optional tag (e.g., "Nuevo")
  final Color? tagColor; // Optional color for the tag

  // Callback to get the quantity outside
  final ValueChanged<int> onQuantityChanged;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    required this.weight,
    required this.unitPrice,
    this.width = 200.0, // Default width
    this.height = 250.0, // Default height
    this.tag, // Optional tag
    this.tagColor, // Optional color for the tag
    required this.onQuantityChanged,
    required this.productImage,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _quantity = 0;
  bool _isExpanded = false; // Manage expanded state
  Timer? _collapseTimer; // Timer for collapse after 5 seconds

  // Method to increment the quantity and expand the counter view
  void _incrementQuantity() {
    setState(() {
      _quantity += 1;
      _isExpanded = true; // Expand the counter view on increment
      widget.onQuantityChanged(_quantity);
    });

    _cancelCollapseTimer(); // Cancel any collapse timer when quantity increases
  }

  // Method to decrement the quantity
  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity -= 1;
        widget.onQuantityChanged(_quantity);
      });

      if (_quantity == 0) {
        // Start the timer when quantity is 0
        _startCollapseTimer();
      }
    }
  }

  // Start a timer to collapse after 5 seconds if quantity is 0
  void _startCollapseTimer() {
    _collapseTimer?.cancel(); // Cancel any previous timer
    _collapseTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _isExpanded = false; // Collapse after 5 seconds
      });
    });
  }

  // Cancel the collapse timer
  void _cancelCollapseTimer() {
    _collapseTimer?.cancel();
  }

  @override
  void dispose() {
    _collapseTimer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          constraints: const BoxConstraints(
            minWidth: 200,
            minHeight: 250,
          ),
          decoration: BoxDecoration(
            color: ColorPalette.grayBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                SizedBox(
                  width: widget.width * 0.5,
                  height: widget.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      widget.productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: widget.width * 0.9,
                    height: widget.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.primaryColor),
                          ),
                          Row(
                            children: [
                              Text(
                                Formatter.formatNumberCOP(
                                    widget.currentPrice.toStringAsFixed(2)),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.primaryTextColor),
                              ),
                              const SizedBox(width: 8),
                              if (widget.originalPrice > widget.currentPrice)
                                Text(
                                  Formatter.formatNumberCOP(
                                      widget.originalPrice.toStringAsFixed(2)),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: ColorPalette.secondaryTextColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${widget.weight} kg",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorPalette.secondaryTextColor,
                                ),
                              ),
                              Text(
                                '(${Formatter.formatNumberCOP(widget.unitPrice.toStringAsFixed(2))}/Kg)',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorPalette.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // Optional "Nuevo" tag at the top left with customizable color
        if (widget.tag != null)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: widget.tagColor ?? Colors.orange, // Custom or default color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                widget.tag!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        // Expanded counter view
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: _incrementQuantity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Smooth animation
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isExpanded || _quantity > 0
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: _decrementQuantity,
                            child: const Icon(
                              Icons.remove,
                              color: ColorPalette.accentColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 16,
                              color: ColorPalette.accentColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: _incrementQuantity,
                            child: const Icon(
                              Icons.add,
                              color: ColorPalette.accentColor,
                              size: 20,
                            ),
                          ),
                        ],
                      )
                    : const Icon(
                        Icons.add,
                        color: ColorPalette.accentColor,
                        size: 30,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}