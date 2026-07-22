// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getQuestions)
final getQuestionsProvider = GetQuestionsProvider._();

final class GetQuestionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>
        >
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  GetQuestionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getQuestionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getQuestionsHash();

  @$internal
  @override
  $FutureProviderElement<List<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    return getQuestions(ref);
  }
}

String _$getQuestionsHash() => r'b99913c0c7904eae8373771bceb4ae604d4cdd5c';

@ProviderFor(Score)
final scoreProvider = ScoreProvider._();

final class ScoreProvider extends $NotifierProvider<Score, int> {
  ScoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scoreHash();

  @$internal
  @override
  Score create() => Score();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$scoreHash() => r'527eedba261ee7c2e47f512db45ea0567e723ca5';

abstract class _$Score extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
