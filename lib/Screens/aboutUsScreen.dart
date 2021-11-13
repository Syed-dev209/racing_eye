import 'package:flutter/material.dart';
import 'package:racing_eye/Screens/Components/customWhiteAppBar.dart';
import 'package:racing_eye/main.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

// YsK63zCE6tjb
class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.98,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                CustomWhiteAppBar(
                  headerText: "About us",
                  showTrailing: false,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: myColor.shade50),
                  ),
                ),
                Text(
                  "Since the Shadwell Estate in Norfolk was acquired on the instructions of "
                  "His Highness Sheikh Hamdan bin Rashid Al Maktoum in 1984, the operation has become a byword for "
                  "breeding excellence. The Nunnery Stud celebrated its 30th anniversary in 2019.",
                  style: TextStyle(fontSize: 17, color: Colors.black26),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    "Shadwell Racing",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: myColor.shade50),
                  ),
                ),
                Text(
                  "Horses have been running successfully in the illustrious blue and white colours of Sheikh Hamdan since 1980.",
                  style: TextStyle(fontSize: 19, color: Colors.black26),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "They include some of the brightest stars of the turf over the last four decades: from Classic winners such as NASHWAN, SALSABIL and TAGHROODA, "
                  "the great sprinters DAYJUR and MUHAARAR and international stars "
                  "INVASOR, JEUNE and SOFT FALLING RAIN, right up to the brilliantly fast BATTAASH.",
                  style: TextStyle(fontSize: 17, color: Colors.black26),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Sustainability",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: myColor.shade50),
                  ),
                ),
                Text(
                  "As with all other areas of our work, we make every effort to maintain and enhance the environment in which we operate.",
                  style: TextStyle(fontSize: 19, color: Colors.black26),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "The Estate covers approximately 2400Ha. Bordered to the South by the River Little Ouse, the "
                  "Northern boundary is formed partly by the River Thet and partly by the A11. "
                  "Eastern and Western boundaries are the Peddars Way (heritage walking route) and the town of Thetford itself.",
                  style: TextStyle(fontSize: 17, color: Colors.black26),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Social Responsibility ",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: myColor.shade50),
                  ),
                ),
                Text(
                  "Shadwell abides by a set of principles designed to promote our investment in employees, the environment and the local community in which we operate.                ",
                  style: TextStyle(fontSize: 19, color: Colors.black26),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Our Charities Committee welcomes applications in particular from organisations and individuals in the areas "
                  "local to Thetford, Newmarket, Elmswell and Kettlebaston in East Anglia.  We also focus our support on equine and agricultural projects and particularly "
                  "those that involve younger generations and have their roots in educating and training young people.Applications to the Charities Committee should be made in writing and "
                  "will be considered at one of the committee’s quarterly meetings.",
                  style: TextStyle(fontSize: 17, color: Colors.black26),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Aftercare",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: myColor.shade50),
                  ),
                ),
                Text(
                  "Shadwell takes its responsibility to its former charges very seriously. Many of our retired horses are rehomed by Fred and Rowena Cook and can be found rewarding new roles in pursuits such as dressage and eventing, or even as riding horses. Click below for more details on Fred and Rowena Cook                ",
                  style: TextStyle(fontSize: 19, color: Colors.black26),
                ),
                SizedBox(
                  height: 8,
                ),
                // Text(
                //               //   "Our Charities Committee welcomes applications in particular from organisations and individuals in the areas "
                //               //   "local to Thetford, Newmarket, Elmswell and Kettlebaston in East Anglia.  We also focus our support on equine and agricultural projects and particularly "
                //               //   "those that involve younger generations and have their roots in educating and training young people.Applications to the Charities Committee should be made in writing and "
                //               //   "will be considered at one of the committee’s quarterly meetings.",
                //               //   style: TextStyle(fontSize: 17, color: Colors.black26),
                //               // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
