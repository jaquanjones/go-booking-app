package models

import "time"

// User is the basic user model
type User struct {
	ID          int
	FirstName   string
	LastName    string
	Email       string
	Password    string
	AccessLevel int
	CreatedAt   time.Time
	UpdatedAt   time.Time
}

// Customer model for users using platform as a customer
type Customer struct {
	ID         int
	IsVerified bool
	CreatedAt  time.Time
	UpdatedAt  time.Time
	UserID     User
}

// Business model for users using platform as a business
type Business struct {
	ID                  int
	BusinessName        string
	BusinessLocation    string
	HasPhysicalLocation bool
	IsVerified          bool
	IsActive            bool
	CreatedAt           time.Time
	UpdatedAt           time.Time
	UserID              User
}

// Service model for service provided by business (i.e. Haircut)
type Service struct {
	ID          int
	ServiceName string
	IsActive    bool
	CreatedAt   time.Time
	UpdatedAt   time.Time
	BusinessID  Business
}

// ServiceDetails model for sub-categories of service provided (i.e. Massage -> 30min/swedish, 60min/swedish, 60min/Sports, etc.)
type ServiceDetails struct {
	ID                     int
	ServiceSubName         string
	ServiceDurationMinutes int
	ServicePrice           float32
	CreatedAt              time.Time
	UpdatedAt              time.Time
	ServiceID              Service
}

// AppointmentStatus model for status of booked appointment (paid, complete, etc.)
type AppointmentStatus struct {
	ID         int
	StatusType string
	CreatedAt  time.Time
	UpdatedAt  time.Time
}

// Appointment model for booked appointment
type Appointment struct {
	ID                  int
	StartDate           time.Time
	EndDate             time.Time
	StartTime           time.Time
	EndTime             time.Time
	AppointmentLocation string
	StatusID            AppointmentStatus
	CreatedAt           time.Time
	UpdatedAt           time.Time
	CustomerID          Customer
	BusinessID          Business
	ServiceID           Service
	ServiceDetailsID    ServiceDetails
	SchedulingID        ServiceDetails
}

// ScheduleRestriction model for restriction on schedule (not working, appointment already booked, etc.)
type ScheduleRestriction struct {
	ID              int
	RestrictionType string
	CreatedAt       time.Time
	UpdatedAt       time.Time
}

// ServiceRestrictions  model for services provided in scheduling blocks
type ServiceRestrictions struct {
	ID            int
	StartDate     time.Time
	EndDate       time.Time
	StartTime     time.Time
	EndTime       time.Time
	CreatedAt     time.Time
	UpdatedAt     time.Time
	AppointmentID Appointment
	ServiceID     Service
	RestrictionID ScheduleRestriction
}
