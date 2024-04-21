

// import 'package:assessment_application_1/util.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   DateTime today = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Container(height: double.infinity,width: 300,

//           child: Column(
//             children: [
              
//               const CircleAvatar(backgroundImage: AssetImage("assets/logo/logo.png"),
//               radius: 100,
//               ),
//               Container(
//                 height: 40,
//                 width: 140,
                
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 40, 182, 214),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: const Row(
//                   children: [
//                     SizedBox(width: 10,),
//                     Icon(Icons.home,color: Colors.white,),
//                     SizedBox(width: 15,),
//                     Text("Dashboard",style: TextStyle(color: Colors.white),)
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               const Mainitems(icon: Icons.airplane_ticket_outlined, label: "Tickets"),
//               const SizedBox(height: 10,),
//               const Mainitems(icon: Icons.favorite_border_outlined, label: "Favorite"),
//               const SizedBox(height: 10,),
//               const Mainitems(icon: Icons.rectangle_outlined, label: "Discover"),
//               const SizedBox(height: 10,),
//               const Mainitems(icon: Icons.payment_outlined, label: "Payments"),
//               const SizedBox(height: 10,),
//               const Mainitems(icon: Icons.settings, label: "Settings"),
//               const SizedBox(height: 150,),
//               const Mainitems(icon: Icons.logout_outlined, label: "Log out")
              
//             ],
//           ),
          
          
//           ),

//           //Container 2
//           Container(height: double.infinity,width: 830,
//           color: Colors.grey.shade200,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 12,left: 130),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 500,
//                       padding: const EdgeInsets.all(16),
//                       child: const SearchBar(
//                         textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 12)),
//                         hintText: "Search...",
//                         leading: Icon(Icons.search),
//                         constraints: BoxConstraints(),
//                         backgroundColor: MaterialStatePropertyAll(Colors.white),
//                         shadowColor: MaterialStatePropertyAll(Colors.white),
//                         surfaceTintColor: MaterialStatePropertyAll(Colors.white),
//                         overlayColor: MaterialStatePropertyAll(Colors.white),
//                         side: MaterialStatePropertyAll(BorderSide(width: 0,color: Colors.white)),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     const CircleAvatar(backgroundColor:  Color.fromARGB(255, 40, 182, 214),
//                     radius: 15,
//                     child: Icon(Icons.tune,color: Colors.white,),)
//                   ],
//                 ),
//                 const SizedBox(height: 10,),
//                 Row(
//                   children: [
//                     Container(height: 40,width: 40, 
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
                    
//                     ),
//                     child: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_left))
//                     ),
//                     const SizedBox(width: 10,),
//                     Text("Canada  ",style:TextStyle(color: Colors.grey.shade600) ,),
//                     const Text("/ The wild nature",style: TextStyle(fontWeight: FontWeight.w600),),
//                     const SizedBox(width: 280,),
//                     IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_left)),
//                     const SizedBox(width: 10,),
//                     IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right)),
                    
//                   ],
//                 ),
//                 const SizedBox(height: 10,),
//                 Row(
//                   children: [
//                     Stack(children: [
//                       Container(height: 250,width: 300,
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(15),
//                       image: const DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1704026438467-74f51e7a7615?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),fit: BoxFit.fill)
                      
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 260,top: 10),
//                       child: Container(
//                         height: 25,width: 25,child: Icon(Icons.favorite,color: Colors.red,size: 18,),
//                         decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 180,left: 50),
//                       child: Container(
//                         height: 60,
//                         width: 200,
                        
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Image.network("https://images.unsplash.com/photo-1704026438467-74f51e7a7615?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            
//                             height: 75, width: 60,
//                             ),
//                             SizedBox(width: 3,),
//                             Image.network("https://images.unsplash.com/photo-1704026438467-74f51e7a7615?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//                             height: 75, width: 60,
//                             ),
//                             SizedBox(width: 3,),
//                             Image.network("https://images.unsplash.com/photo-1704026438467-74f51e7a7615?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//                             height: 75, width: 60,
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(color: Colors.white30,borderRadius: BorderRadius.circular(15)),
//                       ),
//                     )
//                     ],),
//                     const SizedBox(width: 20,),
//                     Container(height: 266,width: 300,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Moraine Lake",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
//                         Row(
//                           children: [
//                             Icon(Icons.location_on_outlined,color: Colors.grey.shade400,),
//                             const Text("Canada,Yukon State", style: TextStyle(fontWeight: FontWeight.w100,color: Colors.black54),)
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         const Text("This progarm buids upon the experience of Yale faculty and ELT's extensive training experience ...",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 14,color: Colors.black87),),

