import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/widgets/custom_todays_education_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodaysEducation extends StatefulWidget {
  const TodaysEducation({Key? key}) : super(key: key);

  @override
  State<TodaysEducation> createState() => _TodaysEducationState();
}

class _TodaysEducationState extends State<TodaysEducation> {

  TodaysEducationController todaysEducationController = Get.put(TodaysEducationController());
  var count = 0;
  bool nfcTagged = false;

  @override
  void initState(){
    super.initState();
    getEducation();
  }

  getEducation() async{
    var result = await Repository.getTodaysEducation();
    result['rsMap'].forEach((el){
      TodaysEducationObject todaysEducationObject = TodaysEducationObject(el['education_title'], el['educator_area'], el['education_start_time'], el['educator_name'], el['education_target']);
      todaysEducationController.todaysEducation.add(todaysEducationObject);
      todaysEducationController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("금일교육"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: GetBuilder<TodaysEducationController>(
          builder: (_){
            return (todaysEducationController.todaysEducation.isEmpty) ? Text("loading..."):
            Column(
              children: [
                Flexible(
                  child: Container(
                    height: double.infinity,
                    child: Center(
                        child: Text(
                          "NFC 태킹을 통해 교육이수를 완료해주세요.",
                          style: BeitTextStyle.t2,
                        )),
                  ),
                  flex: 2,
                ),
                TodaysEducationTable(
                    title: todaysEducationController.todaysEducation[count].title  ?? "널",
                    location: todaysEducationController.todaysEducation[count].location  ?? "널",
                    educationTime: todaysEducationController.todaysEducation[count].educationTime  ?? "널",
                    name: todaysEducationController.todaysEducation[count].name  ?? "널",
                    forWho: todaysEducationController.todaysEducation[count].forWho  ?? "널"),
                Flexible(
                  child: Container(
                    height: double.infinity,
                    child: (count == todaysEducationController.todaysEducation.length-1) ?
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(30),
                      child: ElevatedButton(
                          onPressed: (){
                            if(!nfcTagged){
                              Get.defaultDialog(title: '!', middleText: 'NFC 태킹을 통해 교육이수를 완료 후\n버튼을 눌러주세요');
                            }
                          },
                          child: Text("금일교육완료"),
                          style: beitButtonStyle.green,)
                    ) :
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(count > 0){
                              setState(() {
                                count-=1;
                              });
                            }
                          },
                          child: Text("이전페이지"),
                          style: beitButtonStyle.green,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "${count+1}/${todaysEducationController.todaysEducation.length}",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if(count < todaysEducationController.todaysEducation.length-1){
                              setState(() {
                                count+=1;
                              });
                            }
                          },
                          child: Text("다음페이지"),
                          style: beitButtonStyle.green,
                        )
                      ],
                    ),
                  ),
                  flex: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TodaysEducationController extends GetxController{
  var todaysEducation = List<dynamic>.empty(growable: true);
}
class TodaysEducationObject{
  String? title;
  String? location;
  String? educationTime;
  String? name;
  String? forWho;

  TodaysEducationObject(this.title, this.location, this.educationTime, this.name, this.forWho);
}