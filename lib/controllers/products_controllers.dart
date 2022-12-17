import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:storeapp/controllers/products_repo.dart';

class ProductsController extends GetxController {
  ProductsRepo productsRepo = ProductsRepo();
  RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;

  ProductsController() {
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    products = await productsRepo.loadProductsFromApi();
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
