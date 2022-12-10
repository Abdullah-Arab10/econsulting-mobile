import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import '../../business-logic/bloc/locale_cubit/locale_cubit.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.title),
      ),
      body: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
              if (state is ChangeLocaleState) {
                return ListTile(
                    leading: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LocaleCubit>(context)
                            .changeLanguage('en');
                      },
                      child: Text('ENGLISH'),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LocaleCubit>(context)
                            .changeLanguage('ar');
                      },
                      child: Text('Arabic'),
                    ));
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ]),
    );
  }
}
