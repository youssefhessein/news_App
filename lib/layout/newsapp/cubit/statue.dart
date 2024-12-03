abstract class NewsStates {}

class NewsInitialState extends NewsStates{}
class NewBottomNavState extends NewsStates{}

class NewsGetPublicLoadingState extends NewsStates{}
class NewsGetPublicSuccessState extends NewsStates{}
class NewsGetPublicErrorState extends NewsStates{

  late final String error;
  NewsGetPublicErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}
class NewsGeSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{

  late final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{

  late final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{

  late final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsSelectPublicItemState extends NewsStates{}


