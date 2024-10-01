
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
         debugShowCheckedModeBanner: false,
         home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State createState()=> _QuizApp();
}
class _QuizApp extends State{
  
  List<Map> allQ = [
      {
        "question":"Who is the founder of Microsoft",
        "opts":["Bill Gates","Steve Jobs","Elon Musk","Larry Page"],
        "correct":0
      },
      {
        "question":"Who is the founder of Google",
        "opts":["Bill Gates","Steve Jobs","Elon Musk","Larry Page"],
        "correct":3
      },
      {
        "question":"Who is the founder of SpaceX",
        "opts":["Bill Gates","Steve Jobs","Elon Musk","Larry Page"],
        "correct":2
      },
      {
        "question":"Who is the founder of Apple",
        "opts":["Bill Gates","Steve Jobs","Elon Musk","Larry Page"],
        "correct":1
      },
      {
        "question":"Who is the founder of FaceBook",
        "opts":["Bill Gates","Steve Jobs","Mark ZukerBurg","Larry Page"],
        "correct":2
      },
  ];
  bool isQuiz=true;
  int score=0;
  int Qn=0;
  int select=-1;
  bool f=true;
  WidgetStatePropertyAll<Color?> checkanswer (int ans){

   
    if(select != -1 ){
     
        if(ans == allQ[Qn]["correct"]){
          return const WidgetStatePropertyAll(Colors.green);
        }else if(ans == select){
          return const WidgetStatePropertyAll(Colors.red);
        }else{
          return const WidgetStatePropertyAll(null);
        }
    }else{
      return const WidgetStatePropertyAll(null);
    }
    
  }
  @override 
  Widget build(BuildContext context){
    return decide();
  }

  Scaffold decide(){
    if(isQuiz){
      return Scaffold(
        appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: const Text("Quiz App",
              style: TextStyle( 
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.red,),),
        ),
        body: Column(
              children: [
               const  SizedBox(
                  height: 30,
                ),
                Row(children: [
                  const SizedBox(width: 100,),
                  Text("Question :${Qn+1} / ${allQ.length}",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple,
                     ))
                ],),

                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  height:50,
                  child: Text("   ${allQ[Qn]["question"]}",
                  style: const TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.w600,
                    ),
                  ),      
                ),
                const SizedBox(
                  height: 30,
                 ),
                SizedBox(
                   width: 400,
                   height:50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                          
                          backgroundColor: checkanswer(0),
                    ),
                    
                   onPressed: (){
                    select=0;
                    if(f){
                        setState(() {});
                         f=false;
                    }
                   },
                  
                   child: Text(
                    allQ[Qn]["opts"][0],
                    style: const TextStyle(
                      
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    
                    ),
                   ),
                   )

                   ,const SizedBox(
                  height: 30,
                 ),
                SizedBox(
                   width: 400,
                   height:50,
                  child: ElevatedButton(
                   style: ButtonStyle(
                          
                    backgroundColor: checkanswer(1),
                    ),
                    
                   onPressed: (){
                    select=1;
                    
                    if(f){
                        setState(() {});
                         f=false;
                    }
                   
                    
                   },
                   child: Text(
                    allQ[Qn]["opts"][1],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                   ),
                   )

                   ,const SizedBox(
                  height: 30,
                 ),
                SizedBox(
                   width: 400,
                   height:50,
                  child: ElevatedButton(
                   style: ButtonStyle(
                      backgroundColor: checkanswer(2),
                    ),
                    
                   onPressed: (){
                    select=2;
                    if(f){
                        setState(() {});
                         f=false;
                    }
                   },
                   child: Text(
                    allQ[Qn]["opts"][2],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                   ),
                   )

                  , const SizedBox(
                  height: 30,
                 ),
                SizedBox(
                   width: 400,
                   height:50,
                  child: ElevatedButton(
                   style: ButtonStyle(
                      backgroundColor: checkanswer(3),
                    ),
                    
                   onPressed: (){
                    select=3;
                    if(f){
                        setState(() {});
                         f=false;
                    }
                   },
                   child: Text(
                    allQ[Qn]["opts"][3],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                   ),
                   )

                  
        ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed:(){
            f=true;
            if(select!= -1){
              if(select == allQ[Qn]["correct"]){
                score++;
              }
              if(Qn< allQ.length-1){
                Qn++;
                select=-1;
                
              }else{
                isQuiz=false;
              }
              

            }
           
            setState(() {
              
            });
          }
           ,
           backgroundColor: Colors.blue,
        child: const Icon(
          Icons.forward,
          size:40 ,
          color: Colors.orange,),)
      );
    }else{
      return Scaffold(appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: const Text("Result",
              style: TextStyle( 
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.red,),),
        ),
       body: Center(
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Image.network(
                      // "https://imgcdn.stablediffusionweb.com/2024/3/21/61dbe027-3f86-45f7-94f5-1bcd7dea54dc.jpg"
                      // "https://media.giphy.com/media/RzNBbh3vF7Q41oLIE9/giphy.gif?cid=790b76119bemxr1caig3r1qrk6czj4mk7p4jmrol6ijanqla&ep=v1_gifs_search&rid=giphy.gif&ct=g",
                       "https://cdn.dribbble.com/users/1265653/screenshots/17454998/media/3a31d74e4310b03f3fe05a5d045a9658.gif",
                        height: 300,
                        width:500,
                         ),
                        const SizedBox(height: 30),
                        const Text("Congratulations",
                               style: TextStyle(
                                     fontSize: 30,
                                     fontWeight: FontWeight.w900,
                                     color: Colors.orange,
                                ),
                        ),
                    const SizedBox(height: 30),
                     Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(border: Border.all(
                                color: Colors.orange, 
                                 width: 3.0,

                     ),),

                       child: Center(
                         child: Text("  Score: $score / ${allQ.length}  "
                         ,style:const  TextStyle(color: Colors.green,
                         fontSize:25 ,
                         fontWeight: FontWeight.w500),),
                       ),
                     ),
                    
        

          const SizedBox(height:60),
            
             
             ElevatedButton(onPressed:(){
                         isQuiz=true;
                         Qn=0;
                         select=-1;
                         score=0;
                         setState(() {});
                         
                 } ,
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                 child: const Text("Restart",
                 style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),
                 
                 ),       
         ],
         )
         
        ),
       
        );
    }
  }
}