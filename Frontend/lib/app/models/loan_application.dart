class LoanApplication {
  final String id;
  final String userId;
  final int amount;
  final int tenure;
  final String status;
  final bool eligibility;
  final String remarks;
  final DateTime appliedAt;

  LoanApplication({
    required this.id,
    required this.userId,
    required this.amount,
    required this.tenure,
    required this.status,
    required this.eligibility,
    required this.remarks,
    required this.appliedAt,
  });

  factory LoanApplication.fromJson(Map<String, dynamic> json) => LoanApplication(
    id: json['_id'] ?? '',
    userId: json['user'] ?? '',
    amount: json['amount'] ?? 0,
    tenure: json['tenure'] ?? 0,
    status: json['status'] ?? 'Submitted',
    eligibility: json['eligibility'] ?? false,
    remarks: json['remarks'] ?? '',
    appliedAt: DateTime.tryParse(json['appliedAt'] ?? '') ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'user': userId,
    'amount': amount,
    'tenure': tenure,
    'status': status,
    'eligibility': eligibility,
    'remarks': remarks,
    'appliedAt': appliedAt.toIso8601String(),
  };
}