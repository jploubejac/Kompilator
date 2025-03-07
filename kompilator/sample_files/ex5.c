void main ()
{
  int a = 3;

  for (; a < 8; a = a + 1) {}

  for (int i = 0; i < 10; i++) {}

  for (int i = 20; i > 10; i--) {}

  for (int i = 0; i == 0; i++) {}

  for (int i = 0; i != 10; i++) {}

  for (int i = 0; (i < 10) && (i < 10); i++) {}

  for (int i = 0; (i < 10) || (i < 10); i++) {}

  for (int i = 0; !(i > 10); i++) {}
}
