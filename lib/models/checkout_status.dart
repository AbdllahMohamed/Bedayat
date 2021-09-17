class CheckoutStatus {
  String? code;

  CheckoutStatus({this.code});

  CheckoutStatus.fromJson(Map<String, dynamic> json) : code = json['code'];
}
