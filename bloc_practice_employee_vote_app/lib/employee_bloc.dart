import 'dart:async';
import 'employee.dart';

class EmployeeBloc{

  List<Employee> _employeeList = [
    Employee(1, 'Emp One', 1000),
    Employee(2, 'Emp Two', 3000),
    Employee(3, 'Emp Three', 3000),
    Employee(4, 'Emp Four', 4000),
    Employee(5, 'Emp Five', 5000),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();

  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

    
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20/100;

    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
    
  }
  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20/100;

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
  }

}



  