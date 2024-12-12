void main(){

  Person jose = new Person(name: 'Jose', age: 23, height: 1.60);
  print(jose.name);

}

class Person {

  String name;
  int age;
  double height;
  
  Person({

    required this.name,
    required this.age,
    required this.height

  });

}

