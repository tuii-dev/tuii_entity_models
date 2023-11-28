import 'package:equatable/equatable.dart';

class MainIndexStreamPayload extends Equatable {
  final int index;
  final bool isSystemRoute;

  const MainIndexStreamPayload({
    required this.index,
    required this.isSystemRoute,
  });

  @override
  List<Object> get props => [
        index,
        isSystemRoute,
      ];

  MainIndexStreamPayload copyWith({
    int? index,
    bool? isSystemRoute,
  }) {
    return MainIndexStreamPayload(
      index: index ?? this.index,
      isSystemRoute: isSystemRoute ?? this.isSystemRoute,
    );
  }
}
