abstract class ScanState {}
class InitialScanState extends ScanState{}
class GetOneBlogLoadingState extends ScanState{}
class GetOneBlogErrorState extends ScanState{}
class GetOneBlogSuccessState extends ScanState{}
class GetAllBlogLoadingState extends ScanState{}
class GetAllBlogErrorState extends ScanState{}
class GetAllBlogSuccessState extends ScanState{}