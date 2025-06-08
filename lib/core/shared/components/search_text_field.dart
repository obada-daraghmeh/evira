import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/assets_const.dart';
import '../../controllers/search/search_bloc.dart';
import '../../utils/extensions/intl_extension.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
  final bool absorbing;
  final Function()? onTap;

  const SearchTextField({super.key, this.absorbing = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            absorbing: absorbing,
            child: CustomTextField(
              controller: TextEditingController(),
              hint: context.l10n.search,
              prefixIcon: AssetsConst.search,
              onChanged: (value) {
                context.read<SearchBloc>().add(SearchByTitle(title: value));
              },
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const CustomIcon(icon: AssetsConst.filter),
              onPressed: () => debugPrint('filter pressed'),
            ),
          ),
        ),
      ],
    );
  }
}
