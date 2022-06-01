
part of 'home_cubit.dart';

@immutable
abstract class HomeState{
  const HomeState();

}

class HomeInitial extends HomeState {
   const HomeInitial();
}

class HomeLoading extends HomeState{

   const HomeLoading();
}

class HomeError extends HomeState{
  final String message;

   const HomeError(this.message);
}

class HomeCompleted extends HomeState {
  List<HomeModel> homeModel;


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeCompleted &&
      listEquals(other.homeModel, homeModel);
  }

  @override
  int get hashCode => homeModel.hashCode;
    HomeCompleted(this.homeModel);
}
