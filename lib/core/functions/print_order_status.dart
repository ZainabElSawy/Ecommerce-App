String printOrderStatus(int status) {
  if (status == 0) {
    return 'Pending Approval';
  } else if (status == 1) {
    return 'The Order is being Prepared';
  } else if (status == 2) {
    return 'Ready To Picked up by Delivery man';
  } else if (status == 3) {
    return 'On the way';
  } else {
    return 'Archive';
  }
}