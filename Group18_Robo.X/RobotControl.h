/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef MOTOR_CONTROL_H    /* Guard against multiple inclusion */
#define MOTOR_CONTROL_H

#include <BOARD.h>
#include <IO_Ports.h>
#include <xc.h>
///////////////////////////////////////////
//Define Statements under here:
#define MOTOR_MAX_SPEED 100 
#define NINETY_DEGREE_TURN_TIME 1010   
#define GENERAL_MOTOR_SPEED 50
#define TAPE_WAIT_TIME 2500
#define SHOOT_DROP_PWM 285
#define TANK_TURN_SPEED 50
#define OBSTACLE_EVASION_TIME 200
// TAPE SENSOR PORTS
#define Top_Tape_Sensor PORTEbits.RE2   // Z07


#define Right_Tape_Sensor PORTEbits.RE0    // Z11

#define Center_Tape_Sensor PORTEbits.RE3   // Z05

#define Left_Tape_Sensor PORTEbits.RE4   // Z03


#define Left_Obstacle_Sensor PORTBbits.RB2    // V3
#define Right_Obstacle_Sensor PORTBbits.RB9   // V8





///////////////////////////////////////////


void MotorInit(void);

char LeftMotorSpeed(char inSpeed);

char RightMotorSpeed(char inSpeed);

char ForwardMotorSpeed(char inSpeed);

char BackwardMotorSpeed(char inSpeed);

char StopMotorSpeed(void);

char TankTurnLeft(char inSpeed);

char TankTurnRight(char inSpeed);

//char FlyMotorSpeed(char inSpeed);

#endif 

/* *****************************************************************************
 End of File
 */
