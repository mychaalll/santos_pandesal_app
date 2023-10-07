import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text(
                'ABOUT US',
                style: TextStyle(
                  color: AppColors.color3,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40,),
              Center(
                child: FaIcon(
                  FontAwesomeIcons.store,
                  size: 150,
                  color: AppColors.color2,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                '    Santos Hot Pandesal Bakery, located near Puregold Tayuman on Juan Luna St., is a go-to spot for mouthwatering hot pandesal that\'s available 24/7. Whether it\'s morning or midnight, locals and visitors can enjoy the delightful experience of freshly baked and delicious pandesal from this community-favorite bakery. \n\n    With its warm and inviting aroma filling the air, Santos Hot Pandesal Bakery has become a beloved hub where the community gathers to savor the simple joy of freshly baked bread any time of the day.',
                
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 12),
                  FaIcon(
                    FontAwesomeIcons.mobilePhone
                  ),
                  const SizedBox(width: 14),
                  Text(
                    '+639123456789',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.solidEnvelope
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'santos.pandesal@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.phone,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '02-123-4567',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              
            ],
          ),
        ),
      ),
    );
  }
}