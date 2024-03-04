import 'package:get/get.dart';

import '../../../data/models/response/product/product_response.dart';

class ProductsController extends GetxController{





  final List<Product> products = <Product>[
    const Product(
        id: 1,
        name: 'Summer Breeze Maxi Dress sssssssssssssssssssssssssssssssssssssssssssssss',
        price: 49.99,
        quantity: 30,
        description: 'Flowy and comfortable maxi dress perfect for summer days.'
    ),
    const Product(
        id: 2,
        name: 'Elegant Evening Gown',
        price: 129.99,
        quantity: 15,
        description: 'A stunning gown for special evening events and occasions.'
    ),
    const Product(
        id: 3,
        name: 'Casual Striped Shirt Dress',
        price: 34.99,
        quantity: 25,
        description: 'Versatile shirt dress with a stylish striped pattern.'
    ),
    const Product(
        id: 4,
        name: 'Chic Little Black Dress',
        price: 69.99,
        quantity: 20,
        description: 'A timeless classic, perfect for various events and parties.'
    ),
    const Product(
        id: 5,
        name: 'Bohemian Floral Midi Dress',
        price: 54.99,
        quantity: 18,
        description: 'Midi dress with a bohemian floral design, great for a casual day out.'
    ),
    const Product(
        id: 6,
        name: 'Sporty Tank Dress',
        price: 29.99,
        quantity: 40,
        description: 'Comfortable and sporty tank dress for an active lifestyle.'
    ),
    const Product(
        id: 7,
        name: 'Vintage Lace Cocktail Dress',
        price: 79.99,
        quantity: 12,
        description: 'Elegant lace cocktail dress with a vintage touch.'
    ),
    const Product(
        id: 8,
        name: 'Denim Overall Dress',
        price: 44.99,
        quantity: 22,
        description: 'Trendy overall dress made from durable denim fabric.'
    ),
    const Product(
        id: 9,
        name: 'Sweater Knit Turtleneck Dress',
        price: 39.99,
        quantity: 28,
        description: 'Cozy turtleneck dress made from soft sweater knit material.'
    ),
    const Product(
        id: 10,
        name: 'Flirty Wrap Dress',
        price: 59.99,
        quantity: 15,
        description: 'Flattering wrap dress with a playful and flirty design.'
    ),
  ];
}