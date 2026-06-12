
#include <BOARD.h>
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "RobotControl.h"
#include "timers.h"
#include "AD.h"
#include "LED.h"
#include "RC_Servo.h"
#include "serial.h"
#include "pwm.h"

/*************************************************************************/
//Insert a Function inside main to test.
//
//__________________________Current Functions______________________________
//
//  MotorTest() :               Tests left and right motors.
//  TapeDetectorTest() :        Tests tape detectors (T,R,C,L).
//  NinetyTest() :              Tests time to turn 90 degrees.
//  BeaconTest() :              Tests raw AD readings from Beacon Detector.
//  AD_TapeTest()               Tests Tape Sensor Raw Reading
//  MotorTapeTest() :           Tests Top Tape sensor and Motor Movement
//  LeftLineTest()  :           Tests line following movement, assumes
//                                  left sensor on tape only.
//  CenterLineTest() :          Tests line following using center sensor as
//                                  basis
//  RCServoTest() :             Tests RCServo movement
//  ObstacleTest() :            Tests Obstacle Detectors
//  FlyWheelTest() :            Tests FlyWheel Motor
//  BeaconTurnTest() :          Tests Beacon Detection by Turning.
/**************************************************************************/

void MotorTest(void);
void TapeDetectorTest(void);
void NinetyTest(void);
void BeaconTest(void);
void AD_TapeTest(void);
void MotorTapeTest(void);
void LeftLineTest(void);
void CenterLineTest(void);
void RCServoTest(void);
void ObstacleTest(void);
void FlyWheelTest(void);
void BeaconTurnTest(void);
void BeaconTurnTestTwo(void);

void main(void){     
  //INSERT TEST FUNCTION HERE.  
  // LeftLineTest(); 
    //BeaconTest();
  BeaconTurnTestTwo();
}






void MotorTest(void)
{
 uint16_t curTime;
    BOARD_Init();
    MotorInit();
    TIMERS_Init();
    printf("Initiating Motor Test \r\n");
     
    curTime = TIMERS_GetTime();
    
    
   
        // GO FORWARD
        printf("Going Forward\r\n");
        ForwardMotorSpeed(100);
        
        
        while(TIMERS_GetTime() - curTime < 5000){
            // wait 5000ms (5 seconds)
        }
        printf("Stopped\r\n");
        StopMotorSpeed();
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 1000){
            // wait 1000ms (1 second)
        }

        // GO BACKWARDS
        printf("Going Backwards\r\n");
        BackwardMotorSpeed(100);
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 5000){
            // wait 5000ms (5 seconds)
        }
        printf("Stopped\r\n");
        StopMotorSpeed();
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 1000){
            // wait 1000ms (1 second)
        }

        //TANK TURN LEFT
        printf("Tank Turning Left\r\n");
        TankTurnLeft(100);
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 5000){
            // wait 5000ms (5 seconds)
        }
        printf("Stopped\r\n");
        StopMotorSpeed();
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 1000){
            // wait 1000ms (1 second)
        }

        //TANK TURN RIGHT
        printf("Tank Turning Right\r\n");
        TankTurnRight(100);
        curTime = TIMERS_GetTime();

        while(TIMERS_GetTime() - curTime < 5000){
            // wait 5000ms (5 seconds)
        }
        printf("Final Stop, waiting 10 seconds for rerun\n");
        StopMotorSpeed();
        
        while(TIMERS_GetTime() - curTime < 1000){
            // wait 5000ms (5 seconds)
        }
        
    
    
    
      };
    
void TapeDetectorTest(void) {
    BOARD_Init();
    TIMERS_Init();
    
    uint16_t curTime;
    printf("Initiating Tape Test \r\n");
    
    IO_PortsSetPortInputs(PORTZ, PIN7); // TOP_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN11); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN3); // LEFT_TAPE
    
    
    printf("Starting Tape Sensor Test.\r\n");

    while(1) {
     
        uint8_t TopSensorState = Top_Tape_Sensor; 
        uint8_t RightSensorState = Right_Tape_Sensor; 
        uint8_t CenterSensorState = Center_Tape_Sensor;
        uint8_t LeftSensorState = Left_Tape_Sensor; 
       
       // printf("------------------------------------\r\n");
        
        printf("Top State:   %d\r\n", TopSensorState);
       printf("Right State: %d\r\n", RightSensorState);
       printf("Left State:  %d\r\n", LeftSensorState);
       printf("Center State: %d\r\n", CenterSensorState);
       
        curTime = TIMERS_GetTime();
        while(TIMERS_GetTime() - curTime < 1000){
            //DO NOTHING
        }
        
        
    }
}
      
