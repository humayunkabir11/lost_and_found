import 'package:flutter/material.dart';


class InnerAppBar extends StatelessWidget {
  const InnerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
              },
              child: Icon(Icons.person_outline)
            ),
            SizedBox(width: 5,),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              // child: SvgPicture.asset(AppIcons.avater),
            ),
            SizedBox(width: 5),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Humayun Kabir",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  // color: AppColors.blackPrimary,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  // child: SvgPicture.asset(AppIcons.phone),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
