// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixes.dart';

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$GeneratorError extends GeneratorError {
  @override
  final String message;
  @override
  final int offset;
  @override
  final int length;
  @override
  final String fix;

  factory _$GeneratorError([void updates(GeneratorErrorBuilder b)]) =>
      (new GeneratorErrorBuilder()..update(updates)).build();

  _$GeneratorError._({this.message, this.offset, this.length, this.fix})
      : super._() {
    if (message == null)
      throw new BuiltValueNullFieldError('GeneratorError', 'message');
  }

  @override
  GeneratorError rebuild(void updates(GeneratorErrorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneratorErrorBuilder toBuilder() =>
      new GeneratorErrorBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! GeneratorError) return false;
    return message == other.message &&
        offset == other.offset &&
        length == other.length &&
        fix == other.fix;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), offset.hashCode), length.hashCode),
        fix.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GeneratorError')
          ..add('message', message)
          ..add('offset', offset)
          ..add('length', length)
          ..add('fix', fix))
        .toString();
  }
}

class GeneratorErrorBuilder
    implements Builder<GeneratorError, GeneratorErrorBuilder> {
  _$GeneratorError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _offset;
  int get offset => _$this._offset;
  set offset(int offset) => _$this._offset = offset;

  int _length;
  int get length => _$this._length;
  set length(int length) => _$this._length = length;

  String _fix;
  String get fix => _$this._fix;
  set fix(String fix) => _$this._fix = fix;

  GeneratorErrorBuilder();

  GeneratorErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _offset = _$v.offset;
      _length = _$v.length;
      _fix = _$v.fix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneratorError other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$GeneratorError;
  }

  @override
  void update(void updates(GeneratorErrorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GeneratorError build() {
    final _$result = _$v ??
        new _$GeneratorError._(
            message: message, offset: offset, length: length, fix: fix);
    replace(_$result);
    return _$result;
  }
}
