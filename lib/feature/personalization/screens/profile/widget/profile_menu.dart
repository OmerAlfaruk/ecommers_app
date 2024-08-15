import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.title, required this.value, required this.onPressed, required this.icon,
  });
final String title,value;
final VoidCallback onPressed;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex:3,child: Text(title,style: Theme.of(context).textTheme.bodySmall,),),
        Expanded(flex:5,child: Text(value,style: Theme.of(context).textTheme.bodyMedium,),),
        Expanded(child: IconButton( onPressed: onPressed, icon: Icon(icon,size: 18,),))

      ],
    );
  }
}