import 'package:flutter/material.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color3,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                'SANTOS PANDESAL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              
              Spacer(flex: 1),

              Container(child: Image.asset('assets/images/Breads.png')),
              
              Spacer(flex: 1),

              Text(
                'THE TASTE OF FILIPINO PANDESAL', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Indulge in the authentic taste of freshly baked Pandesal since 1960, a beloved Filipino staple, right at your fingertips.', 
                style: TextStyle(
                  color: Colors.grey[200],
                  height: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Spacer(flex: 3),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/mainpage');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.color4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          height: 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              
                      const SizedBox(width: 10),
              
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )
              
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}