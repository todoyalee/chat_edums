class Reclamation {
  final String sujet;
  final String description;
  final String priorite;
  final String statut;
  final String studentName;
  final DateTime date;

  Reclamation(
      {required this.sujet,
      required this.description,
      required this.priorite,
      required this.statut,
      required this.studentName,
      required this.date});
}
