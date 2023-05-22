class CryptoModel {
  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxsupply;
  String? price;
  String? changepecent24hr;
  CryptoModel(
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxsupply,
    this.price,
    this.changepecent24hr,
  );
  factory CryptoModel.fromMapJson(Map<String, dynamic> jsonobject) {
    return CryptoModel(
      jsonobject['id'],
      jsonobject['rank'],
      jsonobject['symbol'],
      jsonobject['name'],
      jsonobject['supply'],
      jsonobject['maxSupply'],
      jsonobject['priceUsd'],
      jsonobject['changePercent24Hr'],
    );
  }
}
