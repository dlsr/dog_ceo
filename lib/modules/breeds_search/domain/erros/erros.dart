abstract class FailureSearch implements Exception {}

class DatasourceError implements FailureSearch {
  final String message;

  DatasourceError({this.message});
}
