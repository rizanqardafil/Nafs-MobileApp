class Question {
  final int? id;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Saya sulit untuk tenang",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami',
    ],
  },
  // {
  //   "id": 2, //test
  //   "question":
  //       "Seberapa jauh Anda menganggap masalah tidur Anda mengganggu fungsi sehari-hari Anda",
  //   "options": [
  //     'Tidak menganggu sama sekali',
  //     'Sedikit menganggu',
  //     'Cukup menganggu',
  //     'Menganggu',
  //     'Sangat menganggu'
  //   ],
  // },
  {
    "id": 3,
    "question": "Saya tidak dapat merasakan perasaan yang positif",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 4,
    "question": "Saya mengalami kesulitan bernafas",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 5, //test
  //   "question":
  //       "Seberapa puas atau tidak puaskah Anda dengan pola tidur Anda sekarang",
  //   "options": [
  //     'Sangat puas',
  //     'Puas',
  //     'Cukup puas',
  //     'Tidak puas',
  //     'Sangat tidak puas',
  //   ],
  // },
  {
    "id": 6,
    "question": "Saya cenderung bereaksi berlebihan terhadap suatu situasi",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 7,
    "question": "Saya mengalami gemetaran (misalnya pada tangan)",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 8, //test
  //   "question": "Saya kesulitan untuk tetap tidur",
  //   "options": [
  //     'Tidak ada kesulitan',
  //     'Sedikit kesulitan',
  //     'Cukup kesulitan',
  //     'Kesulitan',
  //     'Sangat Kesulitan',
  //   ],
  // },
  {
    "id": 9,
    "question":
        "Saya merasa khawatir dengan situasi dimana saya mungkin menjadi panik dan mempermalukan diri sendiri",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 10,
    "question": "Saya merasa tidak ada harapan untuk masa depan",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 11, //test
  //   "question": "Saya kesulitan untuk mulai tidur",
  //   "options": [
  //     'Tidak ada kesulitan',
  //     'Sedikit kesulitan',
  //     'Cukup kesulitan',
  //     'Kesulitan',
  //     'Sangat Kesulitan',
  //   ],
  // },
  {
    "id": 12,
    "question": "Saya sulit untuk rileks atau santai ",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 13, //test
  //   "question": "Saya memiliki kesulitan bangun lebih cepat dari biasanya",
  //   "options": [
  //     'Tidak ada kesulitan',
  //     'Sedikit kesulitan',
  //     'Cukup kesulitan',
  //     'Kesulitan',
  //     'Sangat Kesulitan',
  //   ],
  // },
  {
    "id": 14,
    "question":
        "Saya sulit untuk sabar dalam menghadapi gangguan terhadap hal yang sedang saya lakukan",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 15,
    "question": "Saya merasa mudah panik",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 16,
    "question": "Saya merasa hidup ini tidak berarti",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 17,
    "question": "Saya merasa tidak berharga",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 18,
    "question": "Saya mudah tersentuh",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 19,
    "question":
        "Saya menyadari kerja jantung, walaupun saya tidak sehabis melakukan aktivitas fisik (misalnya: merasa detak jantung meningkat atau melemah).",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 20, //test
  //   "question":
  //       "Menurut orang lain, seberapa terlihatkah pengaruh masalah tidur anda dengan kualitas hidup anda?",
  //   "options": [
  //     'Tidak terlihat sama sekali',
  //     'Sedikit terlihat',
  //     'Cukup terlihat',
  //     'Terlihat',
  //     'Sangat terlihat',
  //   ],
  // },
  {
    "id": 21,
    "question": "Saya tidak merasa antusias dalam hal apapun",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 2,
    "question": "Saya merasa semakin gelisah ",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 11,
    "question": "Saya merasa menghabiskan banyak energi karena merasa cemas",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 8,
    "question": "Saya merasa sedih dan tertekan",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 5,
    "question": "Saya sulit mendapatkan semangat untuk melakukan sesuatu",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 13,
    "question": "Saya merasa mulut saya kering",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  {
    "id": 20,
    "question": "Saya merasa takut tanpa alasan yang jelas",
    "options": [
      'Tidak pernah dialami',
      'Kadang dialami',
      'Sering dialami',
      'Sangat sering dialami'
    ],
  },
  // {
  //   "id": 28, //test
  //   "question":
  //       "Seberapa khawatir atau tertekan Anda dengan masalah tidur Anda saat ini?",
  //   "options": [
  //     'Tidak khawatir sama sekali',
  //     'Sedikit khawatir',
  //     'Cukup khawatir',
  //     'Khawatir',
  //     'Sangat Khawatir',
  //   ],
  // },
];
