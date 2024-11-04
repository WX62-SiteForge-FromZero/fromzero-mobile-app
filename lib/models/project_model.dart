class Project {
  int id;
  String name;
  String description;
  String state;
  double progress;

  // Company
  int companyId;
  // Developer
  int? developerId;

  List<dynamic> candidates;
  List<dynamic> languages;
  List<dynamic> frameworks;
  String type;
  String budget;

  Project(this.id, this.name, this.description, this.state, this.progress,
      this.companyId, this.developerId, this.candidates, this.languages,
      this.frameworks, this.type, this.budget);

  factory Project.fromJson(Map<String, dynamic>json){
    return Project(
      json['id'],
      json['name'],
      json['description'],
      json['state'],
      json['progress'],
      //json['companyId'],
      //json['developerId'],
      json['company']['id'],
      json['developer']==null?null:json['developer']['id'],
      json['candidates'],
      json['languages'],
      json['frameworks'],
      json['type'],
      json['budget']
    );
  }
}