void NinetyTest(void){
    BOARD_Init(); 
    MotorInit();
    TIMERS_Init();
    unsigned int NinetyTime = 1000;
    unsigned int curTime;
    
            
    printf("Initiating Ninety Test \r\n");
           
    printf("Tank Turning Right\r\n");
        TankTurnRight(50);
        curTime = TIMERS_GetTime();
        
        while(TIMERS_GetTime() - curTime < NinetyTime){
           // DO NOTHING
        }
        StopMotorSpeed();
        
}

unsigned int GetOversampledReading(void) {
    unsigned int rawSum = 0;
    
    // Read the ADC 16 times in a tight loop
    for(int i = 0; i < 16; i++) {
        rawSum += AD_ReadADPin(AD_PORTW7);
    }
    
    // Divide by 16 using a bit-shift right for maximum speed.
    // This gives us one highly stable "point in time" reading.
    return (rawSum >> 4); 
}


void BeaconTest(void){
    BOARD_Init();
    AD_Init();
    MotorInit();
    TIMERS_Init();
    
    
    AD_AddPins(AD_PORTW7);
 unsigned int curTime;
    unsigned int oversampledReading;
    unsigned int lastReading = 0;
    
    unsigned int CoolSize = 10;
    unsigned int coolArray[20] = {0}; 
    unsigned int bufferSum = 0;
    unsigned int average = 0;
    unsigned int index = 0; 
    
    printf("Initiating New BeaconTest \r\n");
    
    // PRE-FILL THE BUFFER using our new oversampled function
    oversampledReading = GetOversampledReading();
    for(int i = 0; i < CoolSize; i++){
        coolArray[i] = oversampledReading;
        bufferSum += oversampledReading;
    }
    average = oversampledReading; 
    
    while(1){
        // 1. Get a fresh, oversampled, noise-free reading
        oversampledReading = GetOversampledReading();
        
        // 2. Update the Circular Buffer
        bufferSum -= coolArray[index];              // Remove oldest reading
        coolArray[index] = oversampledReading;      // Insert newest reading
        bufferSum += oversampledReading;            // Add newest to sum
        index = (index + 1) % CoolSize;             // Advance and wrap index
        
        // 3. Calculate the final smoothed average
        average = bufferSum / CoolSize;
        
        printf("RawReading: %d\n", average);
        
        // ... [Rest of your beacon detection logic] ...
        
        // Timer delay
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 100){
            // DO NOTHING
        }
    }
}

void AD_TapeTest(void){
    BOARD_Init(); 
    TIMERS_Init(); 
    AD_Init();
    
    unsigned int curTime;
    unsigned int rawReading;
    
    AD_AddPins(AD_PORTV3);
    
    printf("Starting AD Tape Sensor Test.\r\n");

    
    while(1){
        rawReading = AD_ReadADPin(AD_PORTV3);
        printf("RawReading: %d\n", rawReading);
        
        curTime = TIMERS_GetTime();
        while(TIMERS_GetTime() - curTime < 500){
            // DO NOTHING
            }
    }
    
}


void MotorTapeTest(void){
    uint16_t curTime;
    BOARD_Init();
    MotorInit();
    TIMERS_Init();
    
    IO_PortsSetPortInputs(PORTZ, PIN7); // TOP_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN11); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTZ, PIN3); // LEFT_TAPE
    
    uint8_t TopSensorState = Top_Tape_Sensor;
    printf("Initiating MotorTape Test \r\n");
    while(1){
        
       uint8_t TopSensorState = Top_Tape_Sensor; 
       uint8_t RightSensorState = Right_Tape_Sensor; 
       uint8_t CenterSensorState = Center_Tape_Sensor;
       uint8_t LeftSensorState = Left_Tape_Sensor; 
       
        //if(TopSensorState == 0 && RightSensorState == 0 && CenterSensorState == 0 && LeftSensorState == 0){
        if(RightSensorState == 0){
           ForwardMotorSpeed(50); 
        }
        else{
            StopMotorSpeed();
        }         
    }
 
    
}    

// States:
//  1. Starting state
//  2.
void LeftLineTest(void){
    uint16_t curTime;
    BOARD_Init();           // OFF TAPE = 0, ON TAPE = 1
    MotorInit();
    TIMERS_Init();
    
    IO_PortsSetPortInputs(PORTW, PIN3); // TOP_TAPE
    IO_PortsSetPortInputs(PORTW, PIN4); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTW, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTW, PIN6); // LEFT_TAPE
    
    
    printf("Initiating Left Line Test \r\n");
    while(1){
        
       uint8_t TopSensorState = Top_Tape_Sensor; 
       uint8_t RightSensorState = Right_Tape_Sensor; 
       uint8_t CenterSensorState = Center_Tape_Sensor;
       uint8_t LeftSensorState = Left_Tape_Sensor; 
       
       if(LeftSensorState == 1){                    // 1 X X cases
           
           if(TopSensorState == 1){                     // 1 1 X cases 
               
               if(RightSensorState == 1){                   // 1 1 1 case
                   TankTurnRight(50);
               }
               else{                                        // 1 1 0 case
                   LeftMotorSpeed(60);                      
                   RightMotorSpeed(35);
               }
           }
           
           else{                                       // 1 0 X cases
               ForwardMotorSpeed(60);
           }
       }
       else{                                          // 0 X X cases
           LeftMotorSpeed(35);      //Turn Left
           RightMotorSpeed(60);
       }
       
       //50ms pause between readings
       while(TIMERS_GetTime() - curTime < 50){
            // DO NOTHING
        }
    }
    
}    

