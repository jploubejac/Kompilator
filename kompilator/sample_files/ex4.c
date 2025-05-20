void main ()
{
  int a = 3;
  int b = 5;
  while (a < b) {
    a=a+1;
  }

  if (a < b) {
    int c=1;
    int d=3;
  }

  if(b == a){
    int c=1;
    int d=3;
  }else {
    int c=1;
    int d=3;
  }

  while (a > b) {
    int c=1;
    int d=3;
  }

  while (a == b || a < b) {
    int c=1;
    int d=3;
  }

  while (a == b && a < b) {}
  while (!(a == b)) {}
  while (a < b) {while (a < b) {}} 
  do {} while (a < b);
}
