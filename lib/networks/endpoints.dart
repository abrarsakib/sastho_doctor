//live url
const String url = "";
//test url
//const String url ='';

class Endpoints {
  static String getProfile() => "/api/portfolio";
  static String getFaq() => "/api/faqs";
  static String getBlogHeader() => "/api/blogs/header";
  static String getBlogDetail(String id) => "/api/blogs/details/$id";
  static String getPublication() => "/api/publications";
  static String postFiles() => "/api/fines";
  static String getTerms() => "/api/terms/condition";

  // ?bill_type=$billtype&name=$name&email=$email&phone=$phone&message=$message&documents=$file"

  // static String signup() => "/services/app/MobileAppCommon/CustomerRegister";

  // static String verification() =>
  //     "$url" + "/services/app/MobileAppCommon/VerifyPhoneNumber";

  // static String resendVerification(String email) =>
  //     "$url" +
  //     "/services/app/MobileAppCommon/ResendPhoneVerificationCode?email=$email";

  // static String signin() => "/TokenAuth/AuthenticateForApp";

  // static String socialSignin(
  //   String fNmae,
  //   String lName,
  //   String email,
  //   String provider,
  //   String providerKey,
  // ) =>
  //     "$url" +
  //     "/TokenAuth/ExternalAuthenticateForApp?FirstName=$fNmae&LastName=$lName&Email=$email&Provider=$provider&ProviderKey=$providerKey";

  // static String sendPasswordResetCode() =>
  //     "/services/app/MobileAppCommon/SendPasswordResetCode";

  // static String verifyPasswordResetCode() =>
  //     "$url" + "/services/app/MobileAppCommon/VerifyPasswordResetCode";

  // static String resetPassword() =>
  //     "$url" + "/services/app/MobileAppCommon/ResetPassword";

  // static String topProductCategoriesByHub(String id) =>
  //     "/services/app/MobileAppCommon/GetTopProductCategoriesByHub?hubid=$id";
  // //requires shop id
  // static String productsByCategory(String id) =>
  //     "/services/app/MobileAppCommon/GetAllProductByCategory?productCategoryId=$id";

  // static String topStoresByHub(String id) =>
  //     "/services/app/MobileAppCommon/GetTopStoresByHub?hubid=$id";

  // static String getAllStoresByHub(String id) =>
  //     "/services/app/MobileAppCommon/GetAllStoresByHub?hubid=$id";

  // static String topRatedProductsByHub(String id) =>
  //     "/services/app/MobileAppCommon/GetTopProductsByHub?hubid=$id";

  // static String currentUserInformation() =>
  //     "$url" + "/services/app/Session/GetCurrentLoginInformations";

  // static String paymentTestSquare() =>
  //     "https://connect.squareupsandbox.com/v2/payments";

  // static String placeOrder() => "/services/app/MobileAppCommon/CreateOrder";

  // static String viewOrders(int contactId) =>
  //     "/services/app/MobileAppCommon/GetAllOrdersByContact?contactId=$contactId";

  // static String getAllStore() =>
  //     "$url" + "/services/app/MobileAppCommon/GetAllCustomStore";

  // static String cancelOrder(int orderId) =>
  //     "/services/app/MobileAppCommon/CancelOrder?orderId=$orderId";

  // static String editProfile() =>
  //     "$hubURL" + "/api/services/app/MobileAppCommon/EditProfile";

  // static String getHubLocations() =>
  //     "$hubURL" + "/api/services/app/PublicPagesCommon/GetAllHubForDropdown";

  // static String getAllProductCategoriesByStore(String id) =>
  //     "/services/app/MobileAppCommon/GetAllProductCategoriesByStore?storeid=$id";

  // static String getAllProductsByStoreAndCategory(
  //         String storeId, String categoryId) =>
  //     "/services/app/MobileAppCommon/GetAllProductsByStoreAndCategory?storeid=$storeId&productcategoryId=$categoryId";

  // static String sendBulkContactForReferral() =>
  //     "$hubURL" +
  //     "/api/services/app/MobileAppCommon/SaveBulkContactForReferral";

  // static String getProductDetailsById(String productId) =>
  //     "$hubURL" +
  //     "/services/app/PublicPagesCommon/GetProductDetailsById?productId=$productId";

  // static String getAllProductReviewsByProduct(String productId) =>
  //     "$hubURL" +
  //     "/services/app/PublicPagesCommon/GetAllProductReviewsByProductBySp?ProductIdFilter=$productId&IsPublish=1";

  // static String addContactAddresses(String productId) =>
  //     "$hubURL" + "/services/app/ContactAddresses/CreateOrEdit";

  // static String getContactAddresses(int contactId) =>
  //     "$hubURL" +
  //     "/api/services/app/ContactAddresses/GetAllByContactId?contactId=$contactId";
}
