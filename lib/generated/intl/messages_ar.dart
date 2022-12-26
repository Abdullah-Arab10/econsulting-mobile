// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(date) => "تاريخ الميلاد ${date}";

  static String m1(count) =>
      "{count,plural, =0{لا توجد أبطال بعد} =1{بطل ${count}} =2{بطلان} few{${count} أبطال} many{${count} بطل} other{${count} بطل}";

  static String m2(value) => "إجمالي: ${value}";

  static String m3(appleOne, appleTwo) =>
      "طور جهازي كمبيوتر ${appleOne} و ${appleTwo}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "address": MessageLookupByLibrary.simpleMessage("العنوان"),
        "alanTuring": MessageLookupByLibrary.simpleMessage("ألان تورينغ"),
        "appointmentCalendar":
            MessageLookupByLibrary.simpleMessage("روزنامة المواعيد"),
        "appointmentStart": MessageLookupByLibrary.simpleMessage("وقت الموعد"),
        "bio": MessageLookupByLibrary.simpleMessage("الوصف"),
        "book": MessageLookupByLibrary.simpleMessage("احجز"),
        "categories": MessageLookupByLibrary.simpleMessage("التصنيفات"),
        "civilEngineers":
            MessageLookupByLibrary.simpleMessage("المهندسين المدنيون"),
        "consultant": MessageLookupByLibrary.simpleMessage("كخبير"),
        "consultantsList":
            MessageLookupByLibrary.simpleMessage("قائمة الاستشاريين"),
        "date": MessageLookupByLibrary.simpleMessage("التاريخ"),
        "dentists": MessageLookupByLibrary.simpleMessage("أطباء الأسنان"),
        "doctors": MessageLookupByLibrary.simpleMessage("الأطباء"),
        "economics": MessageLookupByLibrary.simpleMessage("الاقتصاديون"),
        "emailAddress":
            MessageLookupByLibrary.simpleMessage("عنوان البريد الالكتروني"),
        "emailFormat":
            MessageLookupByLibrary.simpleMessage("شكل ايميل غير صالح"),
        "favorite": MessageLookupByLibrary.simpleMessage("المفضلة"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الاول"),
        "heroBorn": m0,
        "heroCount": m1,
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "homePage": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "itemTotal": m2,
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الثاني"),
        "lawyers": MessageLookupByLibrary.simpleMessage("المحامون"),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "الايميل او كلمة السر غير صالحين"),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("تم تسحيل الدخول بنجاح"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "logoutSuccess":
            MessageLookupByLibrary.simpleMessage("تم تسجيل الخروج بنجاح"),
        "min": MessageLookupByLibrary.simpleMessage("ادخل من 3 او اكثر"),
        "moneyAmount": MessageLookupByLibrary.simpleMessage("المبلغ"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordMin":
            MessageLookupByLibrary.simpleMessage("ادخل كلمة السر من 6 او اكثر"),
        "phone": MessageLookupByLibrary.simpleMessage("الرقم"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "profileDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل الملف الشخصي"),
        "register": MessageLookupByLibrary.simpleMessage("سجل"),
        "registerAs": MessageLookupByLibrary.simpleMessage("سجل"),
        "registerAsu": MessageLookupByLibrary.simpleMessage("سجل"),
        "registerNow": MessageLookupByLibrary.simpleMessage("سجل الآن"),
        "requiredEmail": MessageLookupByLibrary.simpleMessage("الايميل فارغ"),
        "requiredPassword":
            MessageLookupByLibrary.simpleMessage("يرجى ادخال كلمة السر"),
        "search": MessageLookupByLibrary.simpleMessage("ابحث عن خبير"),
        "selectConsultation":
            MessageLookupByLibrary.simpleMessage("اختر اي خبرة"),
        "settings": MessageLookupByLibrary.simpleMessage("الاعدادات"),
        "settingsScreen":
            MessageLookupByLibrary.simpleMessage("شاشة الاعدادات"),
        "shiftEnd": MessageLookupByLibrary.simpleMessage("انتهاء عند"),
        "shiftStart": MessageLookupByLibrary.simpleMessage("ابتداء من"),
        "softwareEngineers":
            MessageLookupByLibrary.simpleMessage("مهندسين البرمجيات"),
        "therapists": MessageLookupByLibrary.simpleMessage("الأطباء النفسيون"),
        "title": MessageLookupByLibrary.simpleMessage("مرحبا"),
        "transfer": MessageLookupByLibrary.simpleMessage("تحويل"),
        "user": MessageLookupByLibrary.simpleMessage("كمستخدم"),
        "wozniakBio": m3
      };
}
