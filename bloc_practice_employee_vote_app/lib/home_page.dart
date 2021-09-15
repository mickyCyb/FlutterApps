import 'dart:ffi';

import 'package:flutter/material.dart';
import 'employee.dart';
import 'employee_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Rate App'),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Container(
                        padding: EdgeInsets.all(20),
                        child:  Text(
                          '${snapshot.data![index].id}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data![index].name}',
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                            Text(
                              '\$ ${snapshot.data![index].salary}',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: (){
                            _employeeBloc.employeeSalaryIncrement.add(snapshot.data![index]);
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: (){
                            _employeeBloc.employeeSalaryDecrement.add(snapshot.data![index]);
                          },
                        ),
                      ),
                    ]),
                );
              }
            );
          }
        ),
      ),
    );
  }
}