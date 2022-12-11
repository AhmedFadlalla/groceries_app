String baseUrl = 'https://eraastore.eraasoft.com/api/';
String baseUrlImage = 'https://eraastore.eraasoft.com/';

String register="auth/register";
 String login="auth/login";
 String logoutPoint="auth/logout";
 String profile="auth/refresh";
 String categories="categories";
 String products="products";
String cart="carts";
 String orderData="order";
 String getProductsByCategory(int id)=>"categories/$id/products";
 String getProductDetails(int id)=>"$products/$id";
 String addProductToCartEndPoint(int id)=>"addtocart/$id";
 String addProductToFavouriteEndPoint(int id)=>"addtocart/$id";
 String searchByProductName(String name)=>"searchproductnames?name=$name";
