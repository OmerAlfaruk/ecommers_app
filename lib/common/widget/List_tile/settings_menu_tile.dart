import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.icon, required this.title, required this.subTitle, this.trailing, this.onTap});
 final IconData icon;
 final String title,subTitle;
 final Widget? trailing;
 final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onTap,
      leading: Icon(icon,size: 20,color: OAppColor.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: trailing,
    );
  }
}
