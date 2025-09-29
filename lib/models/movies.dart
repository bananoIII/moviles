class Movies {
  int? id_movie;
  String? name;
  String? duration;
  String? date_release;
  String? image;

  Movies({
    this.id_movie,
    this.name,
    this.date_release,
    this.duration,
    this.image,
  });

  factory Movies.fromMap(Map<String, dynamic> mapa) {
    return Movies(
      id_movie: mapa['id_movie'],
      name: mapa['name'],
      date_release: mapa['date_release'],
      duration: mapa['duration'],
      image: mapa['image'],
    );
  }
}
