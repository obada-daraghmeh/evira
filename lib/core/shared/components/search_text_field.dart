import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/presentation/bloc/search_bloc.dart';
import '../../constants/assets_const.dart';
import '../../utils/extensions/intl_extension.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
  final bool absorbing;
  final Function()? onTap;

  const SearchTextField({super.key, this.absorbing = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: absorbing,
        child: CustomTextField(
          controller: TextEditingController(),
          hint: context.l10n.search,
          prefixIcon: AssetsConst.search,
          suffixIcon: CustomIcon(icon: AssetsConst.filter),
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchByTitle(title: value));
          },
        ),
      ),
    );
  }
}
