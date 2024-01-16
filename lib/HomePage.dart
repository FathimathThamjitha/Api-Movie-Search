import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/MainProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    MainProvider provider=Provider.of<MainProvider>(context,listen: false );

    return SafeArea(
            child:Scaffold(
                backgroundColor: Colors.black12,
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Consumer<MainProvider>(
                            builder: (context1, value, child) {
                              return Column(
                                children: [
                                  TextFormField(
                                    controller: value.MovienameController,
                                    decoration: const InputDecoration(
                                      suffix: Icon(Icons.search),

                                      isDense: true,
                                      hintText: 'MOVIE NAME',
                                      // hintStyle: GoogleFonts.karma(textStyle:
                                      hintStyle: TextStyle(color: Colors.grey,),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      filled: true,
                                      fillColor: Colors.white54,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xff668698))),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xff668698))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xff668698))),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  MaterialButton(
                                      onPressed: ()
                                      {
                                        value.page = 1;
                                        {provider.getApi(value.MovienameController.text,value.page);}
                                        //print(value.api_picList);
                                      },

                                      child: Text("SEARCH",style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              );
                            }
                        ),
                        Consumer<MainProvider>(
                            builder: (context2, value, child) {
                              return SizedBox(
                                  height: height/1.5,
                                  child: value.Movielist.isNotEmpty?
                                  GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 3
                                      ),
                                      itemCount: value.Movielist.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return
                                          Card(
                                            //color: Colors.blueGrey,
                                            child: value.Movielist[index].Photo != "null" ?
                                            Image.network("https://image.tmdb.org/t/p/w780${value.Movielist[index].Photo}",fit: BoxFit.fill,):
                                            Icon(Icons.camera_alt_outlined),
                                          );

                                      }
                                  ): SizedBox()
                              );
                            }
                        ),
                        SizedBox(height: 10,),
                        Consumer<MainProvider>(
                            builder: (context3, value, child) {
                              return value.Movielist.isNotEmpty?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: ()
                                      {
                                        if(value.page>0)

                                        {
                                          provider.page--;
                                          provider.getApi(value.MovienameController.text, value.page);}
                                        //print(value.api_picList);
                                      },
                                      child: Text("BACK",style: TextStyle(color: Colors.white)),color: Colors.grey
                                  ),
                                  SizedBox(width: 10,),
                                  MaterialButton(
                                      onPressed: ()
                                      {
                                        print("page = ${value.page}");
                                        value.page++;
                                        provider.getApi(value.MovienameController.text,value.page);
                                        //print(value.api_picList);
                                      },
                                      child: Text("NEXT",style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ): SizedBox();
                            }
                        )
                      ],
                    ),
                  ),
                ),
                ),
            );
  }
}




