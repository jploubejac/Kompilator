void main ()
{
  int a = 3;
  int b = 5;
  while (a < b) {
    a=a+1;
  }

  if (a < b) {}

  while (a > b) {}

  while (a == b || a < b) {}

  while (a == b && a < b) {}

  while (!(a == b)) {}

  while (a < b) {while (a < b) {}}

  do {} while (a < b);
}
