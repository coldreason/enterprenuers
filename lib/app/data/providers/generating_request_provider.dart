import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:generative/app/data/models/generating_request_model.dart';

import '../../../constants.dart';

class GeneratingRequestProvider {
  CollectionReference requestRef =
      FirebaseFirestore.instance.collection(FirebaseConstants.request);

  CollectionReference requestQueueRef =
  FirebaseFirestore.instance.collection(FirebaseConstants.requestQueue);

  @override
  void onInit() {}

  Future<DocumentReference> sendRequest(GeneratingRequest generatingRequest) async{
    DocumentReference<Object?> documentReference = requestRef.doc();
    generatingRequest.id = documentReference.id;
    documentReference.set(generatingRequest.toJson());
    addQueue(generatingRequest.id!);
    return await documentReference;
  }

  void addQueue(String newRequestId) {
    DocumentReference<Object?> documentReference = requestQueueRef.doc(newRequestId);
    documentReference.set({"id":newRequestId,"createTime":Timestamp.now()});
  }
}
