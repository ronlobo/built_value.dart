// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';

// Note: BuiltSet preserves order, so comparisons in these tests can assume a
// specific ordering. In fact, these tests are exactly the BuiltListSerializer
// tests with "list" replaced by "set".
void main() {
  group('BuiltSet with known specifiedType but missing builder', () {
    final data = new BuiltSet<int>([1, 2, 3]);
    final specifiedType = const FullType(BuiltSet, const [const FullType(int)]);
    final serializers = new Serializers();
    final serialized = [1, 2, 3];

    test('serialize throws', () {
      expect(() => serializers.serialize(data, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });

    test('deserialize throws', () {
      expect(
          () =>
              serializers.deserialize(serialized, specifiedType: specifiedType),
          throwsA(new isInstanceOf<StateError>()));
    });
  });

  group('BuiltSet with known specifiedType and correct builder', () {
    final data = new BuiltSet<int>([1, 2, 3]);
    final specifiedType = const FullType(BuiltSet, const [const FullType(int)]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(specifiedType, () => new SetBuilder<int>()))
        .build();
    final serialized = [1, 2, 3];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });

    test('keeps generic type when deserialized', () {
      expect(
          serializers
              .deserialize(serialized, specifiedType: specifiedType)
              .runtimeType,
          new BuiltSet<int>().runtimeType);
    });
  });

  group('BuiltSet nested with known specifiedType and correct builders', () {
    final data = new BuiltSet<BuiltSet<int>>([
      new BuiltSet<int>([1, 2, 3]),
      new BuiltSet<int>([4, 5, 6]),
      new BuiltSet<int>([7, 8, 9])
    ]);
    final specifiedType = const FullType(BuiltSet, const [
      const FullType(BuiltSet, const [const FullType(int)])
    ]);
    final serializers = (new Serializers().toBuilder()
          ..addBuilderFactory(
              specifiedType, () => new SetBuilder<BuiltSet<int>>())
          ..addBuilderFactory(
              const FullType(BuiltSet, const [const FullType(int)]),
              () => new SetBuilder<int>()))
        .build();
    final serialized = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });

  group('BuiltSet with unknown specifiedType and no builders', () {
    final data = new BuiltSet<int>([1, 2, 3]);
    final specifiedType = FullType.unspecified;
    final serializers = new Serializers();
    final serialized = [
      'set',
      ['int', 1],
      ['int', 2],
      ['int', 3]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType),
          serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType),
          data);
    });
  });
}