void CenterLineTest(void){ 
    uint16_t curTime;
    BOARD_Init();           // OFF TAPE = 0, ON TAPE = 1
    MotorInit();
    TIMERS_Init();
    
    IO_PortsSetPortInputs(PORTW, PIN3); // TOP_TAPE
    IO_PortsSetPortInputs(PORTW, PIN4); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTW, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTW, PIN6); // LEFT_TAPE
    
    
    printf("Initiating Center Line Test \r\n");
    while(1){
        
       uint8_t TopSensorState = Top_Tape_Sensor; 
       uint8_t RightSensorState = Right_Tape_Sensor; 
       uint8_t CenterSensorState = Center_Tape_Sensor;
       uint8_t LeftSensorState = Left_Tape_Sensor; 
       
       if(TopSensorState == 1){
           if(CenterSensorState == 1){
               ForwardMotorSpeed(60);
           }
           
       }
       else{
           if(CenterSensorState == 1){
               if(LeftSensorState == 1 && RightSensorState == 0){
                   LeftMotorSpeed(35);      //Turn Left
                   RightMotorSpeed(60);
               }
               else if(LeftSensorState == 0 && RightSensorState == 1){
                   LeftMotorSpeed(60);      //Turn Left
                   RightMotorSpeed(35);
               }
               else{
                   ForwardMotorSpeed(50);
               }
           }
           else{
               TankTurnRight(50);
           }
       }    
       
        //50ms pause between readings
        while(TIMERS_GetTime() - curTime < 10){
            // DO NOTHING
        }
    }
    
}    
    
void RCServoTest(void){
    BOARD_Init();
    MotorInit();
    TIMERS_Init();
    AD_Init();
    RC_Init();
    SERIAL_Init();
    PWM_Init();
    uint16_t curTime;
    unsigned int servoPulse;
    
   
    
    // 1. Add the pin you are actually going to use
    RC_AddPins(RC_PORTZ08);
    
    printf("Initiating RCServo Test \r\n");
//    
//     servoPulse = 1000;
//            RC_SetPulseTime(RC_PORTZ08, servoPulse); 
//            printf("Sending 1000 \r\n");
//    
//    servoPulse = 2000;
//    RC_SetPulseTime(RC_PORTZ08, servoPulse);
//    printf("Sending 2000 \r\n");
        while(1){
            servoPulse = 1000;
            RC_SetPulseTime(RC_PORTZ08, servoPulse); 
            //printf("Sending 1000 \r\n");

            curTime = TIMERS_GetTime(); 
            while(TIMERS_GetTime() - curTime < 500){
                // DO NOTHING
            }

            servoPulse = 2000;
            RC_SetPulseTime(RC_PORTZ08, servoPulse);
            //printf("Sending 2000 \r\n");

            curTime = TIMERS_GetTime(); 
            while(TIMERS_GetTime() - curTime < 500){
            // DO NOTHING
            }
    }
}

void ObstacleTest(void){
    BOARD_Init();
    TIMERS_Init();
    
    uint16_t curTime;
    printf("Initiating Obstacle Test \r\n");
    
    IO_PortsSetPortInputs(PORTV, PIN7); // LEFT_OBSTACLE
    IO_PortsSetPortInputs(PORTV, PIN8); // RIGHT_OBSTACLE
    
    while(1){
        uint8_t LeftObstacleState = Left_Obstacle_Sensor; 
        uint8_t RightObstacleState = Right_Obstacle_Sensor;
        
         printf("Right: %d\r\n", LeftObstacleState);
         printf("Left:  %d\r\n", RightObstacleState);
         
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 500){
            // DO NOTHING
        }
    }
    
    
    
    
}


void FlyWheelTest(void)
{
 uint16_t curTime;
    BOARD_Init();
    MotorInit();
    TIMERS_Init();
    AD_Init();
    RC_Init();
    SERIAL_Init();
    PWM_Init();
    printf("Initiating FlyWheel Test \r\n");
    unsigned int servoPulse;
   
    
    unsigned int dutyCycle;
    RC_AddPins(RC_PORTZ08);
    
    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
//    servoPulse = 1000;
//    RC_SetPulseTime(RC_PORTZ08, servoPulse); 
//    
    
    curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 5000){
            // DO NOTHING
        }
    
    
    
    
   
    
