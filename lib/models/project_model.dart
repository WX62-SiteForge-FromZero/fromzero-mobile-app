enum ProjectType {
  Landing_page,
  Aplicacion_web,
  Aplicacion_de_escritorio,
  Aplicacion_movil
}

enum Languages { Javascript, Typescript, HTML, CSS }

enum Frameworks { Vue_Js, Angular, React }

class Methodology {
  String name;
  String description;

  Methodology(this.name, this.description);
}

enum Currency { PEN, USD }

class CreateProjectData {
  String _name;
  String _description;
  ProjectType _type;
  List<Languages> _languages;
  List<Frameworks> _frameworks;
  double _budget;
  Currency _currency;
  List<Methodology> _methodologies;

  CreateProjectData(
      {String name = "",
      String description = "",
      ProjectType type = ProjectType.Landing_page,
      List<Languages>? languages,
      List<Frameworks>? frameworks,
      double budget = 0.0,
      Currency currency = Currency.PEN,
      List<Methodology>? methodologies})
      : _name = name,
        _description = description,
        _type = type,
        _languages = languages ?? [],
        _frameworks = frameworks ?? [],
        _budget = budget,
        _currency = currency,
        _methodologies = methodologies ?? [];

  List<Methodology> get methodologies => _methodologies;

  set methodologies(List<Methodology> value) {
    _methodologies = value;
  }

  Currency get currency => _currency;

  set currency(Currency value) {
    _currency = value;
  }

  double get budget => _budget;

  set budget(double value) {
    _budget = value;
  }

  List<Frameworks> get frameworks => _frameworks;

  set frameworks(List<Frameworks> value) {
    _frameworks = value;
  }

  List<Languages> get languages => _languages;

  set languages(List<Languages> value) {
    _languages = value;
  }

  ProjectType get type => _type;

  set type(ProjectType value) {
    _type = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
