import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failures.freezed.dart';

@freezed
abstract class NetworkFailures with _$NetworkFailures {
  const factory NetworkFailures.serverError(String message) = _ServerError;
  const factory NetworkFailures.noInternet(String message) = _NoInternet;
}
