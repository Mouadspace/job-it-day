// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import "package:flutter/material.dart";

// TODO(dragostis): Missing functionality:
//   * mobile horizontal mode with adding/removing steps
//   * alternative labeling
//   * CustomStepper feedback in the case of high-latency interactions

/// The state of a [CustomStep] which is used to control the style of the circle and
/// text.
///
/// See also:
///
///  * [CustomStep]
enum CustomStepState {
  /// A CustomStep that displays its index in its circle.
  indexed,

  /// A CustomStep that displays a pencil icon in its circle.
  editing,

  /// A CustomStep that displays a tick icon in its circle.
  complete,

  /// A CustomStep that is disabled and does not to react to taps.
  disabled,

  /// A CustomStep that is currently having an error. e.g. the user has submitted wrong
  /// input.
  error,
}

/// Defines the [CustomCustomStepper]'s main axis.
enum CustomStepperType {
  /// A vertical layout of the steps with their content in-between the titles.
  vertical,

  /// A horizontal layout of the steps with their content below the titles.
  horizontal,
}

/// Container for all the information necessary to build a CustomStepper widget's
/// forward and backward controls for any given CustomStep.
///
/// Used by [CustomStepper.controlsBuilder].
@immutable
class ControlsDetails {
  /// Creates a set of details describing the CustomStepper.
  const ControlsDetails({
    required this.currentStep,
    required this.stepIndex,
    this.onStepCancel,
    this.onStepContinue,
  });

  /// Index that is active for the surrounding [CustomStepper] widget. This may be
  /// different from [stepIndex] if the user has just changed steps and we are
  /// currently animating toward that CustomStep.
  final int currentStep;

  /// Index of the CustomStep for which these controls are being built. This is
  /// not necessarily the active index, if the user has just changed steps and
  /// this CustomStep is animating away. To determine whether a given builder is building
  /// the active CustomStep or the CustomStep being navigated away from, see [isActive].
  final int stepIndex;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  /// True if the indicated CustomStep is also the current active CustomStep. If the user has
  /// just activated the transition to a new CustomStep, some [CustomStepper.type] values will
  /// lead to both steps being rendered for the duration of the animation shifting
  /// between steps.
  bool get isActive => currentStep == stepIndex;
}

/// A builder that creates a widget given the two callbacks `onStepContinue` and
/// `onStepCancel`.
///
/// Used by [CustomStepper.controlsBuilder].
///
/// See also:
///
///  * [WidgetBuilder], which is similar but only takes a [BuildContext].
typedef ControlsWidgetBuilder = Widget Function(
    BuildContext context, ControlsDetails details);

const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);
const Color _kErrorLight = Colors.red;
final Color _kErrorDark = Colors.red.shade400;
const Color _kCircleActiveLight = Colors.white;
const Color _kCircleActiveDark = Colors.black87;
const Color _kDisabledLight = Colors.black38;
const Color _kDisabledDark = Colors.white38;
const double _kStepSize = 24.0;
const double _kTriangleHeight =
    _kStepSize * 0.866025; // Triangle height. sqrt(3.0) / 2.0

/// A material CustomStep used in [CustomStepper]. The CustomStep can have a title and subtitle,
/// an icon within its circle, some content and a state that governs its
/// styling.
///
/// See also:
///
///  * [CustomStepper]
///  * <https://material.io/archive/guidelines/components/CustomSteppers.html>
@immutable
class CustomStep {
  /// Creates a CustomStep for a [CustomStepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const CustomStep({
    required this.title,
    this.subtitle,
    required this.content,
    this.state = CustomStepState.indexed,
    this.isActive = false,
    this.label,
  })  : assert(title != null),
        assert(content != null),
        assert(state != null);

  /// The title of the CustomStep that typically describes it.
  final Widget title;

  /// The subtitle of the CustomStep that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget? subtitle;

  /// The content of the CustomStep that appears below the [title] and [subtitle].
  ///
  /// Below the content, every CustomStep has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the CustomStep which determines the styling of its components
  /// and whether steps are interactive.
  final CustomStepState state;

  /// Whether or not the CustomStep is active. The flag only influences styling.
  final bool isActive;

  /// Only [CustomStepperType.horizontal], Optional widget that appears under the [title].
  /// By default, uses the `bodyLarge` theme.
  final Widget? label;
}

