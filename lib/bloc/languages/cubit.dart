import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/languages/states.dart';
import 'package:search_app/constant/constant.dart';
import 'package:search_app/helpers/shared_helper.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(InitLangState());

  static LanguagesCubit get(context) => BlocProvider.of(context);

  void changeToArabic() {
    SharedHelper.cacheData(key: LANGUAGES, value: 'AR');
    emit(LanguageArabicState());
  }

  void changeToEnglish() {
    SharedHelper.cacheData(key: LANGUAGES, value: 'EN');
    emit(LanguageEnglishState());
  }

  String homeScreenText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الصفحه الرئيسيه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home Screen';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingDescription1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'يوفر تطبيق ( وين موجود ) إمكانيه البحث عن أي شئ تريده والوصول لأقرب بائع مع تفاصيل التواصل معه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'The app provides your with the ability to search for anything and find the nearest seller with all contact details';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingDescription2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق ( وين موجود ) يوفر عليك الوقت والجهد للعثور على الشي الذي تبحث عنه من خلال ادراج صوره او وصف للشي الذي تطلبه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'An app that saves your time & effort as it helps you to find any thing through uploading a photo or write a description';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingDescription3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق ( وين موجود ) يساهم في زياده مبيعاتك من خلال التسجيل كمقدم خدمه وانتظار الطلبات من الزبائن، كلما كانت استجابتك للطلب اسرع زادت فرصة تواصل الزبون معك قبل غيرك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'An app that contributes to increasing your sales. You can register as a service provider and wait for the customers\' requests. The faster you reply, the more chance the customer will contact you';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingTitle1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ابحث عن اي شئ!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Find anything!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingTitle2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'وفر وقتك وجهدك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Save your time & effort!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onBoardingTitle3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'زود مبيعاتك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Increase your sales!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String skipText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تخطي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'SKIP';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String loginToYourAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الدخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login to your account';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String emailAddress() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'البريد الإلكتروني';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Email Address';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String password() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'كلمه المرور';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Password';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String login() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'دخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String dontHaveAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ليس لديك حساب؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Don\'nt have an account?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String createNew() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أنشئ حساب';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create new';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String withEmail() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالبريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With email';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String withPhone() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With phone';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String phoneNumber() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'رقم الهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Phone number';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String whoAreYou() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'من أنت؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Who are you?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String whoAreYouDescription() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تريد إنشاء حساب جديد للبحث عن منتج أم تريد إنشاء حساب كمقدم خدمة؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Do you want to create a new account to search for a product, Or do you want to create an account as a service provider?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String searchForProduct() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أبحث عن منتج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for a product';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String serviceProvider() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'مقدم خدمة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Service provider';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String register() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'REGISTER';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String createNewAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل حساب جديد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create your new account...';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String shopName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المحل أو المهنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Shop name Or career name';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String governorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Governorate';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String streetName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم الشارع أو أقرب نقطه دالة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Street name or nearest point';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String userName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المستخدم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'User name';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String haveAnAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لديك حساب بالفعل ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Have an account?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String chooseCategories() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إختار القسم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose Categories';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String home() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String changeLanguage() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تغيير اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Change Language';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String searchtracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search Tracking';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String complaintsAndsuggestions() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الشكاوي والإقتراحات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Complaints and suggestions';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String logout() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الخروج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Logout';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String searchForSomeThing() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تبحث عن شئ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for some thing?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String chooseTheGovernorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the governorate';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String chooseTheSpecialtyYouWant() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار التخصص الذي تريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the specialty you want';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String continueT() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المتابعة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Continue';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String pleaseTryAgainLater() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرجاء إعادة المحاولة في وقت لاحق';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Please try again later!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String noStoresInThisGovernorateInThisTime() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لا توجد متاجر متاحة في هذه المحافظة في الوقت الحالي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'No Stores in this governorate in this time';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String enterNameOrShortDescriptionForTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل اسمًا أو وصفًا مختصراً للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter a name or a short description for the item you are looking for';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String thisFeildIsRequired() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هذا الحقل إجباري';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'this feild is required';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String ifYouWantToAddPictureOfTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إذا كنت تريد إضافة صورة للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'If you want to add a picture of the item you are looking for';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String enterImageUrl() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل رابط الصورة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter image URL';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String or() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أو';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'OR';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String uploadImageFromYourDevice() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تحميل الصورة من جهازك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Upload image from your device';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String startSearch() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إبدأ البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Start Search';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String homeScreen() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الصفحة الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home Screen';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String languageSetting() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'اعدادات اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Language Setting';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String delete() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'حذف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Delete';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String show() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عرض';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Show';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String yourSearchProccess() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عمليات البحث الخاصة بك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Your Search Proccess';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String orderTracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة الطلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Order Tracking';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String welcome() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أهلاً بك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Welcome';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String followingNewOrdersNow() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إبدأ الآن بمتابعة الطلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Following New Orders Now';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String send() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إرسال';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Send';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String completeSendSuccess() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تم الإرسال بنجاح';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'sent succesfully';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String editProfile() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تعديل بياناتي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Edit profile';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String update() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تحديث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Update';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String report() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إضغط للإبلاغ';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Click to report';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String sendComplete() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تم الارسال بنجاح';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'sent succesfully';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String reachedTheMaximumSearchNumber() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لقد وصلت للحد الأقصي من عمليات البحث الرجاء حذف عمليات البحث القديمه لتتمكن من البحث مجدداً';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'You have reached the maximum number of searches, please delete your old searches to be able to search again';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String onlyFiveSearch() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لديك ١٠ عمليات بحث نشطه فقط، الرجاء حذف البحث بعد الوصول إلي المنتج المطلوب حتي تسطيع البحث مجدداً';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'You only have 10 active searches, please delete the search after you have found the product, To search again';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String searchingNow() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'يتم البحث الآن وفي حال توفر المنتج عند احدى المتاجر سيظهر زر التواصل معه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Searching... If the product is available at a store, a button will appear for you to contact the store!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String back() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'رجوع';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Back';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }

  String notification() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الإشعارات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Notification';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return '';
    }
    return '';
  }
}
