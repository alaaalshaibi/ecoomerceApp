import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../controller/items/search.dart';
import '../../../data/model/items_model.dart';

class SearchView extends StatelessWidget {
  final List<ItemsModel> dataSearchModel;
  const SearchView({super.key, required this.dataSearchModel});

  @override
  Widget build(BuildContext context) {
    SearchControllerImp controller = Get.put(SearchControllerImp());
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataSearchModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProductDetails(dataSearchModel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          "${AppLink.imageItems}/${dataSearchModel[index].itemsImage}",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text("${dataSearchModel[index].itemsName}"),
                          subtitle:
                              Text("${dataSearchModel[index].categoriesName}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
