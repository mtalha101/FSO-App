import 'package:flutter/material.dart';

import 'colors.dart';

enum ServiceStatuses {
  pending,
  declined,
  inProgress,
  resolved,
}

extension ServiceStatusesExtension on ServiceStatuses {
  String get value {
    switch (this) {
      case ServiceStatuses.pending:
        return 'Pending';
      case ServiceStatuses.declined:
        return 'Declined';
      case ServiceStatuses.inProgress:
        return 'In Progress';
      case ServiceStatuses.resolved:
        return 'Resolved';
      default:
        return 'Unknown';
    }
  }
}

const statustoColor = {
  ServiceStatuses.pending: AppColors.kPrimaryColor,
  ServiceStatuses.declined: AppColors.kRedColor,
  ServiceStatuses.inProgress: AppColors.kPrimaryColor,
  ServiceStatuses.resolved: AppColors.kGreenColor,
};

const statusTextColor = {
  ServiceStatuses.pending: Colors.black,
  ServiceStatuses.declined: Colors.white,
  ServiceStatuses.inProgress: Colors.black,
  ServiceStatuses.resolved: Colors.white,
};
