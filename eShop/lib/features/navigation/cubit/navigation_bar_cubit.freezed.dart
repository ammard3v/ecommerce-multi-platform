part of 'navigation_bar_cubit.dart';
T _$identity<T>(T value) => value;
mixin _$NavigationBarState {
  int get selectedIndex;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationBarStateCopyWith<NavigationBarState> get copyWith =>
      _$NavigationBarStateCopyWithImpl<NavigationBarState>(
          this as NavigationBarState, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationBarState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }
  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);
  @override
  String toString() {
    return 'NavigationBarState(selectedIndex: $selectedIndex)';
  }
}
abstract mixin class $NavigationBarStateCopyWith<$Res> {
  factory $NavigationBarStateCopyWith(
          NavigationBarState value, $Res Function(NavigationBarState) _then) =
      _$NavigationBarStateCopyWithImpl;
  @useResult
  $Res call({int selectedIndex});
}
class _$NavigationBarStateCopyWithImpl<$Res>
    implements $NavigationBarStateCopyWith<$Res> {
  _$NavigationBarStateCopyWithImpl(this._self, this._then);
  final NavigationBarState _self;
  final $Res Function(NavigationBarState) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_self.copyWith(
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}
extension NavigationBarStatePatterns on NavigationBarState {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int selectedIndex)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.selectedIndex);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int selectedIndex) initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.selectedIndex);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int selectedIndex)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.selectedIndex);
      case _:
        return null;
    }
  }
}
class _Initial implements NavigationBarState {
  const _Initial({required this.selectedIndex});
  @override
  final int selectedIndex;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }
  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);
  @override
  String toString() {
    return 'NavigationBarState.initial(selectedIndex: $selectedIndex)';
  }
}
abstract mixin class _$InitialCopyWith<$Res>
    implements $NavigationBarStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @override
  @useResult
  $Res call({int selectedIndex});
}
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);
  final _Initial _self;
  final $Res Function(_Initial) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_Initial(
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}
