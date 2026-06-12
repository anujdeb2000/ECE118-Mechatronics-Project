/*
 * File:   MotorControl.c
 * Author: HP
 *
 * Created on May 10, 2026, 11:52 AM
 */


#include <RobotControl.h>
#include <BOARD.h>
#include <xc.h>
#include <pwm.h>
#include <serial.h>
#include <AD.h>
#include <timers.h>
#include <IO_Ports.h>
#include <RC_Servo.h>

///////////////////////////////////////////////////////////////
/* PIN CONNECTIONS
 LEFT_PWN = Y10
 LEFT_DIR = V04
 LEFT_DIR_INV = V03 
 
 RIGHT_PWN = Y12
 RIGHT_DIR = Y11
 RIGHT_DIR_INV = V06 
 
 
 Top_Tape_Sensor = W3
  Right_Tape_Sensor = W4
 Center_Tape_Sensor = W5
 Left_Tape_Sensor = W6
  
 LeftObstacle_Sensor = V7
 RightObstacle_Sensor = V9

 */


#define LEFT_DIR LATBbits.LATB4    //PORTV05_LAT  
                             

#define LEFT_DIR_INV LATBbits.LATB8  //PORTV07_LAT



#define RIGHT_DIR LATBbits.LATB5 //PORTV06_LAT



#define RIGHT_DIR_INV LATBbits.LATB3  //PORTV04_LAT


#define FLY_DIR LATBbits.LATB11 //PORTW03_LAT

#define FLY_DIR_INV LATBbits.LATB13 //PORTW05_LAT


#define LEFT_DIR_TRIS _TRISB4  

#define LEFT_DIR_INV_TRIS _TRISB8
#define RIGHT_DIR_TRIS _TRISB5
#define RIGHT_DIR_INV_TRIS _TRISB3    
#define FLY_DIR_TRIS    _TRISB11
#define FLY_DIR_INV_TRIS    _TRISB13

//#define W3_TRIS _TRISB11
//#define W4_TRIS _TRISB10
//#define W5_TRIS _TRISB13
//#define W6_TRIS _TRISB12




#define LEFT_PWM PWM_PORTY10
#define RIGHT_PWM PWM_PORTY12
#define FLY_PWM PWM_PORTZ06

#define TOP_TAPE_DETECTOR_PIN






void MotorInit(void){
    PWM_Init();
    AD_Init();
    RC_Init();
    PWM_AddPins(LEFT_PWM | RIGHT_PWM);
    
    LEFT_DIR_TRIS = 0;
    LEFT_DIR_INV_TRIS = 0;
    RIGHT_DIR_TRIS = 0;
    RIGHT_DIR_INV_TRIS = 0;
    LEFT_DIR = 0;
    LEFT_DIR_INV = ~LEFT_DIR;
    RIGHT_DIR = 0;
    RIGHT_DIR_INV = ~RIGHT_DIR;
    
//    FLY_DIR_TRIS = 0;
//    FLY_DIR_INV_TRIS = 0;
//    FLY_DIR = 0;
//    FLY_DIR_INV = ~FLY_DIR;
    
    
  IO_PortsSetPortInputs(PORTZ, PIN3 | PIN5 | PIN11 | PIN7);
  IO_PortsSetPortInputs(PORTV, PIN3 | PIN8);
  
  AD_AddPins(AD_PORTW7);
  
}

char LeftMotorSpeed(char inSpeed){
    
    if (inSpeed < -MOTOR_MAX_SPEED) {
        inSpeed = -MOTOR_MAX_SPEED;
    }
    if(inSpeed > MOTOR_MAX_SPEED){
        inSpeed = MOTOR_MAX_SPEED;
    }
    
    
    if (inSpeed < 0) {
      LEFT_DIR = 0;
      inSpeed = inSpeed * (-1);
    } else {
      LEFT_DIR = 1;
    }
    LEFT_DIR_INV = ~(LEFT_DIR);
    if (PWM_SetDutyCycle(LEFT_PWM, inSpeed * (MAX_PWM / MOTOR_MAX_SPEED)) == ERROR) {
        return (ERROR);
    }
    
    return (SUCCESS);
    
}

//char FlyMotorSpeed(char inSpeed){
//    
//    if (inSpeed < -MOTOR_MAX_SPEED) {
//        inSpeed = -MOTOR_MAX_SPEED;
//    }
//    if(inSpeed > MOTOR_MAX_SPEED){
//        inSpeed = MOTOR_MAX_SPEED;
//    }
//    
//    
//    if (inSpeed < 0) {
//      FLY_DIR = 0;
//      inSpeed = inSpeed * (-1);
//    } else {
//      FLY_DIR = 1;
//    }
//    FLY_DIR_INV = ~(FLY_DIR);
//    if (PWM_SetDutyCycle(FLY_PWM, inSpeed * (MAX_PWM / MOTOR_MAX_SPEED)) == ERROR) {
//        return (ERROR);
//    }
//    
//    return (SUCCESS);
//    
//}

char RightMotorSpeed(char inSpeed){
    
    if (inSpeed < -MOTOR_MAX_SPEED) {
        inSpeed = -MOTOR_MAX_SPEED;
    }
    if(inSpeed > MOTOR_MAX_SPEED){
        inSpeed = MOTOR_MAX_SPEED;
    }
    
   // CHECK HOW MOTORS ARE MOUNTED
   // inSpeed = -inSpeed;
    
    if (inSpeed < 0) {
      RIGHT_DIR = 0;
      inSpeed = inSpeed * (-1); 
    } else {
      RIGHT_DIR = 1;
    }
    RIGHT_DIR_INV = ~(RIGHT_DIR);
    if (PWM_SetDutyCycle(RIGHT_PWM, inSpeed * (MAX_PWM / MOTOR_MAX_SPEED)) == ERROR) {
        return (ERROR);
    }
    
    return (SUCCESS);
    
}

char ForwardMotorSpeed(char inSpeed){
    LeftMotorSpeed(inSpeed);
    RightMotorSpeed(inSpeed);
}

char BackwardMotorSpeed(char inSpeed){
    LeftMotorSpeed(-inSpeed);
    RightMotorSpeed(-inSpeed);
}

char StopMotorSpeed(void){
    LeftMotorSpeed(0);
    RightMotorSpeed(0);
}

char TankTurnLeft(char inSpeed){
    LeftMotorSpeed(-inSpeed);
    RightMotorSpeed(inSpeed);
}

char TankTurnRight(char inSpeed){
    LeftMotorSpeed(inSpeed);
    RightMotorSpeed(-inSpeed);
}
