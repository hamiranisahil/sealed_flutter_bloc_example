import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'my_event.dart';
part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  /// {@macro my_bloc}
  MyBloc() : super(MyState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(MyState.loading());
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(MyState.success());
    });

    on<ErrorOccurred>((event, emit) => emit(MyState.failure()));
  }
}