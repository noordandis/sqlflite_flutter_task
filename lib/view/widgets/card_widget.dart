import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/shop_model.dart';
import '../../core/shop_cubit/shop_cubit.dart';

class CardWidget extends StatelessWidget {
  final Shop shop;

  const CardWidget({super.key, required this.shop});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        color: Color.fromARGB(255, 237, 213, 248),
        elevation: 1,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    shop.productName,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 4, 74),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    " Qty : ${shop.quantity}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 4, 74),
                      fontSize: 18,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 240),
              IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.pink,
                  size: 26,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text('Confirm Delete'),
                        content: Text(
                          'Are you sure you want to delete "${shop.productName}"?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              context.read<ShopCubit>().deleteShop(shop.id!);
                              Navigator.pop(dialogContext);
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
