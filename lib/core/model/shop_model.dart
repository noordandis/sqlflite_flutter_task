class Shop {
  final int? id;
  final String productName;
  final String quantity;

  Shop({this.id, required this.productName, required this.quantity});



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'quantity': quantity,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      productName: map['productName'],
      quantity: map['quantity'],
    );
  }
}