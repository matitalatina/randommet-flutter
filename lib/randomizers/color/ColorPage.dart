import 'package:flutter/widgets.dart';
import 'package:randommet2/SwapAnimator.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/main.dart';
import 'package:randommet2/randomizers/color/ColorVM.dart';
import 'package:randommet2/widgets/ChooseScreen.dart';

class ColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorVM colorVM = getIt<ColorVM>();
    final l10n = AppL10n.of(context);
    return SwapAnimator(
      onSwap: () => colorVM.choose(Localizations.localeOf(context)),
      builder: (BuildContext context, Animation<double> animation, TickerProvider tickerProvider,
          VoidCallback startAnimation,) {
        return StreamBuilder<ColorState>(
            stream: colorVM.state$,
            builder: (BuildContext context, AsyncSnapshot<ColorState> snap) {
              if (!snap.hasData) {
                colorVM.initialize(Localizations.localeOf(context));
                return Container();
              }
              return ChooseScreen(
                response: snap.data.chosen.name,
                onChangeResponse: startAnimation,
                animation: animation,
                backgroundColor: snap.data.chosen.color,
                title: l10n.colorPageTitle,
                tickerProvider: tickerProvider,
              );
            });
      },
    );
  }
}
