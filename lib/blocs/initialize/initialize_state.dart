import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class InitializeState extends Equatable {
  final bool needAppUpdating = false;
  final bool initialized = false;

  @override
  List<Object> get props => [
        needAppUpdating,
        initialized,
      ];
}

class CheckAppNeedUpdate extends InitializeState {
  @override
  List<Object> get props => [needAppUpdating];
}
