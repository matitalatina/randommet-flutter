import 'package:flutter/widgets.dart';
import 'package:randommet2/SwapAnimator.dart';
import 'package:randommet2/main.dart';
import 'package:randommet2/randomizers/color/ColorVM.dart';
import 'package:randommet2/widgets/ChooseScreen.dart';

class ColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorVM oracleVM = getIt<ColorVM>();
    return SwapAnimator(
      onSwap: () => oracleVM.choose(),
      builder: (BuildContext context, Animation<double> animation, TickerProvider tickerProvider,
          VoidCallback startAnimation,) {
        return StreamBuilder<ColorState>(
            stream: oracleVM.state$,
            initialData: ColorVM.initialState,
            builder: (BuildContext context, AsyncSnapshot<ColorState> snap) {
              return ChooseScreen(
                response: snap.data.chosen.name,
                onChangeResponse: startAnimation,
                animation: animation,
                backgroundColor: snap.data.chosen.color,
                title: 'Color',
                tickerProvider: tickerProvider,
              );
            });
      },
    );
  }
}
