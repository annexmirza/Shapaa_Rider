// To parse this JSON data, do
//
//     final documentModel = documentModelFromJson(jsonString);

import 'dart:convert';

DocumentModel documentModelFromJson(String str) => DocumentModel.fromJson(json.decode(str));

String documentModelToJson(DocumentModel data) => json.encode(data.toJson());

class DocumentModel {
  DocumentModel({
    this.adminId,
    this.taxiBase,
    this.docTitle,
    this.docDescription,
    this.docGuideDescription,
    this.docType,
    this.expiryRequired,
    this.docStatus,
    this.templatePic,
    this.docFile,
    this.docDate,
    this.modifiedBy,
    this.modifiedById,
  });

  String? adminId;
  List<TaxiBase>? taxiBase;
  String? docTitle;
  String? docDescription;
  String? docGuideDescription;
  String? docType;
  String? docFile;
  DateTime? docDate;
  bool? expiryRequired;
  String? docStatus;
  String? templatePic;
  String? modifiedBy;
  String? modifiedById;

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
    adminId: json["admin_id"],
    taxiBase: List<TaxiBase>.from(json["taxi_base"].map((x) => TaxiBase.fromJson(x))),
    docTitle: json["doc_title"],
    docDescription: json["doc_description"],
    docGuideDescription: json["doc_guide_description"],
    docType: json["doc_type"],
    expiryRequired: json["expiry_required"],
    docStatus: json["doc_status"],
    templatePic: json["template_pic"],
  );

  factory DocumentModel.driverCollection(Map<String, dynamic> json){
    return DocumentModel(
      docTitle: json["doc_title"] ?? '',
      docStatus: json["doc_status"] ?? '',
      docDate: json['expiry_date'] != 0 ? DateTime.fromMillisecondsSinceEpoch(json['expiry_date']) : null,
      docFile: json['doc_file'] ?? '',
      modifiedBy: json['modified_by'] ?? 'driver',
      modifiedById: json['modified_by_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    //"admin_id": adminId,
    //"taxi_base": List<dynamic>.from(taxiBase!.map((x) => x.toJson())),
    //"doc_description": docDescription ?? '',
    //"doc_guide_description": docGuideDescription ?? '',
    // "doc_type": docType ?? ''
    // "expiry_required": expiryRequired,,
    // "template_pic": templatePic,

    "doc_title": docTitle ?? '',
    "doc_status": docStatus ?? '',
    'expiry_date': docDate?.millisecondsSinceEpoch ?? 0,
    'doc_file': docFile ?? '',
    'modified_by': modifiedBy ?? 'driver',
    'modified_by_id': modifiedById ?? '',
  };
}

class TaxiBase {
  TaxiBase({
    this.taxiBaseId,
    this.docRequired,
  });

  String? taxiBaseId;
  bool? docRequired;

  factory TaxiBase.fromJson(Map<String, dynamic> json) => TaxiBase(
    taxiBaseId: json["taxi_base_id"],
    docRequired: json["doc_required"],
  );

  Map<String, dynamic> toJson() => {
    "taxi_base_id": taxiBaseId,
    "doc_required": docRequired,
  };
}
