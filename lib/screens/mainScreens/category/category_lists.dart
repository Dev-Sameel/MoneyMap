import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../subScreens/refactoring/styles.dart';
import '../../../models/category/category_model.dart';
import 'cate_del_pop.dart';

Widget Function(BuildContext, List<CategoryModel>, Widget?) categoryItems(
    BuildContext context, Color itemColor) {
  return (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
    return newList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (ctx, index) {
                final category = newList[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.13)),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.15),
                                  Colors.white.withOpacity(0.05),
                                ]),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cateDelPop(context, category);
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.clear_outlined,
                                      shadows: <Shadow>[
                                        Shadow(
                                          color: white,
                                          blurRadius: 15.0,
                                        ),
                                      ],
                                      color: white,
                                      size: 22,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                capitalize(
                                  category.name,
                                ),
                                style: const TextStyle(
                                    fontFamily: 'Inder',
                                    color: Colors.white54,
                                    fontSize: 22.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: newList.length,
            ),
          )
        : dataEmpty(context);
  };
}
