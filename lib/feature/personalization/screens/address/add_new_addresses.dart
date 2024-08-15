import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: OAppBar(showBackArrow: true,title: Text('Add new Address'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(OSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),labelText: 'Name',

                  ),
                ),
                SizedBox(height: OSizes.spaceBtwInputFields,), TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number',

                  ),
                ),
                SizedBox(height: OSizes.spaceBtwInputFields,),
                Row(
                  children: [
                     Expanded(
                       child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),labelText: 'Street',
                       
                        ),
                                           ),
                     ),
                    SizedBox(width: OSizes.spaceBtwInputFields,), 
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),labelText: 'Postal',
                      
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: OSizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),labelText: 'City',

                        ),
                      ),
                    ),
                    SizedBox(width: OSizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),labelText: 'State',

                        ),
                      ),
                    ),


                  ],
                ),
                SizedBox(height: OSizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),labelText: 'Country',

                  ),
                ),
                SizedBox(height: OSizes.defaultSpace,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {  }, child: const Text('save'),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}