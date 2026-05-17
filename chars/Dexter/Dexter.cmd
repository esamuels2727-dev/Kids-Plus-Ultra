; The CMD file.
;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
[Command]
name = "4-Bot-Transformer"
command = ~D, DF, F, x+y
time = 20

[Command]
name = "Dexo-Transformer"
command = ~D, DF, F, y+z
time = 20

[Command]
name = "Robo-Dexo"
command = ~D, DB, B, x+y
time = 20

[Command]
name = "Mom-Droid"
command = ~D, DB, B, y+z
time = 20
;-| Special Motions |------------------------------------------------------
[Command]
name = "Ray_Gun"
command = ~D, DF, F, x
time = 10

[Command]
name = "Fire_Gun"
command = ~D, DF, F, y
time = 15

[Command]
name = "Laser_Pen"
command = ~D, DF, F, z
time = 10

[Command]
name = "Ray_Gun_hold"
command = /x
time = 1

[Command]
name = "The_Robotic_arm"
command = ~D, DB, B, x
time = 10

[Command]
name = "The_Robotic_arm"
command = ~D, DB, B, y
time = 10

[Command]
name = "The_Robotic_arm"
command = ~D, DB, B, z
time = 10

[Command]
name = "Wrench_Dash"
command = ~D, DF, F, c
time = 10

[Command]
name = "Wrench_Counter"
command = ~D, DF, F, b
time = 10

[Command]
name = "Throw_The_Test_Tube"
command = ~D, DF, F, a
time = 10

[Command]
name = "Gravity_Gauntlet"
command = ~D, DB, B, a
time = 10

