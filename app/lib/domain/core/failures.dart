import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;

  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.passwordsDontMatch({
    required T failedValue,
  }) = PasswordsDontMatch<T>;

  const factory ValueFailure.invalidUsername({
    required T failedValue,
  }) = InvalidUsername<T>;

  const factory ValueFailure.exceedingSize({
    required T failedValue,
    required int max,
  }) = ExceedingSize<T>;

  const factory ValueFailure.durationTooLong({
    required T failedValue,
    required int max,
  }) = DurationTooLong<T>;

  const factory ValueFailure.invalidAspectRatio({
    required T failedValue,
  }) = InvalidAspectRatio<T>;
}
