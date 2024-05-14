import 'package:freezed_annotation/freezed_annotation.dart';
part 'string.freezed.dart';

@freezed
class RosString with _$RosString {
  const factory RosString({
    required String name,
    // Add more fields as needed
  }) = _RosString;
}
