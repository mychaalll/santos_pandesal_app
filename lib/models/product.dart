class Product{
  final String name;
  final double price;
  final String thumbnail;
  final String details;

  Product({required this.name, required this.price, required this.thumbnail, required this.details});
 
}

List<Product> breadList = [
    Product(
      name: 'Regular Pandesal',
      price: 4.00,
      thumbnail: 'assets/images/SmallPandesal.png',
      details: 'Regular pandesal, a beloved Filipino staple, is a soft and slightly sweet bread roll with a golden-brown crust. It boasts a delightful combination of fluffy interior and slight crispness on the outside, making it a versatile choice for breakfast or as a snack. Its nostalgic aroma and simple yet satisfying taste make pandesal a cherished treat for all ages.',
    ),
    Product(
      name: 'Long Pandesal',
      price: 6.00,
      thumbnail: 'assets/images/LongPandesal.png',
      details: 'Long pandesal, a cherished classic in Filipino cuisine, is a type of bread roll known for its elongated shape and enticing aroma. With a soft, pillowy interior and a golden-brown, delicately crispy exterior, this delightful creation offers a perfect balance of textures. Its subtly sweet taste adds a touch of warmth to breakfasts, snacks, or even as a complement to hearty meals. Whether enjoyed on its own, filled with various spreads, or paired with local dishes, long pandesal embodies the heartwarming essence of Filipino comfort food.',
    ),
    Product(
      name: 'Tasty Breadloaf',
      price: 45.00,
      thumbnail: 'assets/images/TastyBread.png',
      details: 'The tasty bread loaf is a culinary delight that promises a wonderful blend of flavors and textures. This artisanal loaf features a golden-brown, crisp crust that gives way to a tender and flavorful interior. Crafted with the finest ingredients and baked to perfection, this bread offers a satisfying balance between a hearty, substantial bite and a mouthwatering taste that pairs well with both sweet and savory accompaniments. Whether enjoyed fresh from the oven or used to create delicious sandwiches and toast, the tasty bread loaf is a true testament to the artistry of baking.',
    ),
  ];

