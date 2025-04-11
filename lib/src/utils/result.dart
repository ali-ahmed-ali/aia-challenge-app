sealed class Result {
  const Result();
}

final class Success extends Result {
  const Success({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;
}

final class Failure extends Result {
  const Failure(
    this.error, [
    this.stackTrace,
  ]);

  final Object? error;
  final StackTrace? stackTrace;
}
