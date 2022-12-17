import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapp/controllers/products_controllers.dart';
import 'package:storeapp/cart.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final ProductsController productsController = Get.put(ProductsController());

  final List categories = [
    "All",
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.purple[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            _buildCategoriesRow(),
            Expanded(
              child: Obx(
                () {
                  if (productsController.loading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (productsController.products.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }
                  if (productsController.showGrid.value) {
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: productsController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ));
                          },
                          child: Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(productsController
                                            .products[index]["image"]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productsController.products[index]
                                                ["title"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              productsController.products[index]
                                                  ["description"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "\$${productsController.products[index]["price"]}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return _buildProductsList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.purple,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsController.toggleGrid();
            },
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            )),
      ],
    );
  }

  Container _buildCategoriesRow() {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: index == 0 ? Colors.purple : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              fontSize: 20,
              color: index == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: const BackButton(),
      elevation: 0,
      title: const Text(
        "STORE",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
