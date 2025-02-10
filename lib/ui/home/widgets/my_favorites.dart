import 'package:flutter/material.dart';

import '../../../domain/models/favorite_item.dart';
import '../../../widgets/divider.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FavoriteItem> favoriteItems = [
      FavoriteItem(title: 'Cartão Virtual', icon: Icons.credit_card_outlined),
      FavoriteItem(title: 'Recarga de Celular', icon: Icons.add_card),
      FavoriteItem(title: 'Transferências', icon: Icons.shield_outlined),
      FavoriteItem(title: 'Pacote SMS', icon: Icons.mail_outline),
    ];

    return Container(
      margin: const EdgeInsets.only(
        top: 14.0,
      ),
      child: Column(
        children: [
          const DefaultDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              height: 160.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Meus Favoritos',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(26, 26, 26, 1),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Personalizar',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color.fromRGBO(0, 0, 0, 0.7),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            alignment: Alignment.centerLeft,
                            icon: const Icon(
                              Icons.apps,
                              color: Color.fromRGBO(40, 144, 207, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: favoriteItems.length,
                      itemBuilder: (ctx, index) {
                        final favoriteItem = favoriteItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 12.0),
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      favoriteItem.icon,
                                      size: 32,
                                      color: const Color.fromRGBO(
                                        52,
                                        108,
                                        189,
                                        1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 10.0,
                                      ),
                                      child: Text(
                                        favoriteItem.title,
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                            26,
                                            26,
                                            26,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DefaultDivider()
        ],
      ),
    );
  }
}
