import 'package:flutter/material.dart';
import 'package:muyufar_game/domain/models/product_model.dart';
import 'package:muyufar_game/infrastructure/theme/colors.theme.dart';

class CardBannerProducy extends StatelessWidget {
  final ProductModel product;
  const CardBannerProducy({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 350,
      color: Colors.transparent,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 350,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 16, spreadRadius: -4)
                ]),
            child: Row(
              children: [
                const SizedBox(width: 110),
                SizedBox(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorPrimary,
                            fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        product.genre,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorTextBlack,
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        product.description,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorTextBlack,
                            fontSize: 12),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            width: 110,
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        ],
      ),
    );
  }
}
