import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googletranslate/bloc/google_bloc.dart';

import '../repositry/modelclass/Googlemodel.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

late Googlemodel google;

class _screen1State extends State<screen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 210,
                    color: Colors.white70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Container(
                              height: 50,
                              width: 210,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Type your text",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF65656B),
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BlocBuilder<GoogleBloc, GoogleState>(
                    builder: (context, state) {
                      if (state is GoogleLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is GoogleError) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            return BlocProvider.of<GoogleBloc>(context)
                                .add(FetchGoogle());
                          },
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height * .9,
                                // color: Colors.red,
                                child: const Center(
                                    child: Text('Oops something went wrong'))),
                          ),
                        );
                      }
                      if (state is GoogleLoaded) {
                        google =
                            BlocProvider.of<GoogleBloc>(context).googlemodel;
                        return Container(
                          height: 100,
                          width: 210,
                          color: Colors.red,
                          child: Text(
                            google.translatedText.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<GoogleBloc>(context).add(FetchGoogle());
                    },
                    child: Container(
                      height: 25,
                      width: 100,
                      color: Colors.white70,
                      child: Center(
                        child: Text(
                          "get",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
