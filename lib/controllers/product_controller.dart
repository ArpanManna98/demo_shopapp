import 'package:demo_shopapp/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> ProductData = [];

  List<Product> cartItem = List<Product>.empty().obs;
  addtoCart(Product item) {
    cartItem.add(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;
  @override
  void onInit() {
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
        id: 1,
        price: 499,
        productDescription: 'some description about product',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productName: 'T-Shirt',
        favorite: false,
      ),
      Product(
        id: 2,
        price: 799,
        productDescription: 'some description about product',
        productImage: 'assets/images/shoes.jpg',
        productName: 'Shoes',
        favorite: false,
      ),
      Product(
        id: 3,
        price: 1000,
        productDescription: 'some description about product',
        productImage: 'assets/images/jeans.png',
        productName: 'Jeans',
        favorite: false,
      ),
    ];
    ProductData.assignAll(serverResponse);
    print(ProductData);
    update();
  }

  addToFavorites(id) {
    var index = ProductData.indexWhere((element) => element.id == id);
    ProductData[index].favorite = !ProductData[index].favorite;
    update();
  }
}
