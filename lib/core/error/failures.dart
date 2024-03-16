import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class ServerFailure extends Failure{
  final String error;
  ServerFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class CacheFailure extends Failure{

  final String error;
  CacheFailure({required this.error});

  @override
  List<Object> get props => [error];

}