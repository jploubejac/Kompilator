void main() {
    int led_to_choose = 0;
    int score = 0;
    int timer = 60;
    int button;
    int timer_while=0;
    int win;
    while (timer > 1) {
        led_to_choose = led_to_choose + timer;
        while (led_to_choose > 15) {
            led_to_choose = led_to_choose - 15;
        }
        int valeur_attendue = 1;
        int i = led_to_choose;
        while (i > 0) {
            valeur_attendue = valeur_attendue * 2;
            i = i - 1;
        }
        timer_while=0;
        win =0;
        while((timer_while < 5) && (win == 0)){
            if (button == valeur_attendue) {
                score = score + 1;
                win=1;
            }
            timer_while = timer_while + 1;
        }
        timer = timer - 1;
    }
    int c = 0;
}