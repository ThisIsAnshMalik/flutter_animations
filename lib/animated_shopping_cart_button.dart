import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              active = !active;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: active ? 200.0 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: active ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(active ? 30 : 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  active
                      ? Icons.add_shopping_cart_outlined
                      : Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (active)
                  const Text(
                    "Item Added To Cart",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
