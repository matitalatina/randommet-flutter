import 'package:flutter/material.dart';
import 'package:randommet2/SwapAnimator.dart';
import 'package:randommet2/widgets/ChooseScreen.dart';
import 'package:randommet2/randomizers/oracle/OracleVM.dart';

import '../../main.dart';

class OraclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OracleVM oracleVM = getIt<OracleVM>();
    return SwapAnimator(
      onSwap: () => oracleVM.choose(),
      builder: (BuildContext context, Animation<double> animation, TickerProvider tickerProvider,
          VoidCallback startAnimation) {
        return StreamBuilder<OracleState>(
            stream: oracleVM.response$,
            initialData: OracleVM.initialState,
            builder: (BuildContext context, AsyncSnapshot<OracleState> snap) {
              return ChooseScreen(
                response: snap.data.response,
                onChangeResponse: startAnimation,
                animation: animation,
                backgroundColor: snap.data.color,
                title: 'Oracle',
                tickerProvider: tickerProvider,
              );
            });
      },
    );
  }
}
