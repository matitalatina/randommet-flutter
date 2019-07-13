import 'package:flutter/material.dart';
import 'package:randommet2/SwapAnimator.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/randomizers/oracle/OracleVM.dart';
import 'package:randommet2/widgets/ChooseScreen.dart';

import '../../main.dart';

class OraclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OracleVM oracleVM = getIt<OracleVM>();
    return SwapAnimator(
      onSwap: () => oracleVM.choose(Localizations.localeOf(context)),
      builder: (BuildContext context, Animation<double> animation, TickerProvider tickerProvider,
          VoidCallback startAnimation) {
        return StreamBuilder<OracleState>(
            stream: oracleVM.response$,
            builder: (BuildContext context, AsyncSnapshot<OracleState> snap) {
              if (!snap.hasData) {
                oracleVM.initialize(Localizations.localeOf(context));
                return Container();
              }
              return ChooseScreen(
                response: snap.data.response,
                onChangeResponse: startAnimation,
                animation: animation,
                backgroundColor: snap.data.color,
                title: AppL10n.of(context).oraclePageTitle,
                tickerProvider: tickerProvider,
              );
            });
      },
    );
  }
}
