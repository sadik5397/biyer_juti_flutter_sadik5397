import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Container ProfileCard({required int index}) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20, offset: const Offset(0, 4))]),
    width: double.maxFinite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(12), child: CachedNetworkImage(imageUrl: "https://picsum.photos/400/410?random=$index", width: 144, height: 160, fit: BoxFit.cover)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("BJT 205011203", style: TextStyle(color: Color(0xff661010), fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 6),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xffB74242), shape: StadiumBorder(), elevation: 0),
                onPressed: () {},
                child: Row(children: [
                  Padding(padding: const EdgeInsets.only(right: 8), child: Icon(Icons.favorite_border_rounded, size: 18)),
                  Text("Give Heart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                ])),
            SizedBox(height: 9),
            Text("Service Holder", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.normal, fontSize: 15)),
            SizedBox(height: 6),
            Text("Religion: Islam; Sunni", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.normal, fontSize: 15)),
            SizedBox(height: 6),
            Text("View Full Profile", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.bold, fontSize: 15, decoration: TextDecoration.underline)),
          ],
        )
      ],
    ),
  );
}
//
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// ElevatedButton ProfileCard({required int index}) {
//   return ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.all(16),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         shadowColor: Colors.redAccent,
//         splashFactory: InkRipple.splashFactory,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
//     // padding:
//     // margin: const EdgeInsets.only(bottom: 20),
//     // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20, offset: const Offset(0, 4))]),
//     // width: double.maxFinite,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ClipRRect(borderRadius: BorderRadius.circular(12), child: CachedNetworkImage(imageUrl: "https://picsum.photos/400/400?random=$index", width: 144, height: 160, fit: BoxFit.cover)),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text("BJT 205011203", style: TextStyle(color: Color(0xff661010), fontWeight: FontWeight.bold, fontSize: 18)),
//             SizedBox(height: 6),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Color(0xffB74242), shape: StadiumBorder(), elevation: 0),
//                 onPressed: () {},
//                 child: Row(children: [
//                   Padding(padding: const EdgeInsets.only(right: 8), child: Icon(Icons.favorite_border_rounded, size: 18)),
//                   Text("Give Heart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
//                 ])),
//             SizedBox(height: 9),
//             Text("Service Holder", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.normal, fontSize: 15)),
//             SizedBox(height: 6),
//             Text("Religion: Islam; Sunni", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.normal, fontSize: 15)),
//             SizedBox(height: 6),
//             Text("View Full Profile", style: TextStyle(color: Color(0xffB74242), fontWeight: FontWeight.bold, fontSize: 15, decoration: TextDecoration.underline)),
//           ],
//         )
//       ],
//     ),
//   );
// }
