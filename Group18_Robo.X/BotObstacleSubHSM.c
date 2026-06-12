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
#include "BotObstacleSubHSM.h"
#include "RobotControl.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    GoBackState,
    NinetyWait,
    TopCheck,
    EdgeWait,
    EndState,
    TheSecondObstacleL,
    TheSecondObstacleR,
    WeNeedToMove,
} BObstacleSubHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"GoBackState",
	"NinetyWait",
	"TopCheck",
	"EdgeWait",
	"EndState",
	"TheSecondObstacleL",
	"TheSecondObstacleR",
	"WeNeedToMove",
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

static BObstacleSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;

static uint32_t CurTime;
static uint32_t LastTime;

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
uint8_t InitBotObstacleSubHSM(void) {
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunBotObstacleSubHSM(INIT_EVENT);
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
ES_Event RunBotObstacleSubHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    BObstacleSubHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                CurTime = ES_Timer_GetTime();
                BackwardMotorSpeed(GENERAL_MOTOR_SPEED);
                ES_Timer_InitTimer(LMAO_TIMER, 300);
                // now put the machine into the actual initial state
                nextState = GoBackState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case GoBackState:
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == LMAO_TIMER) {

                        TankTurnLeft(TANK_TURN_SPEED);
                        ES_Timer_InitTimer(NINETY_TIMER, NINETY_DEGREE_TURN_TIME);
                        nextState = NinetyWait;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case NinetyWait: // in the first state, replace this with correct names
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == NINETY_TIMER) {

                        ForwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        ES_Timer_InitTimer(TAPE_WAIT_TIMER, TAPE_WAIT_TIME);
                        nextState = TopCheck;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case TopCheck:
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TAPE_WAIT_TIMER) {
                        nextState = EdgeWait;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                    
                case LEFT_OBSTACLE_ON:
                        LastTime = CurTime;
                        CurTime = ES_Timer_GetTime();
                        ES_Timer_InitTimer(LMAO_TIMER, 500);
                        BackwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        nextState = TheSecondObstacleL;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    
                    break;    
                    
                case RIGHT_OBSTACLE_ON:
                        LastTime = CurTime;
                        CurTime = ES_Timer_GetTime();
                        ES_Timer_InitTimer(LMAO_TIMER, 500);
                        BackwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        nextState = TheSecondObstacleR;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    
                    break;    
                    

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case TheSecondObstacleL:
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == LMAO_TIMER) {
                        TankTurnRight(TANK_TURN_SPEED);
                        ES_Timer_InitTimer(CORNER_TIMER, 250);
                        nextState = WeNeedToMove;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            
        case TheSecondObstacleR:
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == LMAO_TIMER) {
                        TankTurnLeft(TANK_TURN_SPEED);
                        ES_Timer_InitTimer(TAPE_WAIT_TIMER, (TAPE_WAIT_TIME - (CurTime - LastTime) ) );
                        CurTime = ES_Timer_GetTime();
                        nextState = WeNeedToMove;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;
            
            
        case WeNeedToMove:
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == CORNER_TIMER) {
                        ForwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        ES_Timer_InitTimer(TAPE_WAIT_TIMER, (TAPE_WAIT_TIME * 0.5) );
                        nextState = TopCheck;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_NO_EVENT:
                default:
                    break;
            }
            break;    
            
        case EdgeWait:
            switch (ThisEvent.EventType) {
                case TOP_TAPE_ON:
                    StopMotorSpeed();
                    ES_Timer_InitTimer(OBSTACLE_TIMER, 300);
                    nextState = EndState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                
                case LEFT_OBSTACLE_ON:
                        LastTime = CurTime;
                        CurTime = ES_Timer_GetTime();
                        ES_Timer_InitTimer(LMAO_TIMER, 500);
                        BackwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        nextState = TheSecondObstacleL;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    
                    break;    
                    
                case RIGHT_OBSTACLE_ON:
                        LastTime = CurTime;
                        CurTime = ES_Timer_GetTime();
                        ES_Timer_InitTimer(LMAO_TIMER, 500);
                        BackwardMotorSpeed(GENERAL_MOTOR_SPEED);
                        nextState = TheSecondObstacleR;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    
                    break;    
                        
                    
                    
                    
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case EndState:
            switch (ThisEvent.EventType) {
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;



        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunBotObstacleSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunBotObstacleSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

