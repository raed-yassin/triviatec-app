// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCategoryName)
final getCategoryNameProvider = GetCategoryNameProvider._();

final class GetCategoryNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  GetCategoryNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCategoryNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCategoryNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return getCategoryName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$getCategoryNameHash() => r'd1234e188eac18360bf6b8fdaba0a21beeb49c32';
