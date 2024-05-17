// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'flexible_bottom_sheet.dart';

const Duration _bottomSheetDuration = Duration(milliseconds: 500);

Future<T?> showFlexibleBottomSheet<T>({
  required BuildContext context,
  required FlexibleDraggableScrollableWidgetBuilder builder,
  DraggableScrollableController? draggableScrollableController,
  double? minHeight,
  double? initHeight,
  double? maxHeight,
  bool isCollapsible = true,
  bool isDismissible = true,
  bool isExpand = true,
  bool useRootNavigator = false,
  bool isModal = true,
  List<double>? anchors,
  Color? keyboardBarrierColor,
  Color? bottomSheetColor,
  BorderRadiusGeometry? bottomSheetBorderRadius,
  Color? barrierColor,
  Duration? duration,
  bool isSafeArea = false,
  BoxDecoration? decoration,
  bool useRootScaffold = true,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  assert(barrierColor == null || isModal);

  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    _FlexibleBottomSheetRoute<T>(
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      draggableScrollableController: draggableScrollableController,
      minHeight: minHeight ?? 0,
      initHeight: initHeight ?? 0.5,
      maxHeight: maxHeight ?? 1,
      isCollapsible: isCollapsible,
      isDismissible: isDismissible,
      isExpand: isExpand,
      builder: builder,
      isModal: isModal,
      anchors: anchors,
      keyboardBarrierColor: keyboardBarrierColor,
      bottomSheetColor: bottomSheetColor,
      bottomSheetBorderRadius: bottomSheetBorderRadius,
      barrierBottomSheetColor: barrierColor,
      duration: duration,
      isSafeArea: isSafeArea,
      decoration: decoration,
      useRootScaffold: useRootScaffold,
    ),
  );
}

Future<T?> showStickyFlexibleBottomSheet<T>({
  required BuildContext context,
  required FlexibleDraggableScrollableHeaderWidgetBuilder headerBuilder,
  required FlexibleDraggableScrollableWidgetBodyBuilder bodyBuilder,
  DraggableScrollableController? draggableScrollableController,
  double? minHeight,
  double? initHeight,
  double? maxHeight,
  bool isCollapsible = true,
  bool isDismissible = true,
  bool isExpand = true,
  bool useRootNavigator = false,
  bool isModal = true,
  List<double>? anchors,
  double? minHeaderHeight,
  double? maxHeaderHeight,
  double? headerHeight,
  Decoration? decoration,
  Color? keyboardBarrierColor,
  Color? bottomSheetColor,
  BorderRadiusGeometry? bottomSheetBorderRadius,
  Color? barrierColor,
  Duration? duration,
  bool isSafeArea = false,
  bool useRootScaffold = true,
}) {
  assert(maxHeaderHeight != null || headerHeight != null);
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  assert(barrierColor == null || isModal);

  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    _FlexibleBottomSheetRoute<T>(
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      minHeight: minHeight ?? 0,
      initHeight: initHeight ?? 0.5,
      maxHeight: maxHeight ?? 1,
      isCollapsible: isCollapsible,
      isDismissible: isDismissible,
      draggableScrollableController: draggableScrollableController,
      isExpand: isExpand,
      bodyBuilder: bodyBuilder,
      headerBuilder: headerBuilder,
      isModal: isModal,
      anchors: anchors,
      minHeaderHeight: minHeaderHeight ?? headerHeight ?? maxHeaderHeight! / 2,
      maxHeaderHeight: maxHeaderHeight ?? headerHeight!,
      decoration: decoration,
      keyboardBarrierColor: keyboardBarrierColor,
      bottomSheetColor: bottomSheetColor,
      bottomSheetBorderRadius: bottomSheetBorderRadius,
      barrierBottomSheetColor: barrierColor,
      duration: duration,
      isSafeArea: isSafeArea,
      useRootScaffold: useRootScaffold,
    ),
  );
}

