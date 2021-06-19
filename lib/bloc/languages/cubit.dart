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
    }
    return '';
  }

  String onBoardingDescription1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'يوفر التطبيق إمكانيه البحث عن أي شئ تريده والوصول لأقرب بائع مع تفاصيل التواصل معه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'The app provides your with the ability to search for anything and find the nearest seller with all contact details';
    }
    return '';
  }

  String onBoardingDescription2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق يوفر عليك الوقت والجهد للعثور على الشي الذي تبحث عنه من خلال ادراج صوره او وصف للشي الذي تطلبه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'An app that saves your time & effort as it helps you to find any thing through uploading a photo or write a description';
    }
    return '';
  }

  String onBoardingDescription3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق يساهم في زياده مبيعاتك من خلال التسجيل كمقدم خدمه وانتظار الطلبات من الزبائن';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'An app that contributes to increasing your sales. You can register as a service provider and wait for the customers\' requests. The faster you reply, the more chance the customer will contact you';
    }
    return '';
  }

  String onBoardingTitle1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ابحث عن اي شئ!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Find anything!';
    }
    return '';
  }

  String onBoardingTitle2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'وفر وقتك وجهدك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Save your time & effort!';
    }
    return '';
  }

  String onBoardingTitle3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'زود مبيعاتك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Increase your sales!';
    }
    return '';
  }

  String skipText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تخطي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'SKIP';
    }
    return '';
  }

  String loginToYourAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الدخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login to your account';
    }
    return '';
  }

  String emailAddress() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'البريد الإلكتروني';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Email Address';
    }
    return '';
  }

  String password() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'كلمه المرور';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Password';
    }
    return '';
  }

  String login() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'دخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login';
    }
    return '';
  }

  String dontHaveAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ليس لديك حساب؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Don\'nt have an account?';
    }
    return '';
  }

  String createNew() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أنشئ حساب';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create new';
    }
    return '';
  }

  String withEmail() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالبريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With email';
    }
    return '';
  }

  String withPhone() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With phone';
    }
    return '';
  }

  String phoneNumber() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'رقم الهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Phone number';
    }
    return '';
  }

  String whoAreYou() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'من أنت؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Who are you?';
    }
    return '';
  }

  String whoAreYouDescription() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تريد إنشاء حساب جديد للبحث عن منتج أم تريد إنشاء حساب كمقدم خدمة؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Do you want to create a new account to search for a product, Or do you want to create an account as a service provider?';
    }
    return '';
  }

  String searchForProduct() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أبحث عن منتج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for a product';
    }
    return '';
  }

  String serviceProvider() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'مقدم خدمة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Service provider';
    }
    return '';
  }

  String register() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'REGISTER';
    }
    return '';
  }

  String createNewAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل حساب جديد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create your new account...';
    }
    return '';
  }

  String shopName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المحل';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Shop name';
    }
    return '';
  }

  String governorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Governorate';
    }
    return '';
  }

  String streetName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم الشارع أو أقرب نقطه دالة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Street name or nearest point';
    }
    return '';
  }

  String userName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المستخدم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'User name';
    }
    return '';
  }

  String haveAnAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لديك حساب بالفعل ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Have an account?';
    }
    return '';
  }

  String chooseCategories() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إختار القسم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose Categories';
    }
    return '';
  }

  String home() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home';
    }
    return '';
  }

  String changeLanguage() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تغيير اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Change Language';
    }
    return '';
  }

  String searchtracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search Tracking';
    }
    return '';
  }

  String complaintsAndsuggestions() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الشكاوي والإقتراحات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Complaints and suggestions';
    }
    return '';
  }

  String logout() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الخروج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Logout';
    }
    return '';
  }

  String searchForSomeThing() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تبحث عن شئ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for some thing?';
    }
    return '';
  }

  String chooseTheGovernorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the governorate';
    }
    return '';
  }

  String chooseTheSpecialtyYouWant() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار التخصص الذي تريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the specialty you want';
    }
    return '';
  }

  String continueT() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المتابعة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Continue';
    }
    return '';
  }

  String pleaseTryAgainLater() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرجاء إعادة المحاولة في وقت لاحق';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Please try again later!';
    }
    return '';
  }

  String noStoresInThisGovernorateInThisTime() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لا توجد متاجر متاحة في هذه المحافظة في الوقت الحالي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'No Stores in this governorate in this time';
    }
    return '';
  }

  String enterNameOrShortDescriptionForTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل اسمًا أو وصفًا مختصراً للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter a name or a short description for the item you are looking for';
    }
    return '';
  }

  String thisFeildIsRequired() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هذا الحقل إجباري';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'this feild is required';
    }
    return '';
  }

  String ifYouWantToAddPictureOfTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إذا كنت تريد إضافة صورة للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'If you want to add a picture of the item you are looking for';
    }
    return '';
  }

  String enterImageUrl() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل رابط الصورة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter image URL';
    }
    return '';
  }

  String or() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أو';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'OR';
    }
    return '';
  }

  String uploadImageFromYourDevice() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تحميل الصورة من جهازك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Upload image from your device';
    }
    return '';
  }

  String startSearch() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إبدأ البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Start Search';
    }
    return '';
  }

  String homeScreen() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الصفحة الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home Screen';
    }
    return '';
  }

  String languageSetting() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'اعدادات اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Language Setting';
    }
    return '';
  }

  String delete() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'حذف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Delete';
    }
    return '';
  }

  String show() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عرض';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Show';
    }
    return '';
  }

  String yourSearchProccess() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عمليات البحث الخاصة بك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Your Search Proccess';
    }
    return '';
  }

  String orderTracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة الطلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Order Tracking';
    }
    return '';
  }

//  Your Search Proccess
}
