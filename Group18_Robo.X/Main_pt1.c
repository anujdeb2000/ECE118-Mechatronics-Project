/*
 * File:   newmain.c
 * Author: joshu
 *
 * Created on April 27, 2026, 8:39 PM
 */


#include <xc.h>
#include <stdio.h>
#include "BOARD.h"
#include "AD.h"
#include "RC_Servo.h"
#include "LED.h"

unsigned int POT_Reading;
unsigned int Scaled_Pot; //Range is 0-1000
unsigned short int Direction;
unsigned char LED_scale;


int main(void) {
    //initializations
    BOARD_Init();
    RC_Init();
    AD_Init();
    LED_Init();

    LED_AddBanks(LED_BANK1 | LED_BANK2 | LED_BANK3); //Enable banks for LEDs

    AD_AddPins(AD_PORTV5); //Add AD_PORTV3 pin to read potentiometer 
    RC_AddPins(RC_PORTW07); // Add RC_PORTX03 to apply pwm to servo

    while (1) {
        if (AD_IsNewDataReady()) {
            POT_Reading = AD_ReadADPin(AD_PORTV5); //read potentiometer ad value
            Scaled_Pot = MINPULSE + (POT_Reading * (MAXPULSE-MINPULSE))/1023; //Scale value to PWM ms
            //Add limits when over or under limits
            if (Scaled_Pot > MAXPULSE) Scaled_Pot = MAXPULSE;
            if (Scaled_Pot < MINPULSE) Scaled_Pot = MINPULSE;

            unsigned char led_count = (POT_Reading * 12) / 1023;

            //Set LEDs to scale with potentiometer
            LED_SetBank(LED_BANK1, led_count >= 4 ? 0x0F : (1 << led_count) - 1);
            LED_SetBank(LED_BANK2, led_count >= 8 ? 0x0F : led_count > 4 ? (1 << (led_count - 4)) - 1 : 0x00);
            LED_SetBank(LED_BANK3, led_count >= 12 ? 0x0F : led_count > 8 ? (1 << (led_count - 8)) - 1 : 0x00);

            //Set potentiometer value to pulse pwm time (ms)
            RC_SetPulseTime(RC_PORTW07, Scaled_Pot);
            printf("%d\n", Scaled_Pot);
        }
    }
    return 0;
}