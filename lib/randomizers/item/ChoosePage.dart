import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/SwapAnimator.dart';
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
                backgroundColor: ColorRandomizer.getColor().color,
                title: 'Chosen item',
                tickerProvider: tickerProvider,
              );
            },
          );
        });
  }
}
