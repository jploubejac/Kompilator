void main() {
    int a = 0;
    int led_to_choose = 0;
    while (a < 30) {
        led_to_choose = led_to_choose * a + a;
        while (led_to_choose > 15) {
            led_to_choose = led_to_choose - 15;
        }
        a = a +1;
        // led status
        // if low, turn it on, if high check switch value
    }
    int c = 0;
}