//    curTime = TIMERS_GetTime(); 
//        while(TIMERS_GetTime() - curTime < 100){
//            // DO NOTHING
//        }
    
    
    while(1){
        servoPulse = 1000;
        RC_SetPulseTime(RC_PORTZ08, servoPulse); 
        //printf("Sending 1000 \r\n");
        
        PWM_SetDutyCycle(PWM_PORTZ06, 300);
        
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 500){
            // DO NOTHING
        }
        
        servoPulse = 2000;
        RC_SetPulseTime(RC_PORTZ08, servoPulse);
        //printf("Sending 2000 \r\n");
        
        PWM_SetDutyCycle(PWM_PORTZ06, 1000);
        
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 5000){
            // DO NOTHING
        }
    }
     
    
    
}

void BeaconTurnTest(void){
    BOARD_Init();
    AD_Init();
    MotorInit();
    TIMERS_Init();
    RC_Init();
    SERIAL_Init();
    PWM_Init();
  
    
    
    AD_AddPins(AD_PORTW7);
    unsigned int curTime;
    unsigned int oversampledReading;
    unsigned int lastReading = 0;
    
    unsigned int CoolSize = 10;
    unsigned int coolArray[20] = {0}; 
    unsigned int bufferSum = 0;
    unsigned int average = 0;
    unsigned int index = 0; 
    unsigned int servoPulse;
    
    printf("Initiating BeaconTurnTest \r\n");
    
    TankTurnRight(50);
    // PRE-FILL THE BUFFER using our new oversampled function
    oversampledReading = GetOversampledReading();
    for(int i = 0; i < CoolSize; i++){
        coolArray[i] = oversampledReading;
        bufferSum += oversampledReading;
    }
    average = oversampledReading; 
    
    while(1){
        // 1. Get a fresh, oversampled, noise-free reading
        oversampledReading = GetOversampledReading();
        
        // 2. Update the Circular Buffer
        bufferSum -= coolArray[index];              // Remove oldest reading
        coolArray[index] = oversampledReading;      // Insert newest reading
        bufferSum += oversampledReading;            // Add newest to sum
        index = (index + 1) % CoolSize;             // Advance and wrap index
        
        // 3. Calculate the final smoothed average
        average = bufferSum / CoolSize;
        
        printf("RawReading: %d\n", average);
        if(average >= 600){
            StopMotorSpeed();
            printf("Found Beacon \r\n");
            break;
        }
        // ... [Rest of your beacon detection logic] ...
        
        // Timer delay
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 100){
            // DO NOTHING
        }
    }
    
    RC_AddPins(RC_PORTZ08);
    PWM_AddPins(PWM_PORTZ06);
    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
//    servoPulse = 1000;
//    RC_SetPulseTime(RC_PORTZ08, servoPulse); 
//    
    
    curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 5000){
            // DO NOTHING
        }
    
    
    
    
   
    
//    curTime = TIMERS_GetTime(); 
//        while(TIMERS_GetTime() - curTime < 100){
//            // DO NOTHING
//        }
    
    
    while(1){
        servoPulse = 1000;
        RC_SetPulseTime(RC_PORTZ08, servoPulse); 
        //printf("Sending 1000 \r\n");
        
        PWM_SetDutyCycle(PWM_PORTZ06, 300);
        
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 500){
            // DO NOTHING
        }
        
        servoPulse = 2000;
        RC_SetPulseTime(RC_PORTZ08, servoPulse);
        //printf("Sending 2000 \r\n");
        
        PWM_SetDutyCycle(PWM_PORTZ06, 1000);
        
        curTime = TIMERS_GetTime(); 
        while(TIMERS_GetTime() - curTime < 5000){
            // DO NOTHING
        }
    }
     
    
    
    
    
    
}


void BeaconTurnTestTwo(void){
    BOARD_Init();
    AD_Init();
    MotorInit();
    TIMERS_Init();
    RC_Init();
    SERIAL_Init();
    PWM_Init();
  
    
    
    AD_AddPins(AD_PORTW7);
    unsigned int curTime;
    unsigned int RawReading;
    unsigned int lastReading = 0;
    
    
    printf("Initiating BeaconTurnTestTwo \r\n");
    
    //TankTurnRight(50);
    while(1){
        
    
        RawReading = AD_ReadADPin(AD_PORTW7);
        printf("RawReading: %d\n", RawReading);
//       if(RawReading >= 550){
//            StopMotorSpeed();
//            break;
//        }
       curTime = TIMERS_GetTime(); 
       while(TIMERS_GetTime() - curTime < 100){
           // DO NOTHING
       }

    }
}