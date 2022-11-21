import 'package:dart_joy/modules/quotation_module/data/models/quotation.dart'
    as dto;

///not to be be confused with view models of MVV
///files heres are PODO objects

//UI le use garne Object

// mostly expose gareko contet vaneko eiter plain dart object / data type hunxa
// repo ko ni expose garna paieeo? parieeo.
// tara dependency maintainable huna paro
//-conditions:
//-- object nested huna vayena,
//-- nested object ho vene data layer ma abstract parnu paro

//

class Quotation {
  final dto.QuotationResponseObject _dto;
  String? id;
  List<String> images = [];
  DateTime? createdDate;

  Quotation(this._dto);

  //ya ni constrains xa
  //1. repo object nested huna vayena
  List<Images> get someProp => [];
  // List<dto.Images> get someProp => _dto.attachedImages?.imageList ?? [];
}

abstract class Images {
  final String url;
  final String name;

  Images(this.url, this.name);
}

///Repo could contain something similar / or  the exact thing

