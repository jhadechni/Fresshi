import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette.dart';
import 'package:fresshi/app/util/currency_formatter.dart';

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

  // Callback to get the quantity outside
  final ValueChanged<int> onQuantityChanged;
  //TODO: Add the product tag

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
    required this.onQuantityChanged,
    required this.productImage,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _quantity = 0;

  // Method to get the current quantity outside the widget
  void _incrementQuantity() {
    setState(() {
      _quantity += 1;
      widget.onQuantityChanged(_quantity);
    });
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
                Container(
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
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -6, // Adjust this to place it properly
          right: -6, // Adjust this to place it properly
          child: GestureDetector(
            onTap: _incrementQuantity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
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
