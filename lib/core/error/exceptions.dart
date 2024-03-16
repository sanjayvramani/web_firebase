
import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception{
  final String exception;
  const ServerException({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}

class CacheException extends Equatable implements Exception{
  final String exception;
  const CacheException({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}