// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// Defines default property values for [BottomSheet]'s [Material].
///
/// Descendant widgets obtain the current [BottomSheetThemeData] object
/// using `Theme.of(context).bottomSheetTheme`. Instances of
/// [BottomSheetThemeData] can be customized with
/// [BottomSheetThemeData.copyWith].
///
/// Typically a [BottomSheetThemeData] is specified as part of the
/// overall [Theme] with [ThemeData.bottomSheetTheme].
///
/// All [BottomSheetThemeData] properties are `null` by default.
/// When null, the [BottomSheet] will provide its own defaults.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
class BottomSheetThemeData extends Diagnosticable {
  /// Creates a theme that can be used for [ThemeData.bottomSheetTheme].
  const BottomSheetThemeData({
    this.backgroundColor,
    this.elevation,
    this.persistentElevation,
    this.shape,
  });

  /// Default value for [BottomSheet.backgroundColor].
  ///
  /// If null, [BottomSheet] defaults to [Material]'s default.
  final Color backgroundColor;

  /// Default value for [BottomSheet.elevation].
  ///
  /// {@macro flutter.material.material.elevation}
  ///
  /// If null, [BottomSheet] defaults to 0.0.
  final double elevation;

  /// Value for [BottomSheet.elevation], if specified.
  ///
  /// If null, [BottomSheet.elevation] defaults to [elevation].
  final double persistentElevation;

  /// Default value for [BottomSheet.shape].
  ///
  /// If null, no overriding shape is specified for [BottomSheet], so the
  /// [BottomSheet] is rectangular.
  final ShapeBorder shape;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  BottomSheetThemeData copyWith({
    Color backgroundColor,
    double elevation,
    double persistentElevation,
    ShapeBorder shape,
  }) {
    return BottomSheetThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      persistentElevation: persistentElevation ?? this.persistentElevation,
      shape: shape ?? this.shape,
    );
  }

  /// Linearly interpolate between two bottom sheet themes.
  ///
  /// If both arguments are null then null is returned.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static BottomSheetThemeData lerp(BottomSheetThemeData a, BottomSheetThemeData b, double t) {
    assert(t != null);
    if (a == null && b == null)
      return null;
    return BottomSheetThemeData(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      persistentElevation: lerpDouble(a?.persistentElevation, b?.persistentElevation, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
    );
  }

  @override
  int get hashCode {
    return hashValues(
      backgroundColor,
      elevation,
      persistentElevation,
      shape,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other))
      return true;
    if (other.runtimeType != runtimeType)
      return false;
    final BottomSheetThemeData typedOther = other;
    return typedOther.backgroundColor == backgroundColor
        && typedOther.elevation == elevation
        && typedOther.persistentElevation == persistentElevation
        && typedOther.shape == shape;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor, defaultValue: null));
    properties.add(DoubleProperty('elevation', elevation, defaultValue: null));
    properties.add(DoubleProperty('persistentElevation', persistentElevation, defaultValue: null));
    properties.add(DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
  }
}
