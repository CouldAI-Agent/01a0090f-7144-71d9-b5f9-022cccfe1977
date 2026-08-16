import '../models/topic.dart';

const List<Topic> embeddedTopics = [
  Topic(
    id: 'intro',
    title: 'Introduction to Embedded C',
    description: 'Overview of Embedded C and how it differs from standard C.',
    content: 'Embedded C is a set of language extensions for the C programming language by the C Standards Committee to address commonality issues that exist between C extensions for different embedded systems.\n\nUnlike standard C, embedded C is heavily dependent on the hardware architecture. Developers must deal with constrained memory, real-time performance requirements, and direct hardware manipulation.',
    codeExample: '''
#include <stdio.h>

int main() {
    // Standard C might just print
    printf("Hello World\\n");
    return 0;
}

// Embedded C typically runs in an infinite loop
void main() {
    // Initialization code here
    while(1) {
        // Super loop: application logic runs forever
    }
}
''',
    iconName: 'info_outline',
  ),
  Topic(
    id: 'bitwise',
    title: 'Bitwise Operations',
    description: 'Manipulating individual bits for GPIO and register control.',
    content: 'Bitwise operations are crucial in embedded systems to set, clear, toggle, or check specific bits in a hardware register without altering other bits. Common operations include AND (&), OR (|), XOR (^), NOT (~), Left Shift (<<), and Right Shift (>>).',
    codeExample: '''
#define BIT(x) (1 << (x))

unsigned char PORTA = 0x00;

void setup() {
    // Set bit 3 (Turn ON LED)
    PORTA |= BIT(3); 
    
    // Clear bit 3 (Turn OFF LED)
    PORTA &= ~BIT(3);
    
    // Toggle bit 3
    PORTA ^= BIT(3);
    
    // Check if bit 3 is set
    if (PORTA & BIT(3)) {
        // Bit 3 is high
    }
}
''',
    iconName: 'memory',
  ),
  Topic(
    id: 'volatile',
    title: 'Volatile Keyword',
    description: 'Understanding volatile for hardware registers and interrupts.',
    content: 'The `volatile` keyword tells the compiler that a variable\'s value can change unexpectedly (e.g., modified by hardware or an interrupt service routine). This prevents the compiler from optimizing out read/write operations to that variable, ensuring the code interacts correctly with the hardware.',
    codeExample: '''
// Example of a hardware register mapped to memory
#define PORTB (*(volatile unsigned char *)0x25)

volatile int flag = 0;

// Interrupt Service Routine
void ISR_Timer0() {
    flag = 1; // Modified by hardware interrupt
}

void main() {
    while(1) {
        if (flag) {
            // Do something
            flag = 0;
        }
    }
}
''',
    iconName: 'warning_amber',
  ),
  Topic(
    id: 'pointers',
    title: 'Pointers in Embedded C',
    description: 'Direct memory access and function pointers.',
    content: 'Pointers are extensively used for memory-mapped I/O, passing large structures to functions efficiently, dynamic memory allocation (though often avoided in constrained systems), and function pointers for callbacks and state machines.',
    codeExample: '''
// Memory Mapped I/O using pointers
#define REG_ADDR 0x40021000
volatile unsigned int *const pReg = (unsigned int *)REG_ADDR;

void write_reg() {
    *pReg = 0xFFFFFFFF; // Write to register
}

// Function Pointer for state machine
typedef void (*StateFunc)();

void StateA() { /* ... */ }
void StateB() { /* ... */ }

void run_state_machine() {
    StateFunc currentState = StateA;
    currentState(); // Calls StateA
}
''',
    iconName: 'ads_click',
  ),
  Topic(
    id: 'gpio',
    title: 'GPIO Configuration',
    description: 'General Purpose Input/Output programming.',
    content: 'GPIO pins are the primary way a microcontroller interacts with the physical world. A pin can be configured as an Input (to read sensors, buttons) or an Output (to drive LEDs, motors). Configuration typically involves setting Direction Registers (DIR/DDR), Output Data Registers (PORT/ODR), and Input Data Registers (PIN/IDR).',
    codeExample: '''
// Pseudo-code for 8-bit AVR-like GPIO
#define DDRA  (*(volatile unsigned char *)0x21)
#define PORTA (*(volatile unsigned char *)0x22)
#define PINA  (*(volatile unsigned char *)0x20)

void gpio_init() {
    // Set PA0 as output, PA1 as input
    DDRA |= (1 << 0);
    DDRA &= ~(1 << 1);
    
    // Enable pull-up on PA1
    PORTA |= (1 << 1);
}

void main() {
    gpio_init();
    while(1) {
        // Read PA1
        if (PINA & (1 << 1)) {
            // Button not pressed (pull-up)
            PORTA &= ~(1 << 0); // Turn off LED on PA0
        } else {
            // Button pressed
            PORTA |= (1 << 0);  // Turn on LED on PA0
        }
    }
}
''',
    iconName: 'settings_input_component',
  ),
  Topic(
    id: 'interrupts',
    title: 'Interrupts & ISRs',
    description: 'Handling asynchronous events efficiently.',
    content: 'Interrupts allow the microcontroller to respond to external or internal events immediately, pausing the main program, executing an Interrupt Service Routine (ISR), and then returning. ISRs should be as short and fast as possible to avoid missing other interrupts.',
    codeExample: '''
#include <avr/interrupt.h>

volatile uint8_t timer_ticks = 0;

// ISR for Timer1 Overflow
ISR(TIMER1_OVF_vect) {
    timer_ticks++;
}

void main() {
    // Setup Timer1 (omitted for brevity)
    
    // Enable Global Interrupts
    sei(); 
    
    while(1) {
        if (timer_ticks >= 100) {
            // Perform action every 100 ticks
            timer_ticks = 0;
        }
    }
}
''',
    iconName: 'flash_on',
  )
];
