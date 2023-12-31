import 'package:dartz/dartz.dart';
import 'package:sunshine/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure,T>>;