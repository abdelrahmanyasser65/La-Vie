abstract class FeedState {}

class FeedInitialState extends FeedState {}

class GetAllFeedSuccessState extends FeedState {}

class GetAllFeedErrorState extends FeedState {}
class GetAllFeedLoadingState extends FeedState {}
class ChangeItemFeedScreenState extends FeedState{}

class GetMyFeedErrorState extends FeedState {}
class GetMyFeedLoadingState extends FeedState {}
class GetMyFeedSuccessState extends FeedState {}


class CreatePostErrorState extends FeedState {}
class CreatePostLoadingState extends FeedState {}
class CreatePostSuccessState extends FeedState {}

class GetImagePostSuccessState extends FeedState{}
class GetImagePostErrorState extends FeedState{}
class RemovePostImageState extends FeedState{}

