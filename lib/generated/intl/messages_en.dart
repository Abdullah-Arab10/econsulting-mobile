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
        "addCash": MessageLookupByLibrary.simpleMessage("cash has been added"),
        "addVacationInYourWorkShifts": MessageLookupByLibrary.simpleMessage(
            "Please add vacation in your work shifts"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "alanTuring": MessageLookupByLibrary.simpleMessage("Alan Turing"),
        "applicationLanguage":
            MessageLookupByLibrary.simpleMessage("Application Language"),
        "appointment": MessageLookupByLibrary.simpleMessage("Appointment :"),
        "appointmentCalendar":
            MessageLookupByLibrary.simpleMessage("Appointment Calendar"),
        "appointmentCost":
            MessageLookupByLibrary.simpleMessage("Appointment Cost"),
        "appointmentCostRequired": MessageLookupByLibrary.simpleMessage(
            "Appointment cost must not be empty"),
        "appointmentCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Appointment booked successfully"),
        "appointmentStart":
            MessageLookupByLibrary.simpleMessage("Appointment Start"),
        "appointments": MessageLookupByLibrary.simpleMessage("Appointments"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "bio": MessageLookupByLibrary.simpleMessage("Bio"),
        "book": MessageLookupByLibrary.simpleMessage("BOOK"),
        "calendar": MessageLookupByLibrary.simpleMessage("Calendar"),
        "cashMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
            "Cash must be greater than zero!"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "civilEngineer": MessageLookupByLibrary.simpleMessage("Civil Engineer"),
        "civilEngineers":
            MessageLookupByLibrary.simpleMessage("Civil Engineers"),
        "consultant": MessageLookupByLibrary.simpleMessage("Consultant"),
        "consultantNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Consultant is not available!"),
        "consultantNotFound":
            MessageLookupByLibrary.simpleMessage("Consultant is not found!"),
        "consultantsList":
            MessageLookupByLibrary.simpleMessage("Consultants List"),
        "consultationRequired": MessageLookupByLibrary.simpleMessage(
            "consultation must not be empty"),
        "consultationType":
            MessageLookupByLibrary.simpleMessage("Consultation Type"),
        "date": MessageLookupByLibrary.simpleMessage("date"),
        "dateRequired":
            MessageLookupByLibrary.simpleMessage("Date must not be empty"),
        "dentist": MessageLookupByLibrary.simpleMessage("Dentist"),
        "dentists": MessageLookupByLibrary.simpleMessage("Dentists"),
        "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
        "doctors": MessageLookupByLibrary.simpleMessage("Doctors"),
        "economic": MessageLookupByLibrary.simpleMessage("Economic"),
        "economics": MessageLookupByLibrary.simpleMessage("Economics"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "emailFormat":
            MessageLookupByLibrary.simpleMessage("invalid email format"),
        "emailOrPasswordError":
            MessageLookupByLibrary.simpleMessage("invalid email or password"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "firstNameRequired": MessageLookupByLibrary.simpleMessage(
            "first name must not be empty"),
        "heroBorn": m0,
        "heroCount": m1,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homePage": MessageLookupByLibrary.simpleMessage("Home Page"),
        "itemTotal": m2,
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "lastNameRequired":
            MessageLookupByLibrary.simpleMessage("last name must not be empty"),
        "lawyer": MessageLookupByLibrary.simpleMessage("Lawyer"),
        "lawyers": MessageLookupByLibrary.simpleMessage("Lawyers"),
        "listIsEmpty":
            MessageLookupByLibrary.simpleMessage("The List Is Empty"),
        "listOfCivilEngineers":
            MessageLookupByLibrary.simpleMessage("List of Civil Engineers"),
        "listOfDentists":
            MessageLookupByLibrary.simpleMessage("List of Dentists"),
        "listOfDoctors":
            MessageLookupByLibrary.simpleMessage("List of Doctors"),
        "listOfEconomics":
            MessageLookupByLibrary.simpleMessage("List of Economics"),
        "listOfLawyers":
            MessageLookupByLibrary.simpleMessage("List of Lawyers"),
        "listOfSoftwareEngineers":
            MessageLookupByLibrary.simpleMessage("List of Software Engineers"),
        "listOfTherapists":
            MessageLookupByLibrary.simpleMessage("List of Therapists"),
        "login": MessageLookupByLibrary.simpleMessage("LOGIN"),
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
        "phoneRequired":
            MessageLookupByLibrary.simpleMessage("phone must not be empty"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileDetails":
            MessageLookupByLibrary.simpleMessage("Profile Details"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "ratingSuccessfully":
            MessageLookupByLibrary.simpleMessage("Rating Successfully"),
        "register": MessageLookupByLibrary.simpleMessage("REGISTER"),
        "registerAs": MessageLookupByLibrary.simpleMessage("Register as"),
        "registerNow": MessageLookupByLibrary.simpleMessage("Register Now"),
        "registerSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Account created successfully"),
        "repeat": MessageLookupByLibrary.simpleMessage("Number os iteration"),
        "repeatRequired":
            MessageLookupByLibrary.simpleMessage("Invalid Format!"),
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
        "shiftEndRequired":
            MessageLookupByLibrary.simpleMessage("shift end must not be empty"),
        "shiftStart": MessageLookupByLibrary.simpleMessage("Shift Start"),
        "shiftStartRequired": MessageLookupByLibrary.simpleMessage(
            "shift start must not be empty"),
        "softwareEngineer":
            MessageLookupByLibrary.simpleMessage("Software Engineer"),
        "softwareEngineers":
            MessageLookupByLibrary.simpleMessage("Software Engineers"),
        "takeVacation": MessageLookupByLibrary.simpleMessage("Take vacation"),
        "therapist": MessageLookupByLibrary.simpleMessage("Therapist"),
        "therapists": MessageLookupByLibrary.simpleMessage("Therapists"),
        "timeRequired":
            MessageLookupByLibrary.simpleMessage("Time must not be empty"),
        "title": MessageLookupByLibrary.simpleMessage("Hello"),
        "transfer": MessageLookupByLibrary.simpleMessage("TRANSFER"),
        "upcomingAppointments": MessageLookupByLibrary.simpleMessage(
            "Sorry , you have upcoming appointments!"),
        "upcomingVacationInTheSameTime": MessageLookupByLibrary.simpleMessage(
            "Sorry , you have upcoming vacation in the same time!"),
        "user": MessageLookupByLibrary.simpleMessage("User"),
        "userNotFound":
            MessageLookupByLibrary.simpleMessage("User is not found!"),
        "vacation": MessageLookupByLibrary.simpleMessage("Vacation :"),
        "vacationCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Vacation created successfully"),
        "vacationEnd": MessageLookupByLibrary.simpleMessage("Vacation End"),
        "vacationEndRequired": MessageLookupByLibrary.simpleMessage(
            "Vacation end must not be empty"),
        "vacationStart": MessageLookupByLibrary.simpleMessage("Vacation Start"),
        "vacationStartRequired": MessageLookupByLibrary.simpleMessage(
            "Vacation start must not be empty"),
        "vacationsAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Vacations added successfully"),
        "wozniakBio": m3,
        "youHaveAnotherAppointmentError": MessageLookupByLibrary.simpleMessage(
            "Sorry,you have another appointment in same time"),
        "youHaveNoEnoughCashError": MessageLookupByLibrary.simpleMessage(
            "Sorry,you don\'t have enough cash")
      };
}
