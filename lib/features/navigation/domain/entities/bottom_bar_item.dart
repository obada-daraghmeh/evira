import 'package:equatable/equatable.dart';

class BottomBarItem extends Equatable {
  final String label;
  final String icon;
  final String activeIcon;

  const BottomBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  @override
  List<Object?> get props => [label, icon, activeIcon];
}
