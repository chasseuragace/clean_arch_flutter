import 'package:dart_joy/modules/quotation_module/data/models/quotation.dart';

///defines the structure for repo throughout the project
abstract class RepoStructure {
  bool enableLogging = false;
  void handelAllErrors(error, StackTrace stacktrace);
}

///The general **abstraction** for Repo
///
///Naming :
/// ends with Reop Eg. LocationRepo, CartRepo, WeatherRepo, OrdersRepo
///
///Functionality :
/// Send / Get to/from data sources
///
///**Important**
///
///Repo methods without returntype doesn't make sense
///
///
///Strictly couples with [RepoOutput] or similar union mechanism for ensuring
///either error or expected data is returned
abstract class SomethingRepo extends RepoStructure {
  // this is BS
  // void doSomething();

  /// Requirement / API calls determines the naming
  ///Example : getUserProfile , updateBirthday
  Future<RepoOutput> doSomethingElseWith(int model);
}

/// Cheap yet functional structure for data union to be used with Repo
///
/// getter [hasError] flags if the response completed with error or data.
/// Use the [handle] method for operations based on result
class RepoOutput<T> {
  RepoOutput.withError(this.e, this.t) : data = null;
  RepoOutput.withData(
    this.data,
  )   : e = null,
        t = null;
  final T? data;
  final Exception? e;
  final StackTrace? t;
  bool get hasError => e != null;

  @override
  String toString() {
    return hasError
        ? "${e.runtimeType} Error Occured"
        : "Data is ${data.runtimeType}";
  }

  /// assigns handler for either senarios
  /// [onData] is the data provider
  ///
  /// onError provides [Exception] or [dynamic] with [StackTrace]
  void handle(
      {required SuccessCaseHandler<T> onData, ErrorCaseHandler? onError}) {
    (hasError)
        ? () {
            if (onError != null) onError(e, t);

            //do something else like logging..  hantan
          }
        : onData(data as T);
  }
}

typedef ErrorCaseHandler = void Function(dynamic e, dynamic s);
typedef SuccessCaseHandler<T> = void Function(T data);

///Implementation example
class SomehtingRepoImplementation extends SomethingRepo {
  @override
  Future<RepoOutput<QuotationResponseObject>> doSomethingElseWith(
      int model) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      if (model % 2 == 0) Service.doThings();
      return RepoOutput<QuotationResponseObject>.withData(
          QuotationResponseObject());
    } catch (e, s) {
      handelAllErrors(e, s);
      return RepoOutput.withError(e is Exception ? e : Exception(e), s);
    }
  }

  @override
  void handelAllErrors(error, StackTrace stacktrace) {
    if (!enableLogging) return;
    print("Logger Says");
    print(stacktrace.toString());
    print(error.toString());
  }
}

class Service {
  static void doThings() {
    throw Exception("somethingWtong");
  }
}
