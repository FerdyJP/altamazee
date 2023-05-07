// import 'package:altamazee/models/product_model.dart';
// import 'package:altamazee/providers/search_product_provider.dart';
// import 'package:altamazee/widgets/item_search_widget.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../theme.dart';

// // TODO: VERSION 1

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SearchProductProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         elevation: 0,
//         title: Text(
//           'Search Page',
//           style: primaryTextStyle.copyWith(
//             fontSize: 18,
//             fontWeight: medium,
//             color: backgroundColor1,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               left: 12,
//               right: 12,
//               top: defaultMargin,
//             ),
//             child: DropdownSearch<ProductModel>(
//               asyncItems: (String text) => provider.searchProduct(text),
//               items: provider.products,
//               itemAsString: (ProductModel data) => data.name ?? "name",
//               clearButtonProps: ClearButtonProps(
//                 icon: Icon(
//                   Icons.close,
//                   color: primaryColor,
//                 ),
//               ),
//               onChanged: (value) async {
//                 provider.results =
//                     await provider.searchProduct(value!.name.toString());
//               },
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 12,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: provider.results.length,
//               itemBuilder: (BuildContext context, int index) {
//                 ProductModel product = provider.results[index];
//                 return ItemSearchWidget(product: product);
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// //TODO: VERSION 2

import 'package:altamazee/models/product_model.dart';
import 'package:altamazee/providers/search_product_provider.dart';
import 'package:altamazee/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/item_search_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Search Page',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
            child: Autocomplete<ProductModel>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                try {
                  if (textEditingValue.text == '') {
                    return const Iterable<ProductModel>.empty();
                  }
                  return provider.searchProduct(textEditingValue.text);
                } catch (e) {
                  rethrow;
                }
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<ProductModel> onSelected,
                  Iterable<ProductModel> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ProductModel option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: Text(option.name ?? "name"),
                                leading: Image.network(
                                  option.galleries?[0].url ??
                                      "https://via.placeholder.com/150",
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onSubmitted: (String value) {
                    onFieldSubmitted();
                    textEditingController.clear();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                  ),
                );
              },
              displayStringForOption: (ProductModel option) =>
                  option.name ?? "name",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel product = provider.products[index];
                return ItemSearchWidget(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
