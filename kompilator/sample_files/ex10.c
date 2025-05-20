void main() {
    int led_to_choose = 0;
    int score = 0;
    int timer = 60;
    int button = 1;
    int timer_while=0;
    int win = 0;
    int finished = 0;
    int reset = 0;

    while (timer > 1) {
        led_to_choose = led_to_choose + timer;
        while (led_to_choose > 7) {
            led_to_choose = led_to_choose - 7;
        }
        int valeur_attendue = 1;
        int i = led_to_choose;
        while (i > 0) {
            valeur_attendue = valeur_attendue * 2;
            i = i - 1;
        }

        if (score > 5) {
            finished = 1;
        }

        if (reset == 1) {
            score = 0;
            timer = 60;
        }

        while(button != valeur_attendue){
            button= read_switchs8();
        }
        score = score + 1;
        timer = timer - 1;
    }
    int c = 0;
}