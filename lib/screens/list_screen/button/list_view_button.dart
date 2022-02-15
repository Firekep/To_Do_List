import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class ListViewButton extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onPressedInfo;
  final void Function() onPressedDelete;
  final void Function() onPressedShowContent;

  const ListViewButton({
    Key? key,
    required this.onPressed,
    required this.onPressedInfo,
    required this.onPressedDelete,
    required this.onPressedShowContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HawkFabMenu(
      icon: AnimatedIcons.menu_arrow,
      fabColor: Theme.of(context).shadowColor,
      iconColor: Colors.white,
      blur: 0,
      backgroundColor: Colors.transparent,
      items: [
        HawkFabMenuItem(
          label: 'Add',
          ontap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            onPressed();
          },
          icon: const Icon(Icons.add),
          labelColor: Colors.black,
          labelBackgroundColor: Colors.white,
          color: Theme.of(context).backgroundColor,
        ),
        HawkFabMenuItem(
          label: 'info',
          ontap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            onPressedInfo();
          },
          icon: const Icon(Icons.info_outline),
          color: Theme.of(context).backgroundColor,
          labelColor: Colors.black,
          labelBackgroundColor: Colors.white,
        ),
        HawkFabMenuItem(
          label: 'Remove',
          labelColor: Colors.black,
          labelBackgroundColor: Colors.white,
          color: Theme.of(context).backgroundColor,
          ontap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            onPressedDelete();
          },
          icon: const Icon(Icons.delete_outline),
        ),
        HawkFabMenuItem(
          label: 'Show Content',
          labelColor: Colors.black,
          labelBackgroundColor: Colors.white,
          color: Theme.of(context).backgroundColor,
          ontap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            onPressedShowContent();
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
        ),
      ],
      body: const Center(
        child: Text(''),
      ),
    );
  }
}
