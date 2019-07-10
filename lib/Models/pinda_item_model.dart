
class PindaItemModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  PindaItemModel ({this.icon,this.title,this.url,this.statusBarColor,this.hideAppBar});

  factory PindaItemModel.fromJson(Map<String,dynamic> json){
    return PindaItemModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}