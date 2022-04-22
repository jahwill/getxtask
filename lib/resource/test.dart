class QnModel {
  QnModel(
      {this.q1 = '',
      this.q1_options = '',
      this.q1_is_multi_choice = 0,
      this.q1_trigger = '',
      this.q2 = '',
      this.q2_options = ''});

  final String q1;
  final String q1_options;
  final int q1_is_multi_choice;
  final String q1_trigger;
  final String q2;
  final String q2_options;

  QnModel.FromJson(Map<String, dynamic> json)
      : q1 = json['q1'],
        q1_options = json['q1_options'],
        q1_is_multi_choice = json['q1_is_multi_choice'],
        q1_trigger = json['q1_trigger'],
        q2 = json['q2'],
        q2_options = json['q2_options'];
}

//List list_Model_Questions=[
//
//
// ];
List<Map<String, dynamic>> quest = [
  {
    "q1": "What is your Gender?",
    "q1_options": ["Male", "Female", "Binary"],
    "q1_is_multi_choice": 0,
    "q1_trigger": null,
    "q2": null,
    "q2_options": null,
  },
  {
    "q1": "What is your relationship status?",
    "q1_options": ["Single", "In a relationship", "Married"],
    "q1_is_multi_choice": 0,
    "q1_trigger": null,
    "q2": null,
    "q2_options": null,
  },
  {
    "q1": "Do you consider yourself to be religious?",
    "q1_options": ["Yes", "No"],
    "q1_is_multi_choice": 0,
    "q1_trigger": "Yes",
    "q2": "What religion do you identify with?",
    "q2_options": [
      "Christianity",
      "Islam",
      "Judaism",
      "African Traditional Religion"
    ],
  }
];
