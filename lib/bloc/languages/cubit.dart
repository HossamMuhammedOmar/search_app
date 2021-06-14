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
      return 'المحافظه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Governorate';
    }
    return '';
  }

  String streetName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم الشارع أو أقرب نقطه داله';
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

//  Choose Categories
}
