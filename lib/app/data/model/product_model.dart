import 'dart:convert';

// Main Product model with all properties as nullable
class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  // Factory constructor to parse JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson(),
    };
  }
}

// Rating model with all properties as nullable
class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  // Factory constructor to parse JSON
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );
  }

  // Method to convert Rating to JSON
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

// Function to parse list of Products directly from JSON array
List<Product> parseProducts( responseBody) {
  final List<dynamic> parsed = responseBody;
  return parsed.map<Product>((json) => Product.fromJson(json as Map<String, dynamic>)).toList();
}