/// A material CustomStepper widget that displays progress through a sequence of
/// steps. CustomSteppers are particularly useful in the case of forms where one CustomStep
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
///
/// The widget is a flexible wrapper. A parent class should pass [currentStep]
/// to this widget based on some logic triggered by the three callbacks that it
/// provides.
///
/// {@tool dartpad}
/// An example the shows how to use the [CustomStepper], and the [CustomStepper] UI
/// appearance.
///
/// ** See code in examples/api/lib/material/CustomStepper/CustomStepper.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [CustomStep]
///  * <https://material.io/archive/guidelines/components/CustomSteppers.html>
class CustomStepper extends StatefulWidget {
  /// Creates a CustomStepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old CustomStepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  const CustomStepper({
    super.key,
    this.onStepContinueBtnLabel,
    this.onStepCancelBtnLabel,
    required this.steps,
    this.physics,
    this.type = CustomStepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.elevation,
    this.margin,
  })  : assert(steps != null),
        assert(type != null),
        assert(currentStep != null),
        assert(0 <= currentStep && currentStep < steps.length);

  /// The steps of the CustomStepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  ///
  final String? onStepContinueBtnLabel;
  final String? onStepCancelBtnLabel;
  final List<CustomStep> steps;

  /// How the CustomStepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the CustomStepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics? physics;

  /// The type of CustomStepper that determines the layout. In the case of
  /// [CustomStepperType.horizontal], the content of the current CustomStep is displayed
  /// underneath as opposed to the [CustomStepperType.vertical] case where it is
  /// displayed in-between.
  final CustomStepperType type;

  /// The index into [steps] of the current CustomStep whose content is displayed.
  final int currentStep;

  /// The callback called when a CustomStep is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int>? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  /// The callback for creating custom controls.
  ///
  /// If null, the default controls from the current theme will be used.
  ///
  /// This callback which takes in a context and a [ControlsDetails] object, which
  /// contains CustomStep information and two functions: [onStepContinue] and [onStepCancel].
  /// These can be used to control the CustomStepper. For example, reading the
  /// [ControlsDetails.currentStep] value within the callback can change the text
  /// of the continue or cancel button depending on which CustomStep users are at.
  ///
  /// {@tool dartpad}
  /// Creates a CustomStepper control with custom buttons.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return CustomStepper(
  ///     controlsBuilder:
  ///       (BuildContext context, ControlsDetails details) {
  ///          return Row(
  ///            children: <Widget>[
  ///              TextButton(
  ///                onPressed: details.onStepContinue,
  ///                child: Text('Continue to CustomStep ${details.stepIndex + 1}'),
  ///              ),
  ///              TextButton(
  ///                onPressed: details.onStepCancel,
  ///                child: Text('Back to CustomStep ${details.stepIndex - 1}'),
  ///              ),
  ///            ],
  ///          );
  ///       },
  ///     steps: const <CustomStep>[
  ///       CustomStep(
  ///         title: Text('A'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///       CustomStep(
  ///         title: Text('B'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  /// ** See code in examples/api/lib/material/CustomStepper/CustomStepper.controls_builder.0.dart **
  /// {@end-tool}
  final ControlsWidgetBuilder? controlsBuilder;

  /// The elevation of this CustomStepper's [Material] when [type] is [CustomStepperType.horizontal].
  final double? elevation;

  /// custom margin on vertical CustomStepper.
  final EdgeInsetsGeometry? margin;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, CustomStepState> _oldStates = <int, CustomStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  bool _isLabel() {
    for (final CustomStep step in widget.steps) {
      if (step.label != null) {
        return true;
      }
    }
    return false;
  }

  Widget _buildLine(bool visible) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 16.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final CustomStepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;
    final bool isDarkActive = _isDark() && widget.steps[index].isActive;
    assert(state != null);
    switch (state) {
      case CustomStepState.indexed:
      case CustomStepState.disabled:
        return Text(
          '${index + 1}',
          style: isDarkActive
              ? _kStepStyle.copyWith(color: Colors.black87)
              : _kStepStyle,
        );
      case CustomStepState.editing:
        return Icon(
          Icons.edit,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
      case CustomStepState.complete:
        return Icon(
          Icons.check,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
      case CustomStepState.error:
        return const Text('!', style: _kStepStyle);
    }
  }

  Color _circleColor(int index) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    if (!_isDark()) {
      return widget.steps[index].isActive
          ? colorScheme.primary
          : colorScheme.onSurface.withOpacity(0.38);
    } else {
      return widget.steps[index].isActive
          ? colorScheme.secondary
          : colorScheme.background;
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(index,
              oldState && widget.steps[index].state == CustomStepState.error),
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height:
              _kTriangleHeight, // Height of 24dp-long-sided equilateral triangle.
          child: CustomPaint(
            painter: _TrianglePainter(
              color: _isDark() ? _kErrorDark : _kErrorLight,
            ),
            child: Align(
              alignment: const Alignment(
                  0.0, 0.8), // 0.8 looks better than the geometrical 0.33.
              child: _buildCircleChild(
                  index,
                  oldState &&
                      widget.steps[index].state != CustomStepState.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == CustomStepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != CustomStepState.error) {
        return _buildCircle(index, false);
      } else {
        return _buildTriangle(index, false);
      }
    }
  }

  Widget _buildVerticalControls(int stepIndex) {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder!(
        context,
        ControlsDetails(
          currentStep: widget.currentStep,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel,
          stepIndex: stepIndex,
        ),
      );
    }

    // final Color cancelColor;
    // switch (Theme.of(context).brightness) {
    //   case Brightness.light:
    //     cancelColor = Colors.black54;
    //     break;
    //   case Brightness.dark:
    //     cancelColor = Colors.white70;
    //     break;
    // }

    // final ThemeData themeData = Theme.of(context);
    // final ColorScheme colorScheme = themeData.colorScheme;
    // final MaterialLocalizations localizations =
    //     MaterialLocalizations.of(context);

    // const OutlinedBorder buttonShape = RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(2)));
    // const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);

    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size.fromHeight(52),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
            onPressed: widget.onStepContinue,
            child: Text(widget.onStepContinueBtnLabel ?? "SUIVANT",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        ));
  }

  TextStyle _titleStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    assert(widget.steps[index].state != null);
    switch (widget.steps[index].state) {
      case CustomStepState.indexed:
      case CustomStepState.editing:
      case CustomStepState.complete:
        return textTheme.bodyLarge!;
      case CustomStepState.disabled:
        return textTheme.bodyLarge!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case CustomStepState.error:
        return textTheme.bodyLarge!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  TextStyle _subtitleStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    assert(widget.steps[index].state != null);
    switch (widget.steps[index].state) {
      case CustomStepState.indexed:
      case CustomStepState.editing:
      case CustomStepState.complete:
        return textTheme.bodySmall!;
      case CustomStepState.disabled:
        return textTheme.bodySmall!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case CustomStepState.error:
        return textTheme.bodySmall!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  TextStyle _labelStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    assert(widget.steps[index].state != null);
    switch (widget.steps[index].state) {
      case CustomStepState.indexed:
      case CustomStepState.editing:
      case CustomStepState.complete:
        return textTheme.bodyLarge!;
      case CustomStepState.disabled:
        return textTheme.bodyLarge!.copyWith(
          color: _isDark() ? _kDisabledDark : _kDisabledLight,
        );
      case CustomStepState.error:
        return textTheme.bodyLarge!.copyWith(
          color: _isDark() ? _kErrorDark : _kErrorLight,
        );
    }
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(index),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(index),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildLabelText(int index) {
    if (widget.steps[index].label != null) {
      return AnimatedDefaultTextStyle(
        style: _labelStyle(index),
        duration: kThemeAnimationDuration,
        child: widget.steps[index].label!,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Line parts are always added in order for the ink splash to
              // flood the tips of the connector lines.
              _buildLine(!_isFirst(index)),
              _buildIcon(index),
              _buildLine(!_isLast(index)),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(int index) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 1.0,
                child: Container(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: widget.margin ??
                const EdgeInsetsDirectional.only(
                  start: 60.0,
                  end: 24.0,
                  bottom: 24.0,
                ),
            child: Column(
              children: <Widget>[
                widget.steps[index].content,
                _buildVerticalControls(index),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildVertical() {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              InkWell(
                onTap: widget.steps[i].state != CustomStepState.disabled
                    ? () {
                        // In the vertical case we need to scroll to the newly tapped
                        // CustomStep.
                        Scrollable.ensureVisible(
                          _keys[i].currentContext!,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );

                        widget.onStepTapped?.call(i);
                      }
                    : null,
                canRequestFocus:
                    widget.steps[i].state != CustomStepState.disabled,
                child: _buildVerticalHeader(i),
              ),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != CustomStepState.disabled
              ? () {
                  widget.onStepTapped?.call(i);
                }
              : null,
          canRequestFocus: widget.steps[i].state != CustomStepState.disabled,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: _isLabel() ? 104.0 : 72.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.steps[i].label != null)
                      const SizedBox(
                        height: 24.0,
                      ),
                    Center(child: _buildIcon(i)),
                    if (widget.steps[i].label != null)
                      SizedBox(
                        height: 24.0,
                        child: _buildLabelText(i),
                      ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 12.0),
                child: _buildHeaderText(i),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
      ],
    ];

    final List<Widget> stepPanels = <Widget>[];
    for (int i = 0; i < widget.steps.length; i += 1) {
      stepPanels.add(
        Visibility(
          maintainState: true,
          visible: i == widget.currentStep,
          child: widget.steps[i].content,
        ),
      );
    }

    return Container(
      // color: Colors.blue,
      height: MediaQuery.of(context).size.height - 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Material(
            // elevation: widget.elevation ?? 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: children,
              ),
            ),
          ),
          AnimatedSize(
            curve: Curves.fastOutSlowIn,
            duration: kThemeAnimationDuration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: stepPanels,
            ),
          ),
          _buildVerticalControls(widget.currentStep),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<CustomStepper>() != null) {
        throw FlutterError(
          'CustomSteppers must not be nested.\n'
          'The material specification advises that one should avoid embedding '
          'CustomSteppers within CustomSteppers. '
          'https://material.io/archive/guidelines/components/CustomSteppers.html#CustomSteppers-usage',
        );
      }
      return true;
    }());
    assert(widget.type != null);
    switch (widget.type) {
      case CustomStepperType.vertical:
        return _buildVertical();
      case CustomStepperType.horizontal:
        return _buildHorizontal();
    }
  }
}

// Paints a triangle whose base is the bottom of the bounding rectangle and its
// top vertex the middle of its top.
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    required this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double base = size.width;
    final double halfBase = size.width / 2.0;
    final double height = size.height;
    final List<Offset> points = <Offset>[
      Offset(0.0, height),
      Offset(base, height),
      Offset(halfBase, 0.0),
    ];

    canvas.drawPath(
      Path()..addPolygon(points, true),
      Paint()..color = color,
    );
  }
}
