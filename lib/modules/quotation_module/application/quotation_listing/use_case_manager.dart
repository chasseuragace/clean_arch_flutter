import 'package:dart_joy/modules/quotation_module/adapters/view_models/quotation_model.dart';
import 'package:dart_joy/modules/quotation_module/adapters/quotation_adapter.dart';
//yeti gare ui le viewmodel import garna pardaina
export 'package:dart_joy/modules/quotation_module/adapters/view_models/quotation_model.dart';

class QuotationListingManager  {
  List<Quotation> quotationList = [];

  QuotationListingManager() {
    getQuotationsList();
  }
  
  getQuotationsList() async {
    quotationListingAdapter(
      1,
      onSuccess: (Quotation data) {

      },

      //yo chai optional xa
      //error aauda kei na garne khalko jist ni huna sakxa, for eg, cache xa re hamro ma
      // error aauda cache ko
      onError: (e, s) => {},
    );
  }
}
