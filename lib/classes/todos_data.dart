class Todos{
  late String id;
  late dynamic title;
  late dynamic desc;
  late String? color;
  late bool? isDone;

  Todos({required this.id, required this.title, required this.desc, this.color, this.isDone=false});

  static List<Todos> todoList() {
    return [
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', isDone: true, color: 'red', id: '1'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', isDone: true, color: 'blue', id: '2'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '3'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '4'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '5'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '6'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '7'),
      Todos(title: 'Wash a car', desc: 'Wash a car tomorrow with hot water', id: '8'),
      Todos(title: 'Solivan car wash', desc: 'Wash a car tomorrow with hot water', id: '9'),
    ];
  }
}

List<String> priority = [
  'red',
  'orange',
  'blue',
];
