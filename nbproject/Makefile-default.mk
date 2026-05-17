#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o ${OBJECTDIR}/_ext/770565488/TemplateHSM.o ${OBJECTDIR}/_ext/770565488/AD.o ${OBJECTDIR}/_ext/770565488/BOARD.o ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o ${OBJECTDIR}/_ext/770565488/ES_Framework.o ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o ${OBJECTDIR}/_ext/770565488/ES_PostList.o ${OBJECTDIR}/_ext/770565488/ES_Queue.o ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o ${OBJECTDIR}/_ext/770565488/ES_Timers.o ${OBJECTDIR}/_ext/770565488/IO_Ports.o ${OBJECTDIR}/_ext/770565488/LED.o ${OBJECTDIR}/_ext/770565488/RC_Servo.o ${OBJECTDIR}/_ext/770565488/pwm.o ${OBJECTDIR}/_ext/770565488/serial.o ${OBJECTDIR}/_ext/770565488/timers.o ${OBJECTDIR}/_ext/770565488/MotorControl.o ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o ${OBJECTDIR}/_ext/770565488/RobotTest.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o.d ${OBJECTDIR}/_ext/770565488/TemplateHSM.o.d ${OBJECTDIR}/_ext/770565488/AD.o.d ${OBJECTDIR}/_ext/770565488/BOARD.o.d ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/770565488/ES_Framework.o.d ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/770565488/ES_PostList.o.d ${OBJECTDIR}/_ext/770565488/ES_Queue.o.d ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o.d ${OBJECTDIR}/_ext/770565488/ES_Timers.o.d ${OBJECTDIR}/_ext/770565488/IO_Ports.o.d ${OBJECTDIR}/_ext/770565488/LED.o.d ${OBJECTDIR}/_ext/770565488/RC_Servo.o.d ${OBJECTDIR}/_ext/770565488/pwm.o.d ${OBJECTDIR}/_ext/770565488/serial.o.d ${OBJECTDIR}/_ext/770565488/timers.o.d ${OBJECTDIR}/_ext/770565488/MotorControl.o.d ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o.d ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o.d ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o.d ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o.d ${OBJECTDIR}/_ext/770565488/RobotTest.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o ${OBJECTDIR}/_ext/770565488/TemplateHSM.o ${OBJECTDIR}/_ext/770565488/AD.o ${OBJECTDIR}/_ext/770565488/BOARD.o ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o ${OBJECTDIR}/_ext/770565488/ES_Framework.o ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o ${OBJECTDIR}/_ext/770565488/ES_PostList.o ${OBJECTDIR}/_ext/770565488/ES_Queue.o ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o ${OBJECTDIR}/_ext/770565488/ES_Timers.o ${OBJECTDIR}/_ext/770565488/IO_Ports.o ${OBJECTDIR}/_ext/770565488/LED.o ${OBJECTDIR}/_ext/770565488/RC_Servo.o ${OBJECTDIR}/_ext/770565488/pwm.o ${OBJECTDIR}/_ext/770565488/serial.o ${OBJECTDIR}/_ext/770565488/timers.o ${OBJECTDIR}/_ext/770565488/MotorControl.o ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o ${OBJECTDIR}/_ext/770565488/RobotTest.o