[Command]
name = "Zap_Transport"
command = y+b
time = 10
;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Button |---------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1
;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "SJ"
command = $D, $U
time = 20
;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
;Mom-Droid control
[State -1, Mom-Droid control]
type = ChangeState
value = 3200
Triggerall = Numhelper(3201) = 0
triggerall = command = "Mom-Droid"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Robo-Dexo 2000
[State -1, Robo-Dexo 2000]
type = ChangeState
value = 3050
triggerall = command = "Robo-Dexo"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
;---------------------------------------------------------------------------
;4-Bot-Transformer
[State -1, 4-Bot-Transformer]
type = ChangeState
value = 3100
triggerall = command = "4-Bot-Transformer"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
;---------------------------------------------------------------------------
; Dexo-Transformer
[State -1, Dexo-Transformer]
type = ChangeState
value = 3000
triggerall = command = "Dexo-Transformer"
triggerall = power >= 2000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA
trigger2 = stateno != [3000,3100)
trigger2 = movecontact
;---------------------------------------------------------------------------
; Zap Transport
[State -1, Zap Transport]
type = ChangeState
value = 1020
triggerall = command = "Zap_Transport"
trigger1 = Statetype != A && ctrl
trigger2 = (StateType != A) && (HitdefAttr != SC, NA) && ctrl
trigger3 = ctrl && stateno != 950
;---------------------------------------------------------------------------
; The Robotic arm
[State -1, The Robotic arm]
type = ChangeState
value = 1030
triggerall = command = "The_Robotic_arm"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact
trigger10 = stateno = 430 && movecontact
trigger11 = stateno = 440 && movecontact
trigger12 = stateno = 450 && movecontact
;---------------------------------------------------------------------------
; Wrench Dash
[State -1, Wrench Dash]
type = ChangeState
value = 1040
triggerall = command = "Wrench_Dash"
trigger1 = Statetype != A && ctrl
trigger2 = (StateType != A) && (HitdefAttr != SC, NA) && ctrl
trigger3 = ctrl && stateno != 950
trigger4 = (stateno = 200) && (Movecontact)
trigger5 = (stateno = 210) && (Movecontact)
trigger6 = (stateno = 220) && (Movecontact)
trigger7 = (stateno = 230) && (Movecontact)
trigger8 = (stateno = 240) && (Movecontact)
trigger9 = (stateno = 250) && (Movecontact)
trigger10 = (stateno = 400) && (Movecontact)
trigger11 = (stateno = 410) && (Movecontact)
trigger12 = (stateno = 430) && (Movecontact)
trigger13 = (stateno = 440) && (Movecontact)
trigger14 = (stateno = 450) && (Movecontact)
trigger15 = (stateno = 600) && (Movecontact)
trigger16 = (stateno = 610) && (Movecontact)
trigger17 = (stateno = 630) && (Movecontact)
trigger18 = (stateno = 640) && (Movecontact)
trigger19 = (stateno = 650) && (Movecontact)
trigger20 = (stateno = 420) && (Movecontact)
trigger21 = (stateno = 620) && (Movecontact)
;---------------------------------------------------------------------------
; Wrench Counter
[State -1, Wrench Counter]
type = ChangeState
value = 1048
Triggerall = command = "Wrench_Counter"
Triggerall = Numhelper(1010) = 0
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Throw The Test Tube air
[State -1, Throw The Test Tube air]
type = ChangeState
value = 1061
triggerall = command = "Throw_The_Test_Tube"
trigger1 = (StateType = A) && (Ctrl) && stateno != 950
trigger2 = stateno = 600
trigger3 = stateno = 610
trigger4 = stateno = 620
trigger5 = stateno = 630
trigger6 = stateno = 640
trigger7 = stateno = 650
trigger8 = stateno = 1047 && time > 5
;---------------------------------------------------------------------------
; Throw The Test Tube
[State -1, Throw The Test Tube]
type = ChangeState
value = 1060
triggerall = command = "Throw_The_Test_Tube"
trigger1 = (StateType = S) && (Ctrl)
;---------------------------------------------------------------------------
; Gravity Gauntlet
;[State -1, Gravity Gauntlet]
;type = ChangeState
;value = 1050
;triggerall = command = "Gravity_Gauntlet"
;trigger1 = statetype = S
;trigger1 = ctrl
;trigger2 = stateno = 200 && movecontact
;trigger3 = stateno = 210 && movecontact
;trigger4 = stateno = 220 && movecontact
;trigger5 = stateno = 230 && movecontact
;trigger6 = stateno = 240 && movecontact
;trigger7 = stateno = 250 && movecontact
;trigger8 = stateno = 400 && movecontact
;trigger9 = stateno = 410 && movecontact
;trigger10 = stateno = 430 && movecontact
;trigger11 = stateno = 440 && movecontact
;trigger12 = stateno = 450 && movecontact
;---------------------------------------------------------------------------
;Fire Gun Shooting
[State -1, Fire Gun Shooting]
type = ChangeState
value = 1006
Triggerall = command = "Fire_Gun"
Triggerall = Numhelper(1010) = 0
Triggerall = Numhelper(1007) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact
trigger10 = stateno = 430 && movecontact
trigger11 = stateno = 440 && movecontact
trigger12 = stateno = 450 && movecontact
;---------------------------------------------------------------------------
;Fire Gun Shooting air
[State -1, Fire Gun Shooting air]
type = ChangeState
value = 1011
Triggerall = command = "Fire_Gun"
Triggerall = Numhelper(1010) = 0
Triggerall = Numhelper(1007) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 1047 && time > 5
;---------------------------------------------------------------------------
; Laser Pen
[State -1, Laser Pen]
type = ChangeState
value = 1010
triggerall = command = "Laser_Pen"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Ray Gun
[State -1, Ray Gun]
type = ChangeState
value = 1000
Triggerall = command = "Ray_Gun"
Triggerall = Numhelper(1010) = 0
Triggerall = Numhelper(1007) = 0
trigger1 = Statetype != A && ctrl
trigger2 = (StateType != A) && (HitdefAttr = SC, NA) && (MoveContact) && ctrl
trigger3 = ctrl
trigger4 = stateno = 1047 && time > 5
;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = Command = "SJ"
trigger1 = StateType = S
trigger1 = ctrl
;-----------------------------
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = Command = "holdup"
trigger1 = stateno = 420 && MoveHit
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = ctrl
triggerall = statetype = S
triggerall = P2BodyDist X <= 25
triggerall = command = "holdfwd" || command = "holdback"
trigger1 = command = "x" && command = "y"
trigger2 = command = "y" && command = "z"
trigger3 = command = "x" && command = "z"
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
;===========================================================================
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 410 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 200 && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = (StateType = S) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 410 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 410 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 440 && movecontact

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 410 && movecontact
trigger5 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = (StateType = C) && (Ctrl)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 400 && movecontact
trigger7 = stateno = 410 && movecontact
trigger8 = stateno = 430 && movecontact
trigger9 = stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = (StateType = A) && (Ctrl)
;---------------------------------------------------------------------------
;Jump Medium Punch (Brass Knuckles)
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = (StateType = A) && (Ctrl)
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 630 && movecontact
;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = (StateType = A) && (Ctrl)
trigger2 = stateno = 610 && Movecontact
trigger3 = stateno = 600 && Movecontact
trigger4 = stateno = 630 && Movecontact
trigger5 = stateno = 640 && Movecontact
trigger6 = stateno = 650 && Movecontact
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = (StateType = A) && (Ctrl)
trigger2 = stateno = 600 && movecontact

;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = (StateType = A) && (Ctrl)
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 630 && movecontact
;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = (StateType = A) && (Ctrl)
trigger2 = stateno = 610 && Movecontact
trigger3 = stateno = 600 && Movecontact
trigger4 = stateno = 630 && Movecontact
trigger5 = stateno = 640 && Movecontact
