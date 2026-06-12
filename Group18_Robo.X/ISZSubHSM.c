/*
 * File: TemplateSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is for a substate machine. Make sure it has a unique name
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "TopHSM.h"
#include "ISZSubHSM.h"
#include "RobotControl.h"
#include "pwm.h"
#include "RC_Servo.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    FiveSecWaitState,
    TurnWaitState,
    FindBeaconState,
    ShootingState,
    LoadingState,
    LoadTwoState,
    ShootTwoState,
    LoadThreeState,
    ShootThreeState,
    LoadFourState,
    ShootFourState,
    LoadFiveState,
    ShootFiveState,
    SlowDownState,
    ReTurnState,
           
} ISZSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"FiveSecWaitState",
	"TurnWaitState",
	"FindBeaconState",
	"ShootingState",
	"LoadingState",
	"LoadTwoState",
	"ShootTwoState",
	"LoadThreeState",
	"ShootThreeState",
	"LoadFourState",
	"ShootFourState",
	"LoadFiveState",
	"ShootFiveState",
	"SlowDownState",
	"ReTurnState",
};



/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static ISZSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitISZSubHSM(void)
{
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunISZSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunTemplateSubHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunISZSubHSM(ES_Event ThisEvent)
{
    uint8_t makeTransition = FALSE; // use to flag transition
    ISZSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
    case InitPSubState: // If current state is initial Psedudo State
        if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
        {
            // this is where you would put any actions associated with the
            // transition from the initial pseudo-state into the actual
            // initial state
            
            
            
            TankTurnRight(TANK_TURN_SPEED);
            ES_Timer_InitTimer(LMAO_TIMER, 2000);
            // now put the machine into the actual initial state
            nextState = TurnWaitState;
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;
        }
        break;
        
        case TurnWaitState:
            switch (ThisEvent.EventType) {
                
            case ISZ_BEACON_DETECTED:
               ThisEvent.EventType = ES_NO_EVENT;
               break;    
                
            case ES_TIMEOUT:
                if(ThisEvent.EventParam == LMAO_TIMER){ 
                   nextState = FindBeaconState;    
                   makeTransition = TRUE;
                   ThisEvent.EventType = ES_NO_EVENT;    
                }    
            case ES_NO_EVENT:
            default: // all unhandled events pass the event back up to the next level
                break;    
            }
            break;
    
    case FindBeaconState: // in the first state, replace this with correct names
        switch (ThisEvent.EventType) {
       
        case ISZ_BEACON_DETECTED:
            PWM_AddPins(PWM_PORTZ06);
            PWM_SetDutyCycle(PWM_PORTZ06, 1000);
            StopMotorSpeed();
            ES_Timer_InitTimer(TAPE_WAIT_TIMER, 5000);
            nextState = FiveSecWaitState;    
            makeTransition = TRUE;
            ThisEvent.EventType = ES_NO_EVENT;    
            break;    
            
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;            
        
        
    case FiveSecWaitState: // in the first state, replace this with correct names
        switch (ThisEvent.EventType) {
        
            case ES_TIMEOUT:
                if(ThisEvent.EventParam == TAPE_WAIT_TIMER){ 
                    
//                TankTurnLeft(GENERAL_MOTOR_SPEED);
//                nextState = FindBeaconState;
//                makeTransition = TRUE;
//                ThisEvent.EventType = ES_NO_EVENT;
                    
                RC_Init();
                RC_AddPins(RC_PORTZ08);
                RC_SetPulseTime(RC_PORTZ08, 1000);
                PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                
                ES_Timer_InitTimer(CORNER_TIMER, 500);
                nextState = ShootingState;                         //CHANGE WHEN BEACON IMPLEMENETED
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
                }
                break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;    
        

        
        
    case ShootingState: // in the first state, replace this with correct names
        switch (ThisEvent.EventType) {
        
        case ES_TIMEOUT:
                if(ThisEvent.EventParam == CORNER_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                    ES_Timer_InitTimer(ISZ_TIMER, 500);
                    RC_SetPulseTime(RC_PORTZ08, 2000);
                    nextState = LoadingState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
                }
                break;
        case ES_NO_EVENT:
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;
        
    case LoadingState: // in the first state, replace this with correct names
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
                if(ThisEvent.EventParam == ISZ_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
                    ES_Timer_InitTimer(CORNER_TIMER, 2000);
                    RC_SetPulseTime(RC_PORTZ08, 1000);
                    nextState = ShootTwoState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
                }
                break;    
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;    
        
    
 case ShootTwoState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
            if(ThisEvent.EventParam == CORNER_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                    ES_Timer_InitTimer(ISZ_TIMER, 500);
                    RC_SetPulseTime(RC_PORTZ08, 2000);
                    nextState = LoadTwoState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;    

 case LoadTwoState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
            if(ThisEvent.EventParam == ISZ_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
                    ES_Timer_InitTimer(CORNER_TIMER, 2000);
                    RC_SetPulseTime(RC_PORTZ08, 1000);
                    nextState = ShootThreeState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;   
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;    
        
 case ShootThreeState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == CORNER_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                    ES_Timer_InitTimer(ISZ_TIMER, 500);
                    RC_SetPulseTime(RC_PORTZ08, 2000);
                    nextState = LoadThreeState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;    
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;    
        
 case LoadThreeState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == ISZ_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
                    ES_Timer_InitTimer(CORNER_TIMER, 2000);
                    RC_SetPulseTime(RC_PORTZ08, 1000);
                    nextState = ShootFourState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;   
                
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;            
        
 case ShootFourState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
            if(ThisEvent.EventParam == CORNER_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                    ES_Timer_InitTimer(ISZ_TIMER, 500);
                    RC_SetPulseTime(RC_PORTZ08, 2000);
                    nextState = LoadFourState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;           
        
 case LoadFourState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == ISZ_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
                    ES_Timer_InitTimer(CORNER_TIMER, 2000);
                    RC_SetPulseTime(RC_PORTZ08, 1000);
                    nextState = ShootFiveState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;   
                
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }        
        
 case ShootFiveState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
            if(ThisEvent.EventParam == CORNER_TIMER){     
                    PWM_SetDutyCycle(PWM_PORTZ06, SHOOT_DROP_PWM);
                    ES_Timer_InitTimer(ISZ_TIMER, 500);
                    RC_SetPulseTime(RC_PORTZ08, 2000);
                    nextState = LoadFiveState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;      
        
case LoadFiveState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == ISZ_TIMER){     
//                    PWM_SetDutyCycle(PWM_PORTZ06, 1000);
//                    RC_SetPulseTime(RC_PORTZ08, 1000);
                    ES_Timer_InitTimer(LMAO_TIMER, 1500);
                    TankTurnRight(85);
                    nextState = ReTurnState;    
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT; 
            }
            break;   
                
            
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;           
        
        
 case ReTurnState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == LMAO_TIMER){
                ES_Timer_InitTimer(CORNER_TIMER, 600);
                TankTurnRight(TANK_TURN_SPEED);
                nextState = SlowDownState;    
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
        }    
        break;    
            
        case ISZ_BEACON_DETECTED:
               ThisEvent.EventType = ES_NO_EVENT;
               break;    
        
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;         
        
 case SlowDownState: 
        switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
        if(ThisEvent.EventParam == CORNER_TIMER){
                nextState = FindBeaconState;    
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
        }    
        break;    
            
        case ISZ_BEACON_DETECTED:
               ThisEvent.EventType = ES_NO_EVENT;
               break;    
        
        case ES_NO_EVENT:
                
        default: // all unhandled events pass the event back up to the next level
            break;
        }
        break;         
                
        

    default: // all unhandled states fall into here
        break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunISZSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunISZSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}
      
        

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

