import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';
class TodaysEducationTable extends StatelessWidget {

  final String title;
  final String location;
  final String educationTime;
  final String name;
  final String forWho;

  const TodaysEducationTable({Key? key,
    required this.title,
    required this.location,
    required this.educationTime,
    required this.name,
    required this.forWho,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: AppColors.tableColorGray,
                                  child: Center(child: Text("교육제목",style: BeitTextStyle.t2,)),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(title),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: AppColors.tableColorGray,
                                  child: Center(child: Text("교육제목",style: BeitTextStyle.t2,)),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(location),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: AppColors.tableColorGray,
                                  child: Center(child: Text("교육제목",style: BeitTextStyle.t2,)),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(educationTime),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: AppColors.tableColorGray,
                                  child: Center(child: Text("교육제목",style: BeitTextStyle.t2,)),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(name),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: AppColors.tableColorGray,
                                  child: Center(child: Text("교육제목",style: BeitTextStyle.t2,)),
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(forWho),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
      flex: 6,
    );
  }
}
