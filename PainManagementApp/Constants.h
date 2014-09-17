//
//  Constants.h
//  PainManagementApp
//
//  Created by Vishnu on 11/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#ifndef PainManagementApp_Constants_h
#define PainManagementApp_Constants_h


#pragma -mark SegueIdentifiers

#define SIGN_UP @"signUp"
#define SIGN_IN @"signIn"
#define GO_TO_LANDINGVIEW @"landingView"
#define ADD_MEDICATION @"MEDICATION"
#define MANAGE_PAIN @"PAIN MANAGEMENT"
#define ADD_APPOINTMENT @"APPOINTMENTS"
#define SET_REMINDER @"reminder"
#define SET_REMINDER_FREQUENCY @"frequency"
#define SET_MEDICATION_FORM @"form"
#define SET_REMINDER_TIMINGS @"time"
#define SELECT_DAYS @"dayOrDate"
#define SELECT_OSTEO_MEDICATION @"Osteoporosis"
#define SCHEDULE_REMINDER @"schedule"
#define LOCATE_PAIN @"locatePain"
#define OVERALL @"overall"
#define FLIP_TO_BACK @"back"
#define ADD_AN_APPOINTMENT @"addAppointment"
#define SAVE_APPOINTMENT @"saveAppointment"
#define ADD_OSTEO_REMINDER @"osteoReminder"
#define LOGIN_SIGNUP @"loginOrSignup"


#pragma -mark TableViewCell Identifiers
static NSString *menuCellIdentifier = @"menuCell";
static NSString *dashBoardCellIdentifier = @"dashboardCell";
static NSString *AddNewCellIdentifier = @"selectCell";
static NSString *ReminderCellIdentifier = @"reminder";
static NSString *OsteoCellIdentifier = @"osteo-Cell";
static NSString *SliderCellIdentifier = @"sliderCell";
static NSString *notesCellIdentifier = @"notesCell";
static NSString *physicianCellIdentifier = @"physicianCell";
static NSString *osteoReminderCellIdentifier = @"osteo-reminder";

#pragma -mark CollectionViewCell Identifiers
static NSString *confirmCollectionIdentifier = @"PMConfirmCollectionViewCell";

#pragma - mark Resource Names
#define DASHBOARD_MENU_ITEMS @"DashBoardMenuItems"
#define CONFIRM_VIEW @"ConfirmView"

#endif