List<Product> spreadList = [
  Product(
      name: 'CheezWiz Spread 210 ml',
      price: 20.00,
      thumbnail: 'assets/images/CheezWiz210.png',
      details: 'Cheez Whiz spread, a beloved classic, is a creamy and flavorful cheese spread that adds a touch of indulgence to your meals. With its smooth texture and rich cheese taste, Cheez Whiz is a versatile companion for snacks, sandwiches, and recipes. Whether spread on crackers, melted into a warm dip, or used as a delectable topping, Cheez Whiz spread brings a burst of cheesy delight to your culinary creations, making every bite a truly cheesy and satisfying experience.',
    ),
    Product(
      name: 'PureFoods Liver Spread',
      price: 35.00,
      thumbnail: 'assets/images/LiverSpreadPF.png',
      details: 'Purefoods Liver Spread is a delectable and savory spread that offers a rich and indulgent taste of liver. With its velvety texture and flavorful profile, this spread is a versatile addition to various dishes. Whether spread on toast, incorporated into pasta sauces, or used as a savory base for recipes, Purefoods Liver Spread brings a distinctive and delightful depth of flavor that elevates your culinary creations, turning ordinary meals into a gourmet experience.',
    ),
    Product(
      name: 'Reno Liver Spread',
      price: 40.00,
      thumbnail: 'assets/images/LiverSpreadReno.png',
      details: 'Reno Liver Spread is a flavorful and savory spread that brings the distinctive taste of liver to your culinary endeavors. With its smooth consistency and bold flavor, this spread adds a hearty and indulgent touch to your dishes. Perfect for spreading on bread, enhancing pasta sauces, or adding depth to recipes, Reno Liver Spread infuses a rich and satisfying essence into your meals, transforming ordinary flavors into a more robust and memorable dining experience.',
    ),
    Product(
      name: 'Lady\'s Choice Bacon Spread 470ml',
      price: 130.00,
      thumbnail: 'assets/images/BaconLC470.jpg',
      details: 'Lady\'s Choice Bacon Spread, available in a convenient 470ml jar, is a delectable condiment that brings the irresistible flavor of smoky bacon to your table. Made with high-quality ingredients, this spread offers a harmonious blend of savory and slightly sweet notes, reminiscent of crispy bacon slices sizzling in the pan. Whether used as a sandwich spread, a dip for snacks, or a flavor enhancer in your favorite recipes, Lady\'s Choice Bacon Spread adds a delightful twist to your culinary creations, making every bite a savory and memorable experience.',
    ),
    Product(
      name: 'Lady\'s Choice Chicken Spread 470ml',
      price: 130.00,
      thumbnail: 'assets/images/ChickenLC470.jpg',
      details: 'Lady\'s Choice Chicken Spread, thoughtfully packaged in a convenient 470ml jar, is a delectable spread that brings the rich and savory taste of chicken to your culinary endeavors. Crafted with care, this spread offers a harmonious fusion of flavors, capturing the essence of perfectly seasoned chicken. Its creamy texture and delectable taste make it an ideal choice for sandwiches, wraps, or as a delightful dip for your favorite snacks. Whether used as a versatile ingredient in recipes or as a flavorful spread, Lady\'s Choice Chicken Spread adds a touch of culinary magic to every dish, transforming ordinary moments into flavorful experiences.',
    ),
    Product(
      name: 'Lady\'s Choice Chicken Spread 80ml',
      price: 45.00,
      thumbnail: 'assets/images/ChickenLC80.jpg',
      details: 'Lady\'s Choice Chicken Spread, thoughtfully packaged in a convenient 80ml pack, is a delectable spread that brings the rich and savory taste of chicken to your culinary endeavors. Crafted with care, this spread offers a harmonious fusion of flavors, capturing the essence of perfectly seasoned chicken. Its creamy texture and delectable taste make it an ideal choice for sandwiches, wraps, or as a delightful dip for your favorite snacks. Whether used as a versatile ingredient in recipes or as a flavorful spread, Lady\'s Choice Chicken Spread adds a touch of culinary magic to every dish, transforming ordinary moments into flavorful experiences.',
    ),
    Product(
      name: 'Lady\'s Choice Real Mayonnaise Spread 470ml',
      price: 130.00,
      thumbnail: 'assets/images/MayoLC470.jpg',
      details: 'In the convenient 470ml jar, Lady\'s Choice Real Mayonnaise Spread stands as a hallmark of creamy indulgence. Made with the finest ingredients, this spread embodies the classic taste and velvety texture of real mayonnaise. Its smooth consistency and rich flavor elevate sandwiches, salads, and various dishes, lending a satisfying and wholesome touch to every bite. Whether used as a savory topping or an essential ingredient in your culinary creations, Lady\'s Choice Real Mayonnaise Spread brings a timeless taste of comfort and quality to your table, enriching meals with its unmistakable creamy goodness.',
    ),
    Product(
      name: 'Lady\'s Choice Real Mayonnaise Spread 80ml',
      price: 45.00,
      thumbnail: 'assets/images/MayoLC80.jpg',
      details: 'In the convenient 80ml pack, Lady\'s Choice Real Mayonnaise Spread stands as a hallmark of creamy indulgence. Made with the finest ingredients, this spread embodies the classic taste and velvety texture of real mayonnaise. Its smooth consistency and rich flavor elevate sandwiches, salads, and various dishes, lending a satisfying and wholesome touch to every bite. Whether used as a savory topping or an essential ingredient in your culinary creations, Lady\'s Choice Real Mayonnaise Spread brings a timeless taste of comfort and quality to your table, enriching meals with its unmistakable creamy goodness.',
    ),
    Product(
      name: 'Lady\'s Choice Sandwich Spread 470ml',
      price: 130.00,
      thumbnail: 'assets/images/SandwichLC470.jpg',
      details: 'Presented in a convenient 470ml jar, Lady\'s Choice Sandwich Spread is a delightful medley of flavors that adds a burst of taste to your dishes. This versatile spread combines the goodness of real vegetables, select meats, and a creamy dressing, resulting in a harmonious blend of textures and tastes. Perfect as a sandwich filling, a dip for snacks, or a creative ingredient in recipes, Lady\'s Choice Sandwich Spread offers a quick and flavorful solution to mealtime. Elevate your culinary experiences with the balanced and delectable essence of Lady\'s Choice Sandwich Spread, transforming ordinary bites into extraordinary moments.',
    ),
    Product(
      name: 'Lady\'s Choice Sandwich Spread 80ml',
      price: 45.00,
      thumbnail: 'assets/images/SandwichLC80.jpg',
      details: 'Presented in a convenient 80ml pack, Lady\'s Choice Sandwich Spread is a delightful medley of flavors that adds a burst of taste to your dishes. This versatile spread combines the goodness of real vegetables, select meats, and a creamy dressing, resulting in a harmonious blend of textures and tastes. Perfect as a sandwich filling, a dip for snacks, or a creative ingredient in recipes, Lady\'s Choice Sandwich Spread offers a quick and flavorful solution to mealtime. Elevate your culinary experiences with the balanced and delectable essence of Lady\'s Choice Sandwich Spread, transforming ordinary bites into extraordinary moments.',
    ),
    Product(
      name: 'Lady\'s Choice Tuna Spread 470ml',
      price: 130.00,
      thumbnail: 'assets/images/TunaLC470.jpg',
      details: 'In a convenient 470ml jar, Lady\'s Choice Tuna Spread introduces a delightful twist to your dining experiences. Infused with the savory goodness of tuna, this spread offers a harmonious combination of flavors that captivates the palate. Its creamy texture and distinct taste make it a versatile addition to sandwiches, wraps, and snacks. Whether used as a dip, a sandwich filling, or a creative ingredient in recipes, Lady\'s Choice Tuna Spread brings the ocean\'s essence to your table, creating a delightful symphony of flavors that transports you to coastal bliss with every bite.',
    ),
    Product(
      name: 'Lady\'s Choice Tuna Spread 80ml',
      price: 45.00,
      thumbnail: 'assets/images/TunaLC80.jpg',
      details: 'In a convenient 80ml pack, Lady\'s Choice Tuna Spread introduces a delightful twist to your dining experiences. Infused with the savory goodness of tuna, this spread offers a harmonious combination of flavors that captivates the palate. Its creamy texture and distinct taste make it a versatile addition to sandwiches, wraps, and snacks. Whether used as a dip, a sandwich filling, or a creative ingredient in recipes, Lady\'s Choice Tuna Spread brings the ocean\'s essence to your table, creating a delightful symphony of flavors that transports you to coastal bliss with every bite.',
    ),
  ];
