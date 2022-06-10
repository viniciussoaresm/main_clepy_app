import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedEventLoadInitial extends FeedEvent {}

class FeedEventFindByCategory extends FeedEvent {
  FeedEventFindByCategory({required this.categoryId});

  final String categoryId;
}
