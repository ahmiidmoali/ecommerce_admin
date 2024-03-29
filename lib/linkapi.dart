class AppLink {
  static const String server = "http://10.0.2.2:8012/ecommerce";
  static const String imageStatic = "http://10.0.2.2:8012/ecommerce/images";
  //.................
  static const String imagecategories = "$imageStatic/categories";
  static const String imageitems = "$imageStatic/items";
  static const String imageads = "$imageStatic/ads";
  //.................

  static const String test = "$server/test.php";
  //auth
  static const String signup = "$server/admin/auth/signup.php";
  static const String resend = "$server/admin/auth/resend.php";
  static const String verifycode = "$server/admin/auth/verifycode.php";
  static const String login = "$server/admin/auth/login.php";
  //forgetpassword
  static const String checkemailF = "$server/forgetpassword/checkemail.php";
  static const String verifycodeF = "$server/forgetpassword/verifycode.php";
  static const String resetpasswordF =
      "$server/forgetpassword/resetpassword.php";
  //home
  static const String home = "$server/home.php";

  //items
  static const String itemspage = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  static const String addfavourite = "$server/favourites/add.php";
  static const String removefavourite = "$server/favourites/remove.php";
  static const String viewfavourite = "$server/favourites/view.php";
  //cart
  static const String addcart = "$server/cart/add.php";
  static const String removecart = "$server/cart/remove.php";
  static const String getcountitems = "$server/cart/getcountitems.php";
  static const String viewcart = "$server/cart/view.php";
  //address
  static const String addressadd = "$server/address/add.php";
  static const String addressdelete = "$server/address/delete.php";
  static const String addressedit = "$server/address/edit.php";
  static const String addressview = "$server/address/view.php";
  //coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //notifications
  static const String notifications = "$server/notifications.php";
  //offers
  static const String offers = "$server/offers.php";
  //----------------------------------------------------------------
  static const String catview = "$server/admin/categories/view.php";
  static const String catadd = "$server/admin/categories/add.php";
  //-items--
  static const String itemsview = "$server/admin/items/view.php";
  static const String itemsadd = "$server/admin/items/add.php";
  static const String itemsedit = "$server/admin/items/update.php";
  static const String itemsdelete = "$server/admin/items/delete.php";
  //orders checkout
  static const String checkout = "$server/orders/checkout.php";
  static const String pending = "$server/admin/orders/pending.php";
  static const String details = "$server/admin/orders/details.php";
  static const String delete = "$server/orders/delete.php";
  static const String rating = "$server/orders/rating.php";
  //--ads-
  static const String adsview = "$server/admin/ads/view.php";
  static const String adsadd = "$server/admin/ads/add.php";
  static const String adsedit = "$server/admin/ads/edit.php";
  static const String adsdelete = "$server/admin/ads/delete.php";
}
