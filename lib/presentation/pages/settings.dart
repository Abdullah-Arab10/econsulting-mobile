import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import '../../business-logic/bloc/cubit/locale_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsScreen),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {
                Navigator.of(context).pop();
              },
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocaleCubit>().changeLanguage(newValue);
                    }
                  },
                );
              },
            )),
      ),
    );
  }
}
// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var t = S.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(t.title),
//       ),
//       body: Row(children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: BlocBuilder<LocaleCubit, LocaleState>(
//             builder: (context, state) {
//               if (state is ChangeLocaleState) {
//                 return ListTile(
//                     leading: ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<LocaleCubit>(context)
//                             .changeLanguage('en');
//                       },
//                       child: Text('ENGLISH'),
//                     ),
//                     trailing: ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<LocaleCubit>(context)
//                             .changeLanguage('ar');
//                       },
//                       child: Text('Arabic'),
//                     ));
//               } else {
//                 return SizedBox();
//               }
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }
