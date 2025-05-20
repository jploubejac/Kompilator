void main ()
{
  int a = 3;
  int b = 5;
  if (a < b) {} else {}

  if (a < b) {}

  if (a <= b) {
    int c = 11;
  } else {
    int d = 22;
  }

  if (a >= b) {
    a=1+1;
    b=a+695;
    int c =45;
  }

  if (a > b) {} else {}

  if (a == b || a < b) {} else {}

  if (a == b && a < b) {} else {}

  if (!(a == b)) {} else {}

  if (a < b) {
    if (a < b) {
      a = 1;
      int c =32;
      if( c<a){
        c=12;
      }
    } else {
      a = 1;
    } 
  } 
  else {
    a = 1;
  }

  if (a < b) {} else { if (a < b) {} else {}}
}
