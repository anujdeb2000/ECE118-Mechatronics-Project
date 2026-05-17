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
#define NINETY_DEGREE_TURN_TIME 800
#define GENERAL_MOTOR_SPEED 50

// TAPE SENSOR PORTS
#define Top_Tape_Sensor PORTBbits.RB11    // W3
#define Right_Tape_Sensor PORTBbits.RB10    // W4
#define Center_Tape_Sensor PORTBbits.RB13    // W5
#define Left_Tape_Sensor PORTBbits.RB12    // W6

#define TOP_TAPE_MASK    0x01
#define CENTER_TAPE_MASK 0x02
#define RIGHT_TAPE_MASK  0x04
#define LEFT_TAPE_MASK   0x08


///////////////////////////////////////////


void MotorInit(void);

char LeftMotorSpeed(char inSpeed);

char RightMotorSpeed(char inSpeed);

char ForwardMotorSpeed(char inSpeed);

char BackwardMotorSpeed(char inSpeed);

char StopMotorSpeed(void);

char TankTurnLeft(char inSpeed);

char TankTurnRight(char inSpeed);



#endif 

/* *****************************************************************************
 End of File
 */
