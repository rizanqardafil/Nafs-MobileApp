class Article {
  final String title;
  final String imgUrl;
  final String kategori;
  final String articleUrl;

  Article(
      {required this.title,
      required this.imgUrl,
      required this.kategori,
      required this.articleUrl});
}

const List sample_data = [
  {
    "title": "Apa Itu Kecemasan ?",
    "imgUrl":
        "https://images.unsplash.com/photo-1493836512294-502baa1986e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1067&q=80",
    "kategori": "Cemas",
    "articleUrl": "https://projectgan.vercel.app/terapi-kecemasan.html",
  },
  {
    "title": "Apa Itu Stres ?",
    "imgUrl":
        "https://images.unsplash.com/photo-1522403236043-29876aa85962?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "kategori": "Stress",
    "articleUrl": "https://projectgan.vercel.app/stress.html",
  },
  {
    "title": "Apa Itu Depresi ?",
    "imgUrl":
        "https://images.unsplash.com/photo-1541199249251-f713e6145474?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
    "kategori": "Depresi",
    "articleUrl": "https://projectgan.vercel.app/depresi.html",
  },
  {
    "title": "Apa Itu Insomnia ?",
    "imgUrl":
        "https://images.unsplash.com/photo-1450776598040-e0dbb5665213?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1107&q=80",
    "kategori": "Insomnia",
    "articleUrl": "https://projectgan.vercel.app/insomnia.html",
  },
  {
    "title": "Dzikir dan Kecemasan",
    "imgUrl":
        "https://images.unsplash.com/photo-1589725616925-d72294264f8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "kategori": "Cemas",
    "articleUrl": "https://projectgan.vercel.app/dzikir-kecemasan.html",
  },
  {
    "title": "Shalat Tahajud dan Stres",
    "imgUrl":
        "https://griyaalquran.id/wp-content/uploads/Seseorang-yang-Beruntung-Karena-Shalatnya.png",
    "kategori": "Stress",
    "articleUrl": "https://projectgan.vercel.app/tahajud-stres.html",
  },
  {
    "title": "Al-Qur'an dan Depresi",
    "imgUrl":
        "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/04/27/3241267440.jpg",
    "kategori": "Depresi",
    "articleUrl": "https://projectgan.vercel.app/alquran-depresi.html",
  },
  {
    "title": "Al-Qur'an dan Insomnia",
    "imgUrl":
        "https://griyaalquran.id/wp-content/uploads/Dengan-Al-Quran-dan-As-Sunnah.jpg",
    "kategori": "Insomnia",
    "articleUrl": "https://projectgan.vercel.app/alquran-insomnia.html",
  },
];
