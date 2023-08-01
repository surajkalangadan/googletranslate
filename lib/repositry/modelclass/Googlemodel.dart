class Googlemodel {
  Googlemodel({
      this.status, 
      this.translatedText, 
      this.languageCode, 
      this.languageName,});

  Googlemodel.fromJson(dynamic json) {
    status = json['status'];
    translatedText = json['translated_text'];
    languageCode = json['language_code'];
    languageName = json['language_name'];
  }
  String? status;
  String? translatedText;
  String? languageCode;
  String? languageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['translated_text'] = translatedText;
    map['language_code'] = languageCode;
    map['language_name'] = languageName;
    return map;
  }

}