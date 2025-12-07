import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverFailure([String? message]) = ServerFailure;
  const factory Failure.connectionFailure() = ConnectionFailure;
  const factory Failure.cacheFailure() = CacheFailure;
  const factory Failure.unexpectedFailure([String? message]) = UnexpectedFailure;
}