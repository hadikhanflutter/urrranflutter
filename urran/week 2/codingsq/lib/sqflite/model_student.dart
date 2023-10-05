class ModelStudent {
  int id;
  String name;

  ModelStudent({required this.id, required this.name});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory ModelStudent.ModelobjectFromMap(Map<String, dynamic> map_value) {
    ModelStudent mm =
        ModelStudent(id: map_value['id'], name: map_value['name']);
    return mm;
  }
}

class ModelUser {
  ModelStudent mm = ModelStudent(id: 1, name: 'hadi');
}
