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
      Todos(title: 'Todo list project', desc: 'Finish up my Todo list project by tomorrow', isDone: true, color: 'blue', id: '2'),
    ];
  }
}

List<String> priority = [
  'red',
  'orange',
  'blue',
];
