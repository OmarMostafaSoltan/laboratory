/*   
Analysis List:-

code analysis in reception : 8071 
analysis name: Cross match CDC	
result time: 3	
sample type: Patient: 1 serum sample and 2 Heparin Whole Blood samples - Donor: 3 Heparin Whole Blood samples
price: 250

code analysis in reception: 8072  
analysis name: Cross match CDC (D.T.T)
result time	3
sample type: Patient: 1 serum sample and 2 Heparin Whole Blood samples - Donor: 3 Heparin Whole Blood samples
price: 2090


code analysis in reception: 8085 
analysis name: RAST (Food Allergens 30 types)	
result time :2
sample type: Serum Room Temperature
price: 1815

code analysis in reception: 8090
analysis name: H. Pylori IgA
result time :3
sample type: Serum Room Temperature
price: 595

code analysis in reception: 8093
analysis name: High Sensitive CRP
result time : 2
sample type: Serum Room Temperature
price: 330

code analysis in reception: 8109
analysis name: Immunofixation Electrophoresis-Serum
result time :5
sample type: Serum Room Temperature
price: 2890

code analysis in reception:  8110
analysis name:Immunofixation Electrophoresis-Urine	
result time : 5
sample type:Urine Random
price: 3380

code analysis in reception: 8157
analysis name:Mixed Lymphocyte Culture (MLC)	
result time : 6
sample type: Heparinized blood for both donor and recipient
price: 1640

code analysis in reception:8163
analysis name:Myeloperoxidase (p ANCA) by Immunofluorescence
result time :الأحد و الأربعاء	
sample type: Serum Room Temperature
price: 695

code analysis in reception:8169
analysis name:Phagocytic Index
result time :2	
sample type: Heparinized Blood
price: 480



Packages List :-

package name : Children Check Up (3-12 Years)
price : 600 
names of tests : 
1- Complete Blood Pictur 
2- Urine Analysis
3- Stool Analysis
4- Creatinine

package name : Teenagers Check Up (13-19 Years)
price : 300
names of tests:
1- CBC
2- Urine Analysis


package name: General Check Up ( 20-60 Years )
price: 1500
names of tests :
1- Complete Blood Picture

2- Creatinine

3- Blood Urea

4- Uric Acid

5- ALT (SGPT)

6- AST (SGOT)

7- Urine Analysis

8- Stool Analysis

9- Lipid Profile

10- HbA1c

11- TSH

*/

class Analysis {
  final String codeInReception;
  final String analysisName;
  final String resultTime;
  final String sampleType;
  final double price;

  Analysis( {
    required this.codeInReception,
    required this.analysisName,
    required this.resultTime,
    required this.sampleType,
    required this.price,
  });

    // Convert a Analysis instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'code in reception': codeInReception,
      'analysis name': analysisName,
      'result time': resultTime,
      'sample type': sampleType,
      'price': price,
    };
  }

  // Convert a Map to a BrancheData instance
  factory Analysis.fromMap(Map<String, dynamic> map) {
    return Analysis(
      codeInReception: map['code in reception'],
      analysisName: map['analysis name'],
      resultTime: map['result time'] ,
      sampleType: map['sample type'],
      price: map['price']
    );
  }

}

List<Analysis> analyses = [
  Analysis(
    codeInReception: '8071',
    analysisName: 'Cross match CDC',
    resultTime: '3',
    sampleType: 'Patient: 1 serum sample and 2 Heparin Whole Blood samples - Donor: 3 Heparin Whole Blood samples',
    price: 250,
  ),
  Analysis(
    codeInReception: '8072',
    analysisName: 'Cross match CDC (D.T.T)',
    resultTime: '3',
    sampleType: 'Patient: 1 serum sample and 2 Heparin Whole Blood samples - Donor: 3 Heparin Whole Blood samples',
    price: 2090
  ),
  Analysis(
    codeInReception: '8085',
    analysisName: 'RAST (Food Allergens 30 types)',
    resultTime: '2',
    sampleType: 'Serum Room Temperature',
    price: 1815
  ),
  Analysis(
    codeInReception: '8090',
    analysisName: 'H. Pylori IgA',
    resultTime: '3',
    sampleType: 'Serum Room Temperature',
    price: 595
  ),
  Analysis(
    codeInReception: '8093',
    analysisName: 'High Sensitive CRP',
    resultTime: '2',
    sampleType: 'Serum Room Temperature',
    price: 330
  ),
  Analysis(
    codeInReception: '8109',
    analysisName: 'Immunofixation Electrophoresis-Serum',
    resultTime: '5',
    sampleType: 'Serum Room Temperature',
    price: 2890
  ),
  Analysis(
    codeInReception: '8110',
    analysisName: 'Immunofixation Electrophoresis-Urine',
    resultTime: '5',
    sampleType: 'Urine Random',
    price: 3380
  ),
  Analysis(
    codeInReception: '8157',
    analysisName: 'Mixed Lymphocyte Culture (MLC)',
    resultTime: '6',
    sampleType: 'Heparinized blood for both donor and recipient',
    price: 1640
  ),
  Analysis(
    codeInReception: '8163',
    analysisName: 'Myeloperoxidase (p ANCA) by Immunofluorescence',
    resultTime: 'الأحد و الأربعاء',
    sampleType: 'Serum Room Temperature',
    price: 695
  ),
  Analysis(
    codeInReception: '8169',
    analysisName: 'Phagocytic Index',
    resultTime: '2',
    sampleType: 'Heparinized Blood',
    price: 480
  ),
];



class Package{
  final String packageName;
  final double price;
  final List<String> tests;

  Package({
    required this.packageName,
    required this.price,
    required this.tests,
  });

  // Convert a Package instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'package name': packageName,
      'tests': tests,
      'price': price,
    };
  }

  // Convert a Map to a Package instance
  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
      packageName: map['package name'],
      tests: map['tests'] != null ? List<String>.from(map['tests']) : [],
      price: map['price']
    );
  }



}


List<Package> packages = [
  Package(
    packageName: 'Children Check Up (3-12 Years)',
    price: 600.0,
    tests: [
      'Complete Blood Picture',
      'Urine Analysis',
      'Stool Analysis',
      'Creatinine',
    ],
  ),
  Package(
    packageName: 'Teenagers Check Up (13-19 Years)',
    price: 300.0,
    tests: [
      'CBC',
      'Urine Analysis',
    ],
  ),
  Package(
    packageName: 'General Check Up (20-60 Years)',
    price: 1500.0,
    tests: [
      'Complete Blood Picture',
      'Creatinine',
      'Blood Urea',
      'Uric Acid',
      'ALT (SGPT)',
      'AST (SGOT)',
      'Urine Analysis',
      'Stool Analysis',
      'Lipid Profile',
      'HbA1c',
      'TSH',
    ],
  ),
];