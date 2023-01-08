// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(date) => "Born ${date}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No heroes yet', one: '1 hero', other: '${count} heroes')}";

  static String m2(value) => "Your total is: ${value}";

  static String m3(appleOne, appleTwo) =>
      "Developed the ${appleOne} & ${appleTwo} microcomputers.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "alanTuring": MessageLookupByLibrary.simpleMessage("Alan Turing"),
        "applicationLanguage":
            MessageLookupByLibrary.simpleMessage("Application Language"),
        "appointmentCalendar":
            MessageLookupByLibrary.simpleMessage("Appointment Calendar"),
        "appointmentCost":
            MessageLookupByLibrary.simpleMessage("Appointment Cost"),
        "appointmentCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Appointment booked successfully"),
        "appointmentStart":
            MessageLookupByLibrary.simpleMessage("Appointment Start"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "bio": MessageLookupByLibrary.simpleMessage("Bio"),
        "book": MessageLookupByLibrary.simpleMessage("BOOK"),
        "calendar": MessageLookupByLibrary.simpleMessage("Calendar"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "civilEngineers":
            MessageLookupByLibrary.simpleMessage("Civil Engineers"),
        "consultant": MessageLookupByLibrary.simpleMessage("consultant"),
        "consultantNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Consultant is not available!"),
        "consultantNotFound":
            MessageLookupByLibrary.simpleMessage("Consultant is not found!"),
        "consultantsList":
            MessageLookupByLibrary.simpleMessage("Consultants List"),
        "consultationType":
            MessageLookupByLibrary.simpleMessage("Consultation Type"),
        "date": MessageLookupByLibrary.simpleMessage("date"),
        "dateRequired":
            MessageLookupByLibrary.simpleMessage("Date must not be empty"),
        "dentists": MessageLookupByLibrary.simpleMessage("Dentists"),
        "doctors": MessageLookupByLibrary.simpleMessage("Doctors"),
        "economics": MessageLookupByLibrary.simpleMessage("Economics"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "emailFormat":
            MessageLookupByLibrary.simpleMessage("invalid email format"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "heroBorn": m0,
        "heroCount": m1,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homePage": MessageLookupByLibrary.simpleMessage("Home Page"),
        "itemTotal": m2,
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "lawyers": MessageLookupByLibrary.simpleMessage("Lawyers"),
        "login": MessageLookupByLibrary.simpleMessage("LOGIN"),
        "loginError":
            MessageLookupByLibrary.simpleMessage("invalid email or password"),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login successfully"),
        "logout": MessageLookupByLibrary.simpleMessage("LOGOUT"),
        "logoutSuccess":
            MessageLookupByLibrary.simpleMessage("logout successfully"),
        "min": MessageLookupByLibrary.simpleMessage("min length is 3"),
        "moneyAmount": MessageLookupByLibrary.simpleMessage("Money Amount"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMin": MessageLookupByLibrary.simpleMessage("min length is 6"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileDetails":
            MessageLookupByLibrary.simpleMessage("Profile Details"),
        "register": MessageLookupByLibrary.simpleMessage("REGISTER"),
        "registerAs": MessageLookupByLibrary.simpleMessage("Register as"),
        "registerAsu": MessageLookupByLibrary.simpleMessage("Register as"),
        "registerNow": MessageLookupByLibrary.simpleMessage("Register Now"),
        "requiredEmail":
            MessageLookupByLibrary.simpleMessage("email must not be empty"),
        "requiredMoney":
            MessageLookupByLibrary.simpleMessage("Money must not be empty"),
        "requiredPassword":
            MessageLookupByLibrary.simpleMessage("password must not be empty"),
        "review": MessageLookupByLibrary.simpleMessage("Review"),
        "search": MessageLookupByLibrary.simpleMessage("Search a consultant"),
        "searchPage": MessageLookupByLibrary.simpleMessage("Search Page"),
        "searchRequired":
            MessageLookupByLibrary.simpleMessage("Search must not be empty"),
        "selectConsultation":
            MessageLookupByLibrary.simpleMessage("Select any consultation"),
        "sendRating": MessageLookupByLibrary.simpleMessage("send rating"),
        "settings": MessageLookupByLibrary.simpleMessage("settings"),
        "settingsScreen":
            MessageLookupByLibrary.simpleMessage("settings screen"),
        "shiftEnd": MessageLookupByLibrary.simpleMessage("Shift End"),
        "shiftStart": MessageLookupByLibrary.simpleMessage("Shift Start"),
        "softwareEngineers":
            MessageLookupByLibrary.simpleMessage("Software Engineers"),
        "therapists": MessageLookupByLibrary.simpleMessage("Therapists"),
        "timeRequired":
            MessageLookupByLibrary.simpleMessage("Time must not be empty"),
        "title": MessageLookupByLibrary.simpleMessage("Hello"),
        "transfer": MessageLookupByLibrary.simpleMessage("TRANSFER"),
        "user": MessageLookupByLibrary.simpleMessage("user"),
        "userNotFound":
            MessageLookupByLibrary.simpleMessage("User is not found!"),
        "wozniakBio": m3,
        "youHaveAnotherAppointmentError": MessageLookupByLibrary.simpleMessage(
            "Sorry,you have another appointment in same time"),
        "youHaveNoEnoughCashError": MessageLookupByLibrary.simpleMessage(
            "Sorry,you don\'t have enough cash")
      };
}
