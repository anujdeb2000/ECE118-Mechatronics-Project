
#include <BOARD.h>
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"
#include "MotorControl.h"
#include "timers.h"
#include "AD.h"
#include "LED.h"

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
/**************************************************************************/

void MotorTest(void);
void TapeDetectorTest(void);
void NinetyTest(void);
void BeaconTest(void);
void AD_TapeTest(void);
void MotorTapeTest(void);
void LeftLineTest(void);
void CenterLineTest(void);

void main(void){     
  //INSERT TEST FUNCTION HERE.  
  // LeftLineTest(); 
    MotorTest();
    
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
    
    IO_PortsSetPortInputs(PORTW, PIN3); // TOP_TAPE
    IO_PortsSetPortInputs(PORTW, PIN4); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTW, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTW, PIN6); // LEFT_TAPE
    
    
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
    
    unsigned int NinetyTime = 1000;
    unsigned int curTime;
    BOARD_Init(); 
    MotorInit();
    TIMERS_Init();
            
    printf("Initiating Ninety Test \r\n");
           
    printf("Tank Turning Right\r\n");
        TankTurnRight(50);
        curTime = TIMERS_GetTime();
        
        while(TIMERS_GetTime() - curTime < NinetyTime){
           // DO NOTHING
        }
        StopMotorSpeed();
        
}


void BeaconTest(void){
    AD_Init();
    unsigned int curTime;
    unsigned int rawReading;
    
    AD_AddPins(AD_PORTV6);
    
    while(1){
        rawReading = AD_ReadADPin(AD_PORTV6);
        printf("RawReading: %d\n", rawReading);
        
        curTime = TIMERS_GetTime();
        while(TIMERS_GetTime() - curTime < 500){
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
    
    IO_PortsSetPortInputs(PORTW, PIN3); // TOP_TAPE
    IO_PortsSetPortInputs(PORTW, PIN4); // RIGHT_TAPE
    IO_PortsSetPortInputs(PORTW, PIN5); // CENTER_TAPE
    IO_PortsSetPortInputs(PORTW, PIN6); // LEFT_TAPE
    
    uint8_t TopSensorState = Top_Tape_Sensor;
    printf("Initiating MotorTape Test \r\n");
    while(1){
        
       uint8_t TopSensorState = Top_Tape_Sensor; 
       uint8_t RightSensorState = Right_Tape_Sensor; 
       uint8_t CenterSensorState = Center_Tape_Sensor;
       uint8_t LeftSensorState = Left_Tape_Sensor; 
       
        if(TopSensorState == 0 && RightSensorState == 0 && CenterSensorState == 0){
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
    