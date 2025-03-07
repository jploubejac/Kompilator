void main ()
{
  int a = 3;
  int b = 5;

  while (a < b) {}

  if (a < b) {}

  while (a > b) {}

  while (a == b || a < b) {}

  while (a == b && a < b) {}

  while (!(a == b)) {}

  while (a < b) {while (a < b) {} else {}}

  do {} while (a < b);
}
