class Reclamation {
  final String sujet;
  final String description;
  final String priorite; // 'Urgent' or 'Normal'
  final String  statut; // 'Résolu' or 'Non Résolu'
  final String studentName; // Student's name
  final DateTime date;

  Reclamation(
      {required this.sujet,
      required this.description,
      required this.priorite,
      required this.statut,
      required this.studentName,
      required this.date});
}
