import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/SwapAnimator.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/main.dart';
import 'package:randommet2/randomizers/color/ColorRandomizer.dart';
import 'package:randommet2/randomizers/item/ItemVM.dart';
import 'package:randommet2/widgets/ChooseScreen.dart';

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ItemVM itemVM = getIt<ItemVM>();

    return SwapAnimator(
        onSwap: () => itemVM.choose(),
        builder: (
          BuildContext context,
          Animation<double> animation,
          TickerProvider tickerProvider,
          VoidCallback startAnimation,
        ) {
          return StreamBuilder<Item>(
            initialData: ItemVM.initialState.chosen,
            stream: itemVM.state.map((s) => s.chosen),
            builder: (context, snap) {
              return ChooseScreen(
                response: snap.data?.name ?? '',
                onChangeResponse: startAnimation,
                animation: animation,
                backgroundColor: ColorRandomizer.getColor(Localizations.localeOf(context)).color,
                title: AppL10n.of(context).choosePageTitle,
                tickerProvider: tickerProvider,
              );
            },
          );
        });
  }
}