class _FlexibleBottomSheetRoute<T> extends PopupRoute<T> {
  final FlexibleDraggableScrollableWidgetBuilder? builder;
  final FlexibleDraggableScrollableHeaderWidgetBuilder? headerBuilder;
  final FlexibleDraggableScrollableWidgetBodyBuilder? bodyBuilder;
  final DraggableScrollableController? draggableScrollableController;
  final double minHeight;
  final double initHeight;
  final double maxHeight;
  final bool isCollapsible;
  final bool isDismissible;
  final bool isExpand;
  final bool isModal;
  final List<double>? anchors;
  final double? minHeaderHeight;
  final double? maxHeaderHeight;
  final Decoration? decoration;
  final ThemeData? theme;
  final Color? keyboardBarrierColor;
  final Color? bottomSheetColor;
  final BorderRadiusGeometry? bottomSheetBorderRadius;
  final Color? barrierBottomSheetColor;
  final Duration? duration;
  final bool isSafeArea;
  final bool useRootScaffold;

  @override
  final String? barrierLabel;

  @override
  Duration get transitionDuration => duration ?? _bottomSheetDuration;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  Color? get barrierColor => isModal
      ? barrierBottomSheetColor ?? Colors.black54
      : const Color(0x00FFFFFF);

  late AnimationController _animationController;

  _FlexibleBottomSheetRoute({
    required this.minHeight,
    required this.initHeight,
    required this.maxHeight,
    required this.isCollapsible,
    required this.isDismissible,
    required this.isExpand,
    required this.isModal,
    required this.isSafeArea,
    required this.useRootScaffold,
    this.draggableScrollableController,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.theme,
    this.barrierLabel,
    this.anchors,
    this.minHeaderHeight,
    this.maxHeaderHeight,
    this.decoration,
    this.keyboardBarrierColor,
    this.bottomSheetColor,
    this.bottomSheetBorderRadius,
    this.barrierBottomSheetColor,
    this.duration,
    super.settings,
  });

  @override
  AnimationController createAnimationController() {
    _animationController = AnimationController(
      duration: transitionDuration,
      debugLabel: 'FlexibleBottomSheet',
      vsync: navigator!.overlay!,
    );

    return _animationController;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: isCollapsible
          ? FlexibleBottomSheet.collapsible(
              route: this,
              initHeight: initHeight,
              maxHeight: maxHeight,
              builder: builder,
              headerBuilder: headerBuilder,
              bodyBuilder: bodyBuilder,
              isExpand: isExpand,
              animationController: _animationController,
              anchors: anchors,
              draggableScrollableController: draggableScrollableController,
              minHeaderHeight: minHeaderHeight,
              maxHeaderHeight: maxHeaderHeight,
              decoration: decoration,
              keyboardBarrierColor: keyboardBarrierColor,
              bottomSheetColor: bottomSheetColor,
              useRootScaffold: useRootScaffold,
              bottomSheetBorderRadius: bottomSheetBorderRadius,
            )
          : FlexibleBottomSheet(
              route: this,
              minHeight: minHeight,
              initHeight: initHeight,
              maxHeight: maxHeight,
              builder: builder,
              headerBuilder: headerBuilder,
              bodyBuilder: bodyBuilder,
              isExpand: isExpand,
              animationController: _animationController,
              draggableScrollableController: draggableScrollableController,
              anchors: anchors,
              minHeaderHeight: minHeaderHeight,
              maxHeaderHeight: maxHeaderHeight,
              decoration: decoration,
              keyboardBarrierColor: keyboardBarrierColor,
              bottomSheetColor: bottomSheetColor,
              useRootScaffold: useRootScaffold,
              bottomSheetBorderRadius: bottomSheetBorderRadius,
            ),
    );

    if (theme != null) {
      bottomSheet = Theme(data: theme!, child: bottomSheet);
    }

    return isSafeArea
        ? SafeArea(child: bottomSheet, bottom: false)
        : bottomSheet;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0, 1);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: super.buildTransitions(
        context,
        animation,
        secondaryAnimation,
        child,
      ),
    );
  }
}
