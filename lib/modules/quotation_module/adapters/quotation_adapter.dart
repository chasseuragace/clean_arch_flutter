import 'package:dart_joy/dart_joy.dart';
import 'package:dart_joy/modules/quotation_module/application/quotation_listing/use_case_manager.dart';

//dunya deewana import garna paune thau ho, mostly utils / repo bata hunxa
void quotationListingAdapter(int parm,
    {required SuccessCaseHandler<Quotation> onSuccess,
    ErrorCaseHandler? onError}) async {
  var result = (await SomehtingRepoImplementation().doSomethingElseWith(parm));
  result.handle(
      onData: (data) {
        Quotation viewData = Quotation(data);

        //  Quotation viewData = Quotation(data.toMap());

        try {
          //yaa Domain Mapping hunxa Eg.

          //simple as this
          // final newData = NewData of type T .fromMap(olddata.toMap());
          //or vayankar complex as this
          // newData.someProp = olddata.someotherProp.conversionLogic.where((prop)=>prop.han is Tan);
          //we also expect Logical exceptions Here, logical vanya custom app exceptions
          //jun chai ui sanga relevant hunxa

          //lastly yaa chai mapped - viewmodel type T vako data passhunxa
        } catch (e, s) {
          if (onError != null) {
            onError(e, s);
          }
          return;
        }
        onSuccess(viewData);
      },
      onError: onError ?? (_, __) {});
}
