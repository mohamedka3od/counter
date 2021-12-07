
import 'package:counter/modules/cubit/cubit.dart';
import 'package:counter/modules/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state){
          final bottomRadius = MediaQuery.of(context).size.width>MediaQuery.of(context).size.height?MediaQuery.of(context).size.height-40:MediaQuery.of(context).size.width-40;

          return Scaffold(
            appBar:AppBar(
              title: const Text("counter"),
            ) ,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          onPressed: (){
                            CounterCubit.get(context).reset();
                          },
                          icon: const CircleAvatar(
                            radius: 50,
                            child: Text(
                              "R",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.blue,
                          iconSize: 50,
                          padding: const EdgeInsets.all(0),

                        ),
                      ),
                      SizedBox(

                        height: bottomRadius,
                        width: bottomRadius,
                        child: FloatingActionButton(
                         child:Text( '${CounterCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),),
                          onPressed: () {
                           CounterCubit.get(context).plus();

                          },
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: IconButton(
                          onPressed: (){
                            CounterCubit.get(context).minus();
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                          ),
                          padding: const EdgeInsets.all(0),
                          color: Colors.blue,
                          iconSize: 50,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
