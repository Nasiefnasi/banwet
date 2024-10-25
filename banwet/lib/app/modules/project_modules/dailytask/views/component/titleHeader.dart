
// class TitileHeader extends StatelessWidget {
//   TitileHeader({super.key});
//   SelectedTaskController controller = Get.put(SelectedTaskController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 20.h,
//       width: dWidth,
//       decoration: BoxDecoration(
//           color: bColor,
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(25),
//               bottomRight: Radius.circular(25))),
//       child: Padding(
//         padding: const EdgeInsets.all(13),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                         onTap: () => Get.back(),
//                         child: const Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white,
//                         )),
//                     w2,
//                     Text(
//                       controller.selectedTaskModel?.title ?? "",
//                       style: wheader13.copyWith(),
//                     ),
//                     w3,
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 2),
//                       decoration: BoxDecoration(
//                           color: const Color(0xfff8f8f8),
//                           borderRadius: BorderRadius.circular(39)),
//                       child: Text(
//                         controller.selectedTaskModel?.taskStatus ?? "",
//                         style: header10.copyWith(
//                             color: controller.selectedTaskModel?.taskStatus ==
//                                     "Completed"
//                                 ? sucess
//                                 : controller.selectedTaskModel?.taskStatus ==
//                                         "InProgress"
//                                     ? inProgress
//                                     : pending),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             h1,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 28.0),
//               child: Text(
//                 controller.selectedTaskModel?.taskDescription ?? "",
//                 style: wheader10.copyWith(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
