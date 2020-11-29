------------------------- MODULE wolf_goat_cabbage -----------------------------

VARIABLES left, right

Actors == { "farmer", "wolf", "goat", "cabbage" }

Lunchtime(bank) == bank = {"wolf", "goat"} \/ bank = {"goat", "cabbage"}

Peace == ~Lunchtime(left') /\ ~Lunchtime(right')

Transport(item, from, to) ==
	/\ from' = from \ {"farmer", item}
	/\ to' = to \cup {"farmer", item}

Pick(from, to) == "farmer" \in from /\ \E item \in from:
	Transport(item, from, to) /\ Peace

Init == left = Actors /\ right = {}

Next == Pick(left, right) \/ Pick(right, left)

Spec == Init /\ [][Next]_<<left,right>>

Solution == right /= Actors

================================================================================
