import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final String size;
  final int stock;
  final bool isFeatured;
  final bool forSale;

  const ItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.size,
    required this.stock,
    required this.isFeatured,
    required this.forSale,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 72,
                height: 72,
                child: Image.network(
                  thumbnail,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + Featured chip
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade600,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Category & Size
                  Text(
                    '$category • Size: $size',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Price
                  Text(
                    'Rp $price',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Stock & For sale status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stock: $stock',
                        style: TextStyle(
                          fontSize: 11,
                          color: stock > 0
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                        ),
                      ),
                      Text(
                        forSale ? 'Available' : 'Not for sale',
                        style: TextStyle(
                          fontSize: 11,
                          color: forSale
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
