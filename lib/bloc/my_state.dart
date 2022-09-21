part of 'my_bloc.dart';

class MyState extends Union4Impl<Initial, Loading, Success, Failure> {
  static const unions = Quartet<Initial, Loading, Success, Failure>();

  MyState._(Union4<Initial, Loading, Success, Failure> union) : super(union);

  factory MyState.initial() => MyState._(unions.first(Initial()));

  factory MyState.loading() => MyState._(unions.second(Loading()));

  factory MyState.success() => MyState._(unions.third(Success()));

  factory MyState.failure() => MyState._(unions.fourth(Failure()));
}

class Initial {}

class Loading {}

class Success {}

class Failure {}
