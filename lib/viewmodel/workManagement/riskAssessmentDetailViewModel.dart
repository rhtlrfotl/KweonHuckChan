import 'dart:convert';
import 'package:get/get.dart';

class RiskAssessmentDetailViewModel extends GetxController {
  var riskAssessmentList = List<dynamic>.empty(growable: true);

  Future<void> fetchRiskAsessmentAPI(raId, approvalId) async {
    update();
  }
}

class Level1Object {
  var text;
  Level1Object(this.text);
}

class Level2Object {
  var index;
  var workStep;
  var tool;
  var numberOfTools;
  var startDate;
  var endDate;
  var workLocation;
  var people;

  Level2Object(this.index, this.workStep, this.tool, this.numberOfTools,
      this.startDate, this.endDate, this.workLocation, this.people);
}

class Level3Object {
  var index;
  var dangerFactor;
  var damageType;
  var frequency;
  var intensity;
  var grade;
  var solution;
  var comment;

  Level3Object(this.index, this.dangerFactor, this.damageType, this.frequency,
      this.intensity, this.grade, this.solution, this.comment);
}