//                         const SizedBox(height: 15,),
//                         Container(height: 40,width: 280,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)

//                         ),
//                         child: const Row(
//                           children: [
//                             SizedBox(width: 10,),
//                             Icon(Icons.hourglass_bottom,color: Colors.yellow,),
//                             SizedBox(width: 15,),
//                             Text("120 hours",
//                             style: TextStyle(fontSize: 12),),
//                             SizedBox(width: 15,),
//                             Text("5 nights",style: TextStyle(fontSize: 12),),
//                             SizedBox(width: 15,),
//                             Text("Only nature",style: TextStyle(fontSize: 12),)
//                           ],
//                         ),
//                         ),
//                         Row(
//                           children: [
//                             const Column(
//                               children: [
//                                 SizedBox(height: 20,),
//                                 Text("Price",style: TextStyle(color: Colors.black54),),
//                                 SizedBox(height: 5,),
//                                 Text("    \$1300",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
//                               ],
//                             ),

//                             const SizedBox(width: 100,),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 35),
//                               child: TextButton(onPressed: (){}, child: const Text("Book Travel"),style: const ButtonStyle(
//                                 foregroundColor: MaterialStatePropertyAll(Colors.white),
//                                 backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 40, 182, 214),)
//                               ),),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 15,),
//                 Row(
//                   children: [
//                     Text("Popular places" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
//                     SizedBox(width: 420,),
//                     Text("Show all  →",style: TextStyle(color: Colors.black54,fontSize: 14),)
//                   ],
//                 ),
//                 SizedBox(height: 15,),

//                 Container(
//                   height: 270,width: 700,
//                   child: Row(
//                     children: [
//                       SizedBox(width: 20,),
//                       PopularImages(placename: "Maraine Lake", country: "Canada", rating: "4.5"),
//                       SizedBox(width: 20,),
//                       PopularImages(placename: "Netherlands Travel Tour", country: "Netherlands", rating: "4.6"),
//                       SizedBox(width: 20,),
//                       PopularImages(placename: "Ozert Lake", country: "Poland", rating: "4.4"),
//                       SizedBox(width: 20,),
//                     ],
//                   ),
//                 )

                
//               ],
//             ),
//           ),
//           ),

//           // Container 3


//           Container(height: double.infinity,width: 400,color: Colors.grey.shade200,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 60,),
//                     Icon(Icons.location_on_outlined,color: Colors.grey.shade400,),
//                     const SizedBox(width: 10,),
//                     Text("Your Location",style: TextStyle(color: Colors.grey.shade400),),
//                     const SizedBox(width: 30,),
//                     Icon(Icons.alarm_add_rounded,color: Colors.grey.shade400,),
//                     const SizedBox(width: 30,),
//                     const CircleAvatar(
//                       backgroundImage: NetworkImage("https://images.unsplash.com/photo-1613323593608-abc90fec84ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
//                       radius: 15,
//                     ),
                  
                    
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Container(
//                 height: 340,
//                 width: 340,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12)
                    
//                   )
//                 ),
//                 child: TableCalendar(focusedDay: today, firstDay: DateTime.utc(2023), lastDay: DateTime.utc(2030)),
//               ),
//               const SizedBox(height: 3,),
//               Container(
//                 height: 320,
//                 width: 340,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12)
//                   )
//                 ),
//                 child: const SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 25,top: 15),
//                         child: Text("My Destinations",style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                           ),
//                       ),
//                       SizedBox(height: 10,),
//                       ScrollList(),
//                       SizedBox(height: 10,),
//                       ScrollList(),
//                       SizedBox(height: 10,),
//                       ScrollList(),
//                       SizedBox(height: 10,),
//                       ScrollList()
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           )
//         ],
//       ),
//     );
//   }
// }


