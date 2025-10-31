class AppConstants {
  // API URL
  static const String LIVE_SERVER_ADDRESS = "http://194.233.73.109/";
  static const String LOCAL_SERVER_ADDRESS = "http://0.0.0.0:8000/";
  static const String APP_ADDRESS = LIVE_SERVER_ADDRESS;
  static const String BASE_URL_API = "${APP_ADDRESS}api/";
  static const String BASE_URL_API_V1 = "${BASE_URL_API}v1/";

  // ---------auth-----

  static const String LOGIN = "${BASE_URL_API_V1}client/customer/auth/login/";
  static const String LOGOUT = "${BASE_URL_API_V1}client/customer/auth/logout/";
  static const String REGISTRATION =
      "${BASE_URL_API_V1}client/customer/auth/register/";
  static const String CHANGE_PASSWORD =
      "${BASE_URL_API_V1}client/customer/auth/change-password/";

  // ---------- product -----------
  static const String BEST_SELL =
      "${BASE_URL_API_V1}client/catalog/products/new-arrivals/";
  static const String NEW_ARRIVALS =
      "${BASE_URL_API_V1}client/catalog/products/new-arrivals/";

  // ---------- category -----------
  static const String CATEGORY = "${BASE_URL_API_V1}client/catalog/categories/";

  // ---------- product -----------
  static const String PRODUCT = "${BASE_URL_API_V1}client/catalog/products/";

  // ---------- wish list -----------
  static const String WISH_LIST = "${BASE_URL_API_V1}client/customer/wishlist/";

  // ---------- address -----------
  static const String ADDRESS = "${BASE_URL_API_V1}client/customer/addresses/";

  // ---------profile ------
  static const String PROFILE = "${BASE_URL_API_V1}client/customer/profile/";

  // ---------cart ------
  static const String CARTS = "${BASE_URL_API_V1}client/carts/";

  static const String S3_FILE_KEY = "${BASE_URL_API_V1}s3/get-signed-url";

  static const defaultAvatarImageUrl =
      'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/251940768/original/60fa660ce4c45a23dd122b7deb681a8052672843/a-nice-cartoon-avatar-from-your-real-photo-your-pet-or-any-character-or-animal.jpg';

  // static const String merchantCountryCode = 'USA';
  // static const String currencyCode = 'USD';
  static String currencySymbol = '';
  static const String perPage = 'items_per_page';
  static const String page = 'page_number';
  static String appName = 'Demo';

  // validation
  static const kTextValidatorEmailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const kTextValidatorPhoneNumberRegex =
      r'^\+?[0-9]{1,4}?[.\s]?(\([0-9]{1,3}?\))?[.\s]?[0-9]{1,4}[.\s]?[0-9]{1,4}[.\s]?[0-9]{1,9}$';

  // input border
  static const double hintColorBorderOpacity = .2;

  static const dummyData = 'dummy data';
}

enum AppLevels { basic, intermediate, advanced }

enum AppQuestionType { mcq, true_false }
