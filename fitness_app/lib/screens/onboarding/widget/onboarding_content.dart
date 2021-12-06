// import 'package:fitness_app/core/const/data_constants.dart';
// import 'package:fitness_app/screens/onboarding/bloc/onboarding_bloc.dart';
// import 'package:flutter/cupertino.dart';
//
// class OnboardingContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<OnboardingBloc>(context);
//     return SafeArea(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             flex: 4,
//             child: _createPageView(bloc.pageController, bloc),
//           ),
//           Expanded(
//             flex: 2,
//             child: _createStatic(bloc),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _createPageView(PageController controller, OnboardingBloc bloc) {
//     return PageView(
//       scrollDirection: Axis.horizontal,
//       controller: controller,
//       children: DataConstants.onboardingTiles,
//       onPageChanged: (index) {
//         bloc.add(PageSwipedEvent(index: index));
//       },
//     );
//   }
// }