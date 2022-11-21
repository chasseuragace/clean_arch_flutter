//Yo jun xa ,API response class haru , yesko rigidity /  flexibility le
// app ko architecture ma mostly adapter ko  responsibility ma  farak parxa

//naming ma QuotationResponseObject ko sato QuotationItem vo vane yo domain ko object vo
// domain ko objects mathi use case banxa then tesko mathi eauta system
// so yo object lai chai hamro external infracture
// (data source/kg/pound conversion tool / logic/ implementation)
//ko change sanga matlab nai huna vayena

// aaba source hamrai Server  ho,
// Ushle ni yo sap kura sochnu bujnu jannu parxa

// tyo assumption vaye thik xa , these objects can be used in Manager,

class QuotationResponseObject {
  final AttachedImages? attachedImages;

  QuotationResponseObject({this.attachedImages});
  factory QuotationResponseObject.fromMap(map) {
    return QuotationResponseObject();
  }
}

class AttachedImages {
  late final List<Images> imageList;
}

class Images {
  final String name;
  final String url;
  Images(this.name, this.url);
}
