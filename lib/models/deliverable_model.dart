enum DeliverableState { PENDIENTE, ESPERANDO_REVISION, RECHAZADO, COMPLETADO }

class Deliverable {
  int _id;
  String _name;
  String _description;
  DateTime _date;
  DeliverableState _state;
  int _projectId;
  String _developerMessage;

  Deliverable({
    int id = 0,
    String name = "",
    String description = "",
    DateTime? date,
    DeliverableState state=DeliverableState.PENDIENTE,
    int projectId = 0,
    String developerMessage = "",
  })  : _id = id,
        _name = name,
        _description = description,
        _date = date ?? DateTime.now(),
        _state=state,
        _projectId = projectId,
        _developerMessage = developerMessage;

  DeliverableState get state => _state;

  set state(DeliverableState value) {
    _state = value;
  }

  String get developerMessage => _developerMessage;

  set developerMessage(String value) {
    _developerMessage = value;
  }

  int get projectId => _projectId;

  set projectId(int value) {
    _projectId = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
