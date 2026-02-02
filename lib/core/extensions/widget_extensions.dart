import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget onHero(String tag) => Hero(
    tag: tag,
    child: Material(type: MaterialType.transparency, child: this),
  );

  Widget get inScroll => SingleChildScrollView(physics: const BouncingScrollPhysics(), child: this);
  Widget inScrollF(ScrollPhysics physics) => SingleChildScrollView(physics: physics, child: this);
  Widget get inScrollH => SingleChildScrollView(scrollDirection: Axis.horizontal, child: this);

  Widget get inCustomScroll => CustomScrollView(slivers: [SliverFillRemaining(hasScrollBody: false, child: this)]);

  Widget get inCustomScrollH => CustomScrollView(
    slivers: [SliverFillRemaining(hasScrollBody: false, child: this)],
    scrollDirection: Axis.horizontal,
  );

  Widget withUnfocus(BuildContext context) => GestureDetector(
    onTap: () {
      final FocusScopeNode focus = FocusScope.of(context);
      if (!focus.hasPrimaryFocus && focus.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
        focus.unfocus();
      }
    },
    child: this,
  );

  Widget expand() => Expanded(child: this);

  Widget flexible() => Flexible(child: this);

  Widget safeArea() => SafeArea(child: this);
}
