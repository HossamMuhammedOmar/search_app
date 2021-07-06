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

  void changeToKordy() {
    SharedHelper.cacheData(key: LANGUAGES, value: 'KR');
    emit(LanguageKordyState());
  }

  String homeScreenText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الصفحه الرئيسيه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home Screen';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'لا په‌ڕه‌ی سه‌ره‌كی';
    }
    return '';
  }

  String onBoardingDescription1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'يوفر تطبيق ( وين موجود ) إمكانيه البحث عن أي شئ تريده والوصول لأقرب بائع مع تفاصيل التواصل معه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'The (Where is it) application provides the ability to search for anything you want and reach the nearest seller with contact details with him';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'له‌ڕێگای ئه‌م به‌رنامه‌یه‌وه‌ ده‌توانی به‌دوای هه‌موو شتێك دا بگه‌ڕێی به‌ ئاره‌زووی خۆت,وه‌هه‌روه‌ها بگه‌یت به‌ نزیكرتین فرۆشیار له‌گه‌ڵ زانیاری فرۆشیار';
    }
    return '';
  }

  String onBoardingDescription2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق ( وين موجود ) يوفر عليك الوقت والجهد للعثور على الشي الذي تبحث عنه من خلال ادراج صوره او وصف للشي الذي تطلبه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'The (Where is it) application saves you time and effort to find the thing you are looking for by inserting a picture or description of the thing you require';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئه‌م به‌رنامه‌یه‌ كات و ماندووبوونت بۆ ده‌گه‌ڕێنێته‌وه‌ له‌ هه‌ر كااڵیه‌ك به‌دوای بگه‌ڕێیت به‌هۆی دانانی وێنه‌ یان وه‌سفكردنی ئه‌و شته‌ی داوای ده‌كه‌ی';
    }
    return '';
  }

  String onBoardingDescription3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تطبيق ( وين موجود ) يساهم في زياده مبيعاتك من خلال التسجيل كمقدم خدمه وانتظار الطلبات من الزبائن، كلما كانت استجابتك للطلب اسرع زادت فرصة تواصل الزبون معك قبل غيرك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'The application contributes to increasing your sales by registering as a service provider and waiting for requests from customers, The faster you respond to the request, the more chance the customer will contact you before anyone else';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئه‌م به‌رنامه‌یه‌ یارمه‌تی زیادكردنی فرۆشتنت ده‌دات به‌ڕێگای به‌ژداریكردن وه‌ك پێشكه‌شكاری خزمه‌تگوزاری وه‌ چاوه‌ڕێكردنی داواكاری له‌ كڕیار';
    }
    return '';
  }

  String onBoardingTitle1() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ابحث عن اي شئ!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Find anything!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گه‌ڕان';
    }
    return '';
  }

  String onBoardingTitle2() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'وفر وقتك وجهدك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Save your time & effort!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گه‌ڕاندنه‌وه‌ی كات و ماندووبوون';
    }
    return '';
  }

  String onBoardingTitle3() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'زود مبيعاتك!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Increase your sales!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'فرۆشتنت زیاد بكه‌';
    }
    return '';
  }

  String skipText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تخطي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'SKIP';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'لابردن';
    }
    return '';
  }

  String loginToYourAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الدخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login to your account';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'چوونه‌ژووره‌وه‌ی هه‌ژماره‌كه‌ت';
    }
    return '';
  }

  String emailAddress() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'البريد الإلكتروني';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Email Address';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئیمه‌یڵ';
    }
    return '';
  }

  String password() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'كلمه المرور';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Password';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return ' ژماره‌ی نهێی';
    }
    return '';
  }

  String login() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'دخول';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Login';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'چوونه‌ ژووره‌وه‌';
    }
    return '';
  }

  String dontHaveAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'ليس لديك حساب؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Don\'nt have an account?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هه‌ژمارت نییه‌؟';
    }
    return '';
  }

  String createNew() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أنشئ حساب';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create new';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هه‌ژمار دروست بكه‌';
    }
    return '';
  }

  String withEmail() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالبريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With email';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'له‌ڕێگای ئیمه‌یڵ';
    }
    return '';
  }

  String withPhone() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'بالهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'With phone';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'له‌ڕێگای ته‌له‌فۆن';
    }
    return '';
  }

  String phoneNumber() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'رقم الهاتف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Phone number';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ژماره‌ی ته‌له‌فۆن';
    }
    return '';
  }

  String whoAreYou() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'من أنت؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Who are you?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'تۆ كێیت؟';
    }
    return '';
  }

  String whoAreYouDescription() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تريد إنشاء حساب جديد للبحث عن منتج أم تريد إنشاء حساب كمقدم خدمة؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Do you want to create a new account to search for a product, Or do you want to create an account as a service provider?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ده‌ته‌وێت هه‌ژمارێكی نوێ دروستبكه‌یت بۆ گه‌ڕان یاخود وه‌ك پێشكه‌شكاری خزمه‌تگوزاری؟';
    }
    return '';
  }

  String searchForProduct() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أبحث عن منتج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for a product';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌دوای كااڵیه‌ك دا بگه‌ڕێ';
    }
    return '';
  }

  String serviceProvider() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'مقدم خدمة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Service provider';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'پێشكه‌ش كاری خزمه‌تگوزاری';
    }
    return '';
  }

  String register() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'REGISTER';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌ژداریكردن';
    }
    return '';
  }

  String createNewAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل حساب جديد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Create your new account...';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دروستكردنی هه‌ژماری نوێ';
    }
    return '';
  }

  String shopName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المحل أو المهنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Shop name Or career name';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناوی شوێن-یان پیشه‌';
    }
    return '';
  }

  String governorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Governorate';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'پارێزگا';
    }
    return '';
  }

  String streetName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم الشارع أو أقرب نقطه دالة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Street name or nearest point';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناوی شه‌قام - یان نزیكرتین شوێن لێی';
    }
    return '';
  }

  String userName() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إسم المستخدم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'User name';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناوی به‌كارهێنه‌ر';
    }
    return '';
  }

  String haveAnAccount() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لديك حساب بالفعل ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Have an account?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هه‌ژمارت هه‌یه‌؟';
    }
    return '';
  }

  String chooseCategories() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إختار القسم';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose Categories';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌شێك هه‌ڵبژێره‌';
    }
    return '';
  }

  String home() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'سه‌ره‌كی';
    }
    return '';
  }

  String changeLanguage() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تغيير اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Change Language';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گۆڕیین زمان';
    }
    return '';
  }

  String searchtracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search Tracking';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌رده‌وام بوون له‌ گه‌ڕان';
    }
    return '';
  }

  String complaintsAndsuggestions() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الشكاوي والإقتراحات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Complaints and suggestions';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'سه‌رنج و پێشنیار';
    }
    return '';
  }

  String logout() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تسجيل الخروج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Logout';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'چوونه‌ ده‌ره‌وه‌';
    }
    return '';
  }

  String searchForSomeThing() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هل تبحث عن شئ؟';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Search for some thing?';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌دوای شتێك داده‌گه‌ڕێی؟';
    }
    return '';
  }

  String chooseTheGovernorate() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار المحافظة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the governorate';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'پارێزگاهه‌ڵبژێره‌';
    }
    return '';
  }

  String chooseTheSpecialtyYouWant() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'قم بإختيار التخصص الذي تريد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Choose the specialty you want';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'پسپۆڕی هه‌ڵبژێره‌';
    }
    return '';
  }

  String continueT() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'المتابعة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Continue';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌رده‌وام بوون';
    }
    return '';
  }

  String pleaseTryAgainLater() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الرجاء إعادة المحاولة في وقت لاحق';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Please try again later!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'تكایه‌ كاتێكی تر هه‌وڵبده‌وه‌';
    }
    return '';
  }

  String noStoresInThisGovernorateInThisTime() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لا توجد متاجر متاحة في هذه المحافظة في الوقت الحالي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'No Stores in this governorate in this time';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هیچ فرۆشیارێك له‌م پارێزگایه‌ به‌رده‌ست نییه‌ له‌كاتی ئێستادا';
    }
    return '';
  }

  String enterNameOrShortDescriptionForTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل اسمًا أو وصفًا مختصراً للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter a name or a short description for the item you are looking for';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناوێك یان وه‌سفێكی كورت بنوسه‌ بۆ ئه‌و كااڵیه‌ی به‌دوای ده‌گه‌ڕێی';
    }
    return '';
  }

  String thisFeildIsRequired() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هذا الحقل إجباري';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'this feild is required';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئه‌م به‌شه‌ داواكراوه‌';
    }
    return '';
  }

  String ifYouWantToAddPictureOfTheItemYouAreLookingFor() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إذا كنت تريد إضافة صورة للمنتج الذي تبحث عنه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'If you want to add a picture of the item you are looking for';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'وێنه‌ی ئه‌و كااڵیه‌ی به‌دوای دا ده‌گه‌رێیت';
    }
    return '';
  }

  String enterImageUrl() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أدخل رابط الصورة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Enter image URL';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دانانی لینكی وێنه‌كه‌';
    }
    return '';
  }

  String or() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أو';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'OR';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'یان';
    }
    return '';
  }

  String uploadImageFromYourDevice() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تحميل الصورة من جهازك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Upload image from your device';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دانانی وێنه‌كه‌ له‌ رێگای مۆبایله‌كه‌ته‌وه‌';
    }
    return '';
  }

  String startSearch() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إبدأ البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Start Search';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ده‌ست به‌ گه‌ڕان بكه‌';
    }
    return '';
  }

  String homeScreen() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الصفحة الرئيسية';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Home Screen';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'لا په‌ڕه‌ی سه‌ره‌كی';
    }
    return '';
  }

  String languageSetting() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'اعدادات اللغة';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Language Setting';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هه‌ڵبژاردنی زمان';
    }
    return '';
  }

  String delete() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'حذف';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Delete';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'سڕینه‌وه‌';
    }
    return '';
  }

  String show() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عرض';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Show';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'پیشان دان';
    }
    return '';
  }

  String yourSearchProccess() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'عمليات البحث الخاصة بك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Your Search Proccess';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گه‌ڕانه‌كانی تایبه‌ت به‌خۆت';
    }
    return '';
  }

  String orderTracking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متابعة الطلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Order Tracking';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌دواداچوونی داواكاری';
    }
    return '';
  }

  String welcome() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'أهلاً بك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Welcome';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'به‌خێربێیت';
    }
    return '';
  }

  String followingNewOrdersNow() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إبدأ الآن بمتابعة الطلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Following New Orders Now';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ده‌ست بكه‌ به‌ به‌دواداچوونی داواكاری';
    }
    return '';
  }

  String send() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إرسال';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Send';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناردن';
    }
    return '';
  }

  String completeSendSuccess() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تم الإرسال بنجاح';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'sent succesfully';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'بەسەرکەوتووی نێردا';
    }
    return '';
  }

  String editProfile() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تعديل بياناتي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Edit profile';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دەستکارى کردنى زانیارییەکانم';
    }
    return '';
  }

  String update() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تحديث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Update';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'نوێکردنەوە';
    }
    return '';
  }

  String report() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'إضغط للإبلاغ';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Click to report';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دابگرە بۆ ڕیپۆرت کردن';
    }
    return '';
  }

  String sendComplete() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تم الارسال بنجاح';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'sent succesfully';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'بەسەرکەوتووی نێردا';
    }
    return '';
  }

  String reachedTheMaximumSearchNumber() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لقد وصلت للحد الأقصي من عمليات البحث الرجاء حذف عمليات البحث القديمه لتتمكن من البحث مجدداً';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'You have reached the maximum number of searches, please delete your old searches to be able to search again';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ناتوانى چیتر گەڕان بکەیت تکایە هەندێك لە گەڕانەکانى پێشووت بسڕەوە تاوەکو بتوانى دووباره گەڕان بکەیت';
    }
    return '';
  }

  String onlyFiveSearch() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لديك ١٠ عمليات بحث نشطه فقط، الرجاء حذف البحث بعد الوصول إلي المنتج المطلوب حتي تسطيع البحث مجدداً';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'You only have 10 active searches..Please delete the search after you have founded the product so you can search again';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ته‌نیا 0ـتر گه‌ڕانی كارات هه‌یه‌,تكایه‌ له‌كاتی دۆزینه‌وه‌ی داواكارییه‌كه‌ت گه‌ڕانه‌كه‌ت بسڕه‌وه‌ تاوه‌كو دووباره‌ بتوانی گه‌ڕان بكه‌ی';
    }
    return '';
  }

  String searchingNow() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'يتم البحث الآن وفي حال توفر المنتج عند احدى المتاجر سيظهر زر التواصل معه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Searching... If the product is available at a store, a button will appear for you to contact the store!';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گه‌ڕانه‌كه‌ ئێستا ته‌واو ده‌بێت له‌كاتی دۆزینه‌وه‌ی كااڵكه‌ له‌ یه‌كێك له‌ فرۆشگاكان,به‌شێك به‌ناوی په‌یوه‌ندی بكه‌ به‌رده‌ست ده‌بێت';
    }
    return '';
  }

  String back() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'رجوع';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Back';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'گەڕانەوە';
    }
    return '';
  }

  String notification() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'الإشعارات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Notification';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئاگادارکەرەوەکان';
    }
    return '';
  }

  String available() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'متوفر';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Available';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'بەردەستە';
    }
    return '';
  }

  String notAvailable() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'غير متوفر';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Not available';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'بەردەست نییە';
    }
    return '';
  }

  String searching() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'جاري البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Searching';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'لەگەڕاندایە';
    }
    return '';
  }

  String contactNow() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تواصل الآن';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Contact now';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئێستا پەیوەندی بکە';
    }
    return '';
  }

  String haveBeenFound() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'تم العثور علي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Have been found';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'دۆزرایهوە';
    }
    return '';
  }

  String inT() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'في';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'In';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'له';
    }
    return '';
  }

  String theseStoresThat() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هذه المتاجر التي تم العثور عليها في محافظتك، جاري البحث الآن عن المنتج وسيتم إرسال إشعار لك في حال توفر المنتج في إحدى المتاجر، يمكنك الآن متابعه البحث عن طريق قسم (متابعه البحث)';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'These stores that were found in your governorate, the product is being searched now and a notification will be sent to you if the product is available in one of the stores, you can now continue the search through the (Search Tracking) section';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئه‌م فرۆشگایانه‌ به‌رده‌سته‌ له‌ پارێزگاكه‌ت,ئێستا ده‌ست به‌ به‌دواداچوون ده‌كه‌ین بۆ كااڵكه‌ت,ئه‌گه‌ر له‌ فرۆشگایه‌ك به‌رده‌ست بوو ئاگادارت ده‌كه‌ینه‌وه‌, ئێستا ده‌توانی به‌رده‌وام بی له‌ گه‌ڕان له‌ به‌شی (به‌رده‌وام بوون له‌ گه‌ڕان)';
    }
    return '';
  }

  String researchResults() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'نتائج البحث';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Research results';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'ئهنجامی گهڕانهکان';
    }
    return '';
  }

  String thereIsSomeoneLooking() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'هناك شخص يبحث عن هذا المنتج في محافظتك';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'There is someone looking for this product in your province';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'کهسچک بهدوای ئهم کاپیه دەگهڕچت له پارچزگاکهت';
    }
    return '';
  }

  String noRequests() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'لا يوجد طلبات';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'No requests';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'هیچ داواکاریهک نییه';
    }
    return '';
  }

  String addANewRequest() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'AR') {
      return 'اضف طلب جديد';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'EN') {
      return 'Add a new request';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'KR') {
      return 'داواکاری نوێ زیادبکه';
    }
    return '';
  }
}