# Source Files
SOURCEFILES=C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MX320F128H
ProjectDir="C:\Users\HP\MPLABXProjects\G18_Robot.X"
ProjectName=G18_Robot
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif
MDFUHostPath="C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab-pymdfu\bin\windows\pymdfu-bin.exe"
PYFWImageBuilderPath="C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab-pymdfu\bin\windows\pyfwimagebuilder-bin.exe"

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\ECE118\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c  .generated_files/flags/default/6d82a9e2208d3451d514ddc3673d0782823eea4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/TemplateHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c  .generated_files/flags/default/8e5be9315294226e6f5c700d384af47eb4560a1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/TemplateHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/TemplateHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/AD.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c  .generated_files/flags/default/3d126d4abdbfc4030ba000a8d2f600352555a43e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/AD.o.d" -o ${OBJECTDIR}/_ext/770565488/AD.o C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/BOARD.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c  .generated_files/flags/default/78d97bb5fa4dd9dfb16767db953049aef85a091c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/BOARD.o.d" -o ${OBJECTDIR}/_ext/770565488/BOARD.o C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c  .generated_files/flags/default/c9b70a84b62060a26999c7b9067bbe81abdea17f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Framework.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c  .generated_files/flags/default/638dcc78131676f1f5ed4b8a8c0ca550035f5149 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Framework.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c  .generated_files/flags/default/188864a2f8857a6b19f37dcbe43b313d5954d9d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_PostList.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c  .generated_files/flags/default/ab177dbc7e2ae9476bd361da6a8b717e01ccd1ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_PostList.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Queue.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c  .generated_files/flags/default/70ed6bd2fbbc2e2814550bdf08a04826e2e3544a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Queue.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_TattleTale.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c  .generated_files/flags/default/fce309bf10e1e44bb812f2d8a1928f5fcc934f46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Timers.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c  .generated_files/flags/default/4702561a84aacdfeb02e69a99558e729eec34fec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Timers.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/IO_Ports.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c  .generated_files/flags/default/5814711b3fec3e0b14f8c322550cf41e66b41614 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/770565488/IO_Ports.o C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/LED.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c  .generated_files/flags/default/77a319f5b5f3bfa846861c0788d9c8235222c2a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/LED.o.d" -o ${OBJECTDIR}/_ext/770565488/LED.o C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/RC_Servo.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c  .generated_files/flags/default/7276dfd7491913fd8cf15e4db4ae6c650442639e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/770565488/RC_Servo.o C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/pwm.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c  .generated_files/flags/default/12074eae5929f6345c9b9dac887c8f95a84aa95a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/pwm.o.d" -o ${OBJECTDIR}/_ext/770565488/pwm.o C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/serial.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c  .generated_files/flags/default/b2773ff45d156c63f0abf8c00b459428c5a8b19e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/serial.o.d" -o ${OBJECTDIR}/_ext/770565488/serial.o C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/timers.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c  .generated_files/flags/default/8be156530ec4e8ba99419db830c5958f27ed9123 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/timers.o.d" -o ${OBJECTDIR}/_ext/770565488/timers.o C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/MotorControl.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c  .generated_files/flags/default/e28aea6d931ef031c3d25e746b7e590105849603 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/MotorControl.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/MotorControl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/MotorControl.o.d" -o ${OBJECTDIR}/_ext/770565488/MotorControl.o C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c  .generated_files/flags/default/6c8fb18851891d58d23182321f98942040b20a15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c  .generated_files/flags/default/4e25d6b6811f8b5264ee7faaa4260db54258829a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c  .generated_files/flags/default/c79ed0316a13baac88d71da78188cdfc81735488 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ISZSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c  .generated_files/flags/default/d5ef998ecea87709a3f30c9d9abba26d0d522d20 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ISZSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/RobotTest.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c  .generated_files/flags/default/3922ab91fd390adada826adcc97979a492df13ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/RobotTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/RobotTest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/RobotTest.o.d" -o ${OBJECTDIR}/_ext/770565488/RobotTest.o C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c  .generated_files/flags/default/72c8e14678867f0aa865639bf48fb6238fd6e359 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/770565488/TemplateEventChecker.o C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/TemplateHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c  .generated_files/flags/default/f40bcd243d58aa1cec4cd9de674d72f5a3787eb0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/TemplateHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/TemplateHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/TemplateHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/TemplateHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/AD.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c  .generated_files/flags/default/69f3f341276c0658c1a3246ee4d0795991fe7140 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/AD.o.d" -o ${OBJECTDIR}/_ext/770565488/AD.o C:/Users/HP/MPLABXProjects/G18_Robot.X/AD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/BOARD.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c  .generated_files/flags/default/c10da42c5b2eaca750332bab323354d1d078d117 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/BOARD.o.d" -o ${OBJECTDIR}/_ext/770565488/BOARD.o C:/Users/HP/MPLABXProjects/G18_Robot.X/BOARD.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c  .generated_files/flags/default/26fab6c056695a33890044cfb5dfc992443a12a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_CheckEvents.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Framework.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c  .generated_files/flags/default/26db1e69c0f003aa42872795069d10e7e1306296 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Framework.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c  .generated_files/flags/default/f05f6485852229cd4f82edbbef729e4b451d3666 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_KeyboardInput.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_PostList.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c  .generated_files/flags/default/3af9c7a42f3917cec062081b9bc097515fdf0c35 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_PostList.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_PostList.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Queue.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c  .generated_files/flags/default/a48a002fee5ae5ae449ccc6aa35fb4776bd98bf3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Queue.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_TattleTale.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c  .generated_files/flags/default/4087bc373fa9aaded94cd1a9fc7f40987c1cc17d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_TattleTale.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ES_Timers.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c  .generated_files/flags/default/f351ade68fd8c1a20ff9d5391bb73091f17174e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/770565488/ES_Timers.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ES_Timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/IO_Ports.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c  .generated_files/flags/default/6d6b3ec368823bd9b75de188cb611c4a1939a059 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/770565488/IO_Ports.o C:/Users/HP/MPLABXProjects/G18_Robot.X/IO_Ports.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/LED.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c  .generated_files/flags/default/74fb0e0f82e8214a0b478fbf6c7b9fb117ae562f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/LED.o.d" -o ${OBJECTDIR}/_ext/770565488/LED.o C:/Users/HP/MPLABXProjects/G18_Robot.X/LED.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/RC_Servo.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c  .generated_files/flags/default/4869d551a2302bbfd044e03b756730e95b8d5dbc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/770565488/RC_Servo.o C:/Users/HP/MPLABXProjects/G18_Robot.X/RC_Servo.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/pwm.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c  .generated_files/flags/default/6dd0a55397546101a126fa2f040032a345b08171 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/pwm.o.d" -o ${OBJECTDIR}/_ext/770565488/pwm.o C:/Users/HP/MPLABXProjects/G18_Robot.X/pwm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/serial.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c  .generated_files/flags/default/e884842077f3697e30d945aca0df99a725c689c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/serial.o.d" -o ${OBJECTDIR}/_ext/770565488/serial.o C:/Users/HP/MPLABXProjects/G18_Robot.X/serial.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/timers.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c  .generated_files/flags/default/31d61980699975eec3dc5774cbe7a204a7662313 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/timers.o.d" -o ${OBJECTDIR}/_ext/770565488/timers.o C:/Users/HP/MPLABXProjects/G18_Robot.X/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/MotorControl.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c  .generated_files/flags/default/755347c491418d8468fa6f27f310b6e6da44d780 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/MotorControl.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/MotorControl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/MotorControl.o.d" -o ${OBJECTDIR}/_ext/770565488/MotorControl.o C:/Users/HP/MPLABXProjects/G18_Robot.X/MotorControl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c  .generated_files/flags/default/185c84c7a4a2473a304f5ce9b3b61c078dd59ffa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/NavigationSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/NavigationSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c  .generated_files/flags/default/fee41178f91912d8d69d8ee5468a0ef936dd7150 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/EdgeRunneSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/EdgeRunneSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c  .generated_files/flags/default/1a336237a1d2e43cf1568d03880f2ee03bfde142 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/ObstacleSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ObstacleSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/ISZSubHSM.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c  .generated_files/flags/default/83cd93b2d9a1803db1aef0fc7bfe71dc152b81b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/ISZSubHSM.o.d" -o ${OBJECTDIR}/_ext/770565488/ISZSubHSM.o C:/Users/HP/MPLABXProjects/G18_Robot.X/ISZSubHSM.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/770565488/RobotTest.o: C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c  .generated_files/flags/default/50f4c4342382196e2a347fdf180bca7071658eca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/770565488" 
	@${RM} ${OBJECTDIR}/_ext/770565488/RobotTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/770565488/RobotTest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O0 -fno-common -DEVENTCHECKER_TEST -I"." -I"../../../../ECE118/include" -MP -MMD -MF "${OBJECTDIR}/_ext/770565488/RobotTest.o.d" -o ${OBJECTDIR}/_ext/770565488/RobotTest.o C:/Users/HP/MPLABXProjects/G18_Robot.X/RobotTest.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/ECE118/bootloader320.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/G18_Robot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\ECE118\scripts\Enum_To_String.py]"
	@python C:\ECE118\scripts\Enum_To_String.py
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
