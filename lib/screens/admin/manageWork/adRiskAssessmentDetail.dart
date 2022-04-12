import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/viewmodel/workManagement/riskAssessmentDetailViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_table_risk.dart';

var riskAsessmentDetailViewModel;
int assessmentCount = 0;
int count = 0;

class AdRiskAssessmentDetail extends StatefulWidget {
  const AdRiskAssessmentDetail({Key? key}) : super(key: key);
  @override
  _AdRiskAssessmentDetailState createState() => _AdRiskAssessmentDetailState();
}

class _AdRiskAssessmentDetailState extends State<AdRiskAssessmentDetail> {
  @override
  void initState() {
    super.initState();
    riskAsessmentDetailViewModel = Get.put(RiskAssessmentDetailViewModel());
    riskAsessmentDetailViewModel.fetchRiskAsessmentAPI(
        Get.arguments['raId'], Get.arguments['approvalId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("위험성평가서 상세보기"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                    child: Text(
                  Get.arguments['sceneName'],
                  style: BeitTextStyle.t3,
                )),
                GetBuilder<RiskAssessmentDetailViewModel>(
                  builder: (_) {
                    return _.riskAssessmentList.isEmpty
                        ? Text("loading...")
                        : ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: riskAsessmentDetailViewModel
                                .riskAssessmentList[count].length,
                            itemBuilder: (BuildContext context, int index) {
                              if (_.riskAssessmentList[count][index]
                                  is Level1Object) {
                                return TableLevel1(
                                    text: _.riskAssessmentList[count][index]
                                            .text ??
                                        "null",
                                    index: "0");
                              } else if (_.riskAssessmentList[count][index]
                                  is Level2Object) {
                                return TableLevel2(
                                  index: "1",
                                  workStep: _.riskAssessmentList[count][index]
                                          .workStep ??
                                      "null",
                                  tool:
                                      _.riskAssessmentList[count][index].tool ??
                                          "null",
                                  numberOfTools: _
                                          .riskAssessmentList[count][index]
                                          .numberOfTools ??
                                      "null",
                                  startDate: _.riskAssessmentList[count][index]
                                          .startDate ??
                                      "null",
                                  endDate: _.riskAssessmentList[count][index]
                                          .endDate ??
                                      "null",
                                  workLocation: _
                                          .riskAssessmentList[count][index]
                                          .workLocation ??
                                      "null",
                                  people: _
                                      .riskAssessmentList[count][index].people
                                      .toString(),
                                );
                              } else if (_.riskAssessmentList[count][index]
                                  is Level3Object) {
                                return TableLevel3(
                                  index: "1",
                                  dangerFactor: _
                                          .riskAssessmentList[count][index]
                                          .dangerFactor ??
                                      "null",
                                  damageType: _.riskAssessmentList[count][index]
                                          .damageType ??
                                      "null",
                                  frequency: _.riskAssessmentList[count][index]
                                      .frequency
                                      .toString(),
                                  intensity: _.riskAssessmentList[count][index]
                                      .intensity
                                      .toString(),
                                  grade: _.riskAssessmentList[count][index]
                                          .grade ??
                                      "null",
                                  solution: _.riskAssessmentList[count][index]
                                          .solution ??
                                      "null",
                                  comment: _.riskAssessmentList[count][index]
                                          .comment ??
                                      "null",
                                );
                              } else
                                return Text("error");
                            });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
