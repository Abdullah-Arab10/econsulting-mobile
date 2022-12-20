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
        "alanTuring": MessageLookupByLibrary.simpleMessage("Alan Turing"),
        "civilEngineers":
            MessageLookupByLibrary.simpleMessage("Civil Engineers"),
        "consultantsList":
            MessageLookupByLibrary.simpleMessage("Consultants List"),
        "dentists": MessageLookupByLibrary.simpleMessage("Dentists"),
        "doctors": MessageLookupByLibrary.simpleMessage("Doctors"),
        "economics": MessageLookupByLibrary.simpleMessage("Economics"),
        "heroBorn": m0,
        "heroCount": m1,
        "itemTotal": m2,
        "lawyers": MessageLookupByLibrary.simpleMessage("Lawyers"),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Login successfully"),
        "settings": MessageLookupByLibrary.simpleMessage("settings"),
        "settingsScreen":
            MessageLookupByLibrary.simpleMessage("settings screen"),
        "softwareEngineers":
            MessageLookupByLibrary.simpleMessage("Software Engineers"),
        "therapists": MessageLookupByLibrary.simpleMessage("Therapists"),
        "title": MessageLookupByLibrary.simpleMessage("Hello"),
        "wozniakBio": m3
      };
}
