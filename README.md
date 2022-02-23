# TilkoPlugin Pakage
**Tilko에서 제공하는 "보안 모듈 스크래핑 API 서비스"를 Flutter에서 사용할 수 있도록 도와주는 플러그인을 위한 help pakage**
- 관련된 API 사용을 위한, API reponse parsing 도와주는 기능 제공

</br>

> TilkoPlugin: "Pub.dev 주소창"  
> TilkoPlugin은 틸코블렛의 많은 API들을 쉽게 사용할 수 있도록 도와주는 third party 입니다.

</br>

## Install

<br>

#### 1) Dependency 추가  
pubspec.yaml의 dependencies에 작성  
``` yaml
dependencies:
  public_health_model: ^{latest version}
```

<br>


#### 2) Dart code에 import
``` dart
import 'package:public_health_model/public_health_model.dart
```

<br>

## Usage  

<br>

``` dart
InspectionModel? inspectionModel;
DrugModel? drugModel;

Map<String, dynamic> healthData = await TilkoPlugincallHealthCheckInfo(apiKey, filePath, certPass);
Map<String, dynamic> medicalData = await TilkoPlugin.callMedicalTreatment(apiKey, filePath, certPass);
inspectionModel = InspectionModel.fromJson(healthData);
drugModel = DrugModel.fromJson(medicalData);
```
> insepctionModel에 fromJson 함수를 사용해서 UI에 데이터를 뿌려줄 수 있다.
> drugModel에 fromJson 함수를 사용해서 UI에 데이터를 뿌려줄 수 있다.

