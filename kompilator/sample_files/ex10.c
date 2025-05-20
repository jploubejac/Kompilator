void function() {
    int led_to_choose = 0;
    int score = 0;
    int timer = 15;
    int button = 1;
    int finished = 0;
    int valeur_attendue = 0;

    while (timer > 1) {
        led_to_choose = (led_to_choose * 3 + timer) * 2 - timer;
        while (led_to_choose > 7) {
            led_to_choose = led_to_choose - 7;
        }
        
        valeur_attendue = 1;
        int i = led_to_choose;
        while (i > 0) {
            valeur_attendue = valeur_attendue * 2;
            i = i - 1;
        }

        if (score > 5) {
            finished = 1;
        }

        int previous_button = button;
        while(button == previous_button  || button == 0){
            button= read_switchs8();
        }
        if(button==valeur_attendue){
            score = score + 1;
        }else {
            score = score - 1;
        }
        timer = timer - 1;
    }
    int c = 0;
}

void main() {
    int b = 0;
    function();
    b = b + 1;
